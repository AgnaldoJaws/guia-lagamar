# Produção: Docker

O host só precisa de Docker Engine e do plugin `docker compose`. O usuário de
deploy deve poder executar `docker` (por exemplo, estar no grupo `docker`).
PHP, Composer, Node e as dependências da aplicação não são instalados na
Droplet. MySQL 8.0.43 roda em um único container e não expõe a porta 3306.

## Preparação única da Droplet

1. Crie `/opt/guia-lagamar` com posse do usuário de deploy e copie para lá as
   pastas `deploy/` e `docker/` deste repositório. O workflow atualiza essas
   duas pastas por SSH em cada deploy; ele **não** executa `git pull` no host.
2. Crie `/opt/guia-lagamar/.env`, fora do repositório, com as variáveis
   normais de produção do Laravel (`APP_KEY`, `APP_URL`, `DB_CONNECTION`,
   `DB_DATABASE`, `DB_USERNAME`, `DB_PASSWORD`, `DB_ROOT_PASSWORD`, etc.) e:

   ```dotenv
   APP_ENV=production
   APP_DEBUG=false
   DB_CONNECTION=mysql
   DB_HOST=mysql
   DB_PORT=3306
   DB_DATABASE=guialagamar
   DB_USERNAME=guialagamar
   DB_PASSWORD=troque-isto
   DB_ROOT_PASSWORD=troque-isto-tambem
   ```

   DNS de `passaronegro.com.br` deve apontar para a Droplet e as portas 80/443
   devem estar abertas antes do primeiro deploy para que Caddy emita o
   certificado.
3. No repositório GitHub, configure `PRODUCTION_HOST`, `PRODUCTION_USER`,
   `PRODUCTION_SSH_KEY` e `GHCR_TOKEN`. `GHCR_TOKEN` é um PAT do usuário de
   deploy com `read:packages`; ele é usado apenas para o `docker login` remoto.
   Garanta que o pacote GHCR permita leitura para esse token.

O Compose força `DB_HOST=mysql` e `DB_PORT=3306` nos containers Laravel. As
credenciais continuam exclusivamente no `.env`; elas também inicializam o
container MySQL na primeira vez em que o volume estiver vazio.

O volume Docker nomeado `guia-lagamar-uploads` é montado em
`storage/app/public`. Portanto os uploads não pertencem à imagem nem são
removidos quando o container da aplicação é atualizado. O link
`public/storage` é reconstruído idempotentemente na inicialização.

O MySQL persiste em outro volume nomeado, `guia-lagamar-mysql-data`, montado
em `/var/lib/mysql`. O deploy usa `pull`, `run` e `up` apenas para a aplicação;
nunca usa `docker compose down -v`.

## Bootstrap, restauração e backup do MySQL

No provisionamento inicial, inicie Caddy e MySQL uma única vez antes do
primeiro deploy da aplicação:

```bash
cd /opt/guia-lagamar
docker compose --env-file .env -f deploy/docker-compose.prod.yml up -d caddy mysql
```

O MySQL cria `DB_DATABASE` e `DB_USERNAME` a partir do `.env` somente quando o
volume `guia-lagamar-mysql-data` está vazio. Os deploys seguintes não recriam
Caddy ou MySQL.

Para restaurar o dump existente **em uma instalação nova, antes do primeiro
deploy da aplicação**, inicie somente o banco após as pastas de infraestrutura
terem sido enviadas:

```bash
cd /opt/guia-lagamar
docker compose --env-file .env -f deploy/docker-compose.prod.yml up -d mysql
docker inspect --format '{{.State.Health.Status}}' guia-lagamar-mysql
gzip -dc /opt/backups/backup-cc90e88d6526227234430ac4339c2d15.sql.gz \
  | docker exec -i guia-lagamar-mysql sh -c 'exec mysql -uroot -p"$DB_ROOT_PASSWORD"'
```

Espere o status `healthy` antes da restauração. O dump deve ser aplicado uma
única vez; restaurá-lo sobre um banco já utilizado pode sobrescrever dados. Se
o arquivo não contiver `CREATE DATABASE`/`USE guialagamar`, acrescente o nome
do banco ao final do comando `mysql`.

Para gerar backup consistente:

```bash
mkdir -p /opt/backups
docker exec guia-lagamar-mysql sh -c \
  'exec mysqldump -uroot -p"$DB_ROOT_PASSWORD" --single-transaction --routines --triggers "$DB_DATABASE"' \
  | gzip > /opt/backups/guialagamar-$(date +%F-%H%M%S).sql.gz
```

Em rollback de aplicação, o banco e o volume MySQL não são reiniciados nem
restaurados: apenas a imagem Laravel volta para um SHA anterior. Migrations
não sofrem rollback automático; mantenha migrations compatíveis entre versões
ou restaure um backup do banco somente por procedimento operacional separado.

## Deploy

O push em `main` publica `ghcr.io/agnaldojaws/guia-lagamar:<SHA>` e chama o
script remoto. Ele faz pull da imagem, executa `php artisan migrate --force`
em um container temporário e executa `docker compose up -d app`. Caddy e MySQL
não são recriados ou recarregados.

Para voltar manualmente a uma imagem SHA já publicada, execute o mesmo deploy:

```bash
cd /opt/guia-lagamar
IMAGE_REPOSITORY=ghcr.io/agnaldojaws/guia-lagamar ./deploy/deploy.sh <SHA-anterior>
```

Esse procedimento não desfaz migrations; mantenha migrations compatíveis com
as versões anteriores quando precisar voltar uma imagem.
