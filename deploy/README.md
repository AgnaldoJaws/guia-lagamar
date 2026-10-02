# Produção: Docker

A produção usa uma stack Docker simples e persistente:

```text
Internet -> Caddy -> Nginx -> PHP 8.3-FPM / Laravel -> MySQL 8
```

Somente o Caddy publica portas no host: `80:80`, `443:443` e `443:443/udp`.
Nginx, PHP-FPM e MySQL ficam apenas na rede Docker `guia-lagamar-proxy`.

Não há Blue/Green, `active.caddy`, troca dinâmica de proxy, slots ou
configuração temporária de 503 durante deploy.

## Preparação única da Droplet

1. Crie `/opt/guia-lagamar` com posse do usuário de deploy. O workflow copia
   as pastas versionadas `deploy/` e `docker/` para esse diretório em cada
   deploy; ele não executa `git pull` no host.
2. Mantenha `/opt/guia-lagamar/.env` fora do repositório, com as variáveis de
   produção do Laravel e do MySQL:

   ```dotenv
   APP_ENV=production
   APP_DEBUG=false
   APP_URL=https://passaronegro.com.br
   DB_CONNECTION=mysql
   DB_HOST=mysql
   DB_PORT=3306
   DB_DATABASE=guialagamar
   DB_USERNAME=guialagamar
   DB_PASSWORD=troque-isto
   DB_ROOT_PASSWORD=troque-isto-tambem
   ```

3. Garanta que o DNS de `passaronegro.com.br` aponta para a Droplet e que as
   portas 80/443 estão abertas para o Caddy emitir/renovar TLS.
4. Configure no GitHub os secrets `PRODUCTION_HOST`, `PRODUCTION_USER`,
   `PRODUCTION_SSH_KEY` e `GHCR_TOKEN`. O `GHCR_TOKEN` precisa de
   `read:packages` para o `docker login` remoto.

## Volumes persistentes

Os volumes existentes são preservados:

```text
guia-lagamar-mysql-data
guia-lagamar-uploads
guia-lagamar-caddy-data
guia-lagamar-caddy-config
```

A stack também usa `guia-lagamar-app-code`, um volume de runtime preenchido a
partir da imagem PHP-FPM. Ele permite que Nginx e PHP-FPM enxerguem a mesma
árvore `/var/www/html` sem bind mount do código-fonte da Droplet. Esse volume
não contém banco nem uploads.

Nunca use `docker compose down -v` em produção.

## Deploy

O push em `main`:

1. executa checkout, dependências, testes e build frontend;
2. constrói a imagem PHP 8.3-FPM;
3. publica `ghcr.io/agnaldojaws/guia-lagamar:<SHA>`;
4. remove e recopia somente `/opt/guia-lagamar/deploy` e
   `/opt/guia-lagamar/docker`;
5. executa `deploy/deploy.sh <imagem>` via SSH.

O script remoto faz `pull`, garante MySQL/app, executa migrations e caches,
sobe Nginx/Caddy e valida:

```text
http://nginx/up
https://passaronegro.com.br/up
https://passaronegro.com.br/admin/login
assets CSS/JS do Filament
ausência de URLs http://passaronegro.com.br no login
```

Rollback manual para uma imagem já publicada:

```bash
cd /opt/guia-lagamar
IMAGE_REPOSITORY=ghcr.io/agnaldojaws/guia-lagamar ./deploy/deploy.sh <SHA-anterior>
```

Rollback de imagem não desfaz migrations. Faça backup do banco antes de
migrations arriscadas.

## Primeira migração Apache -> FPM + Nginx

Após um deploy saudável da nova stack, remova manualmente containers órfãos
antigos, como `guia-lagamar-app-blue`. Não remova volumes persistentes.

Para inspecionar a stack:

```bash
cd /opt/guia-lagamar
APP_IMAGE=ghcr.io/agnaldojaws/guia-lagamar:<SHA> docker compose --env-file .env -f deploy/docker-compose.prod.yml config
APP_IMAGE=ghcr.io/agnaldojaws/guia-lagamar:<SHA> docker compose --env-file .env -f deploy/docker-compose.prod.yml ps
```
