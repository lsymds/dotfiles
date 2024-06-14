sudo apt install -y docker.io docker-buildx
sudo usermod -aG docker ${USER}

DOCKER_COMPOSE_VERSION="2.27.0"
DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
mkdir -p $DOCKER_CONFIG/cli-plugins
curl -sSL https://github.com/docker/compose/releases/download/v$DOCKER_COMPOSE_VERSION/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose
chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose
