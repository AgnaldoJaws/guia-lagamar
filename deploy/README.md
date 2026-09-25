# Produção: Docker + Blue/Green

O host só precisa de Docker Engine e do plugin `docker compose`. O usuário de
deploy deve poder executar `docker` (por exemplo, estar no grupo `docker`).
PHP, Composer, Node e as dependências da aplicação não são instalados na
Droplet.

## Preparação única da Droplet

1. Crie `/opt/guia-lagamar` com posse do usuário de deploy e copie para lá as
   pastas `deploy/` e `docker/` deste repositório. O workflow atualiza essas
   duas pastas por SSH em cada deploy; ele **não** executa `git pull` no host.
2. Crie `/opt/guia-lagamar/.env`, fora do repositório, com as variáveis
   normais de produção do Laravel (`APP_KEY`, `APP_URL`, `DB_CONNECTION`,
   `DB_HOST`, `DB_PORT`, `DB_DATABASE`, `DB_USERNAME`, `DB_PASSWORD`, etc.) e:

   ```dotenv
   APP_ENV=production
   APP_DEBUG=false
   APP_DOMAIN=example.com
   ```

   `APP_DOMAIN` deve ser somente o hostname público, sem `https://`. DNS deve
   apontar para a Droplet e as portas 80/443 devem estar abertas antes do
   primeiro deploy para que Caddy emita o certificado.
3. No repositório GitHub, configure `PRODUCTION_HOST`, `PRODUCTION_USER`,
   `PRODUCTION_SSH_KEY` e `GHCR_TOKEN`. `GHCR_TOKEN` é um PAT do usuário de
   deploy com `read:packages`; ele é usado apenas para o `docker login` remoto.
   Garanta que o pacote GHCR permita leitura para esse token.

O volume Docker nomeado `guia-lagamar-uploads` é montado em
`storage/app/public` nos dois slots. Portanto os uploads não pertencem à
imagem nem são removidos quando o container anterior para. O link
`public/storage` é reconstruído idempotentemente na inicialização.

## Deploy e rollback

O push em `main` publica `ghcr.io/<owner>/guia-lagamar:<SHA>` e chama o script
remoto. Para rollback manual, use uma tag SHA já publicada:

```bash
cd /opt/guia-lagamar
IMAGE_REPOSITORY=ghcr.io/<owner>/guia-lagamar ./deploy/deploy.sh <SHA-anterior>
```

O rollback troca novamente o tráfego via Blue/Green. Ele não desfaz migrations:
as migrations de cada release precisam ser compatíveis com a versão anterior
(estratégia expand/contract para alterações destrutivas).

O script inicia o slot inativo, aguarda `/up`, executa `storage:link`,
`migrate --force` e `optimize`, testa novamente e só então recarrega Caddy para
o novo slot. Em falha, o slot candidato é removido e o ativo permanece no ar.
