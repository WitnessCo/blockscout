FROM alpine:3.14

COPY --from=library/docker:latest /usr/local/bin/docker /usr/bin/docker
COPY --from=docker/compose:latest /usr/local/bin/docker-compose /usr/bin/docker-compose

WORKDIR /app

COPY . /app

# Set the environment variable and run docker compose
CMD cd docker-compose && DOCKER_REPO=blockscout-optimism docker-compose -v /var/run/docker.sock:/var/run/docker.sock -f /app/docker-compose/geth.yml up
