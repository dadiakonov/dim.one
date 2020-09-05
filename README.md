# dim.one

App for personal usage

## Requirements

- [docker-ce](https://docs.docker.com/engine/install/)
- [docker-compose](https://docs.docker.com/compose/install/)

## Installation

### Clone the repository
```shell script
mkdir dim && \
cd dim && \
git clone git@github.com:dadiakonov/dim.one.git .
```

### Set up environment variables
```shell script
# in app directory
cp docker/.env.dev docker/.env
```
or
```shell script
# in app directory
cp docker/.env.prod docker/.env
```

### Run docker containers
```shell script
# in app directory
docker-compose up --build -d
```
or
```shell script
# in app directory
docker-compose -f docker-compose.prod.yml up --build -d
```

### Install dependencies
```shell script
# php container
composer install
yarn install
```

### Build assets
```shell script
# php container
yarn encore dev
```
or
```shell script
# php container
yarn encore production
```

## Usage

### Maintenance mode
Switch on/off:
```shell script
# nginx container
sh /opt/dim/bin/maintenance.sh
```
