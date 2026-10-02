#!/bin/sh
set -eu

cd /var/www/html

if [ ! -f /opt/laravel/artisan ]; then
    echo "Application image is missing /opt/laravel/artisan" >&2
    exit 1
fi

mkdir -p /var/www/html
rsync -a --delete --exclude=/storage/app/public/ /opt/laravel/ /var/www/html/

# Uploads are mounted at storage/app/public by Compose. The link is recreated
# on every container start and never changes or removes the mounted files.
if [ -e public/storage ] && [ ! -L public/storage ]; then
    echo "public/storage exists and is not a symbolic link; refusing to replace it" >&2
    exit 1
fi
ln -sfn ../storage/app/public public/storage

mkdir -p storage/app/public storage/framework/cache storage/framework/sessions storage/framework/views storage/logs bootstrap/cache
chown -R www-data:www-data storage bootstrap/cache
chmod -R ug+rwX storage bootstrap/cache

exec "$@"
