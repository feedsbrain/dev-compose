# dev-compose
This repo contains collections of docker compose files that I use daily on my development machine.

When running the docker compose, we need to specify the environment variables file on the `docker-compose up` command i.e:

```
$ docker-compose --env-file ./config/.env.dev up 
```

For the development purposes, I usually dedicate a path to store all of my running docker container persistent volumes. And for that purpose, we need to set the environment variable:

```
BASE_VOLUME_DIR=/home/docker/volumes
```

Feel free to change the path to your preference and I usually just make the path to be available for read and write for all users:

```
$ sudo chmod 777 /home/docker/volumes
```