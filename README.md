# dim.one
dim.one personal page

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
