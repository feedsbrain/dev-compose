# dev-compose
This repo contains collections of docker compose files that I use daily on my development machine.

When running the docker compose, we need to specify the environment variables file on the `docker-compose up` command i.e:

```
$ docker-compose --env-file ./config/.env.dev up 
```