# Base-common-docker

Simple docker-compose configuration to run API&UI containers simultaneously.

## Setup
1) clone `base-api-app` into `./projects/api`*
2) clone `base-react-app` into `./projects/ui`*
3) run `sudo docker-compose build`
4) run `sudo docker-compose up`
5) **Open in browser [localhost:3000](http://localhost:3000)**

## Containers
- `database-postgres` - Postgres 14 database
- `php`- Symfony API (default on port `8001`)
- `nginx` - host
- `ui` - react application in development mode linked with API (default on port `3000`)


## Tips

Migrations in the database are performed automatically.\
Use `sudo docker exec -it php php bin/console doctrine:fixtures:load --no-interaction --purge-with-truncate` to install sample data into database.

### Links

https://github.com/szelep/base-api-platform

https://github.com/szelep/base-react-api-integration
