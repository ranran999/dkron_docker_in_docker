FROM dkron/dkron
ENV DOCKER_CLIENT_VERSION=20.10.8
ENV DOCKER_API_VERSION=1.41
RUN wget -O - https://download.docker.com/mac/static/stable/x86_64/docker-${DOCKER_CLIENT_VERSION}.tgz \
    | tar -xzC /usr/local/bin --strip=1 docker/docker
