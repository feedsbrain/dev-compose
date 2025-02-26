# dev-compose
This repo contains collections of docker compose files that I use daily on my development machine.

Before we run any of the docker compose script in this repository, we need to create `.env` file on the root of this project. Please refer to `.env.template` file and fill in the required environment variables based on the stack or compose file we need.

After setting up the `.env` file, to run the docker compose script, navigate insite the folder of docker compose file that we want to execute, and then we need to specify the environment variables file location in the `docker-compose up` command as this example:

```
$ docker-compose --env-file ../.env up 
```

For the development purposes, I usually dedicate a path to store all of my running docker container persistent volumes. And for that purpose, we need to set the environment variable:

```
BASE_VOLUME_DIR=/home/docker/volumes
```

Feel free to change the path to our preference and I usually just make the path to be available for read and write for all users:

```
$ sudo chmod 777 /home/docker/volumes
```

The docker compose file for `open-webui` and `stable-diffusion-webui` are tailored for AMD GPU, specifically Radeon RX 6800 series. This are the best value for used GPU that equiped with 16 GB of VRAM.
