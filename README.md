# dim.one
dim.one personal app

## Environment variables
```shell script
# in app directory
cp docker/.env.dev docker/.env
```
or
```shell script
# in app directory
cp docker/.env.prod docker/.env
```

## Docker Compose
```shell script
# in app directory
docker-compose up --build -d
```
or
```shell script
# in app directory
docker-compose -f docker-compose.prod.yml up --build -d
```

## Install dependencies
```shell script
# php container
composer install
yarn install
```

## Build assets
```shell script
# php container
yarn encore dev
```
or
```shell script
# php container
yarn encore production
```

## Maintenance mode
Switch on/off:
```shell script
# nginx container
sh /opt/dim/bin/maintenance.sh
```
