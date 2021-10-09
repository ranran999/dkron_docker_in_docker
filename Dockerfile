FROM dkron/dkron
ENV DOCKER_CLIENT_VERSION=20.10.8
ENV DOCKER_API_VERSION=1.40
RUN wget -O - https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_CLIENT_VERSION}.tgz \
    | tar -xzC /usr/local/bin --strip=1 docker/docker
RUN apk --update add tzdata && \
    cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    apk del tzdata && \
    rm -rf /var/cache/apk/*