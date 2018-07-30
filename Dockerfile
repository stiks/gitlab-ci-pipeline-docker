FROM dockerphp/gitlab-ci-pipeline:7.1-alpine

ARG DOCKER_CLI_VERSION="18.06.0-ce"
ENV DOWNLOAD_URL="https://download.docker.com/linux/static/stable/x86_64/docker-$DOCKER_CLI_VERSION.tgz"

# install docker client
RUN apk --update add mysql-client aws-cli \
    && docker-php-ext-install bcmath \
    && mkdir -p /tmp/download \
    && curl -L $DOWNLOAD_URL | tar -xz -C /tmp/download \
    && mv /tmp/download/docker/docker /usr/local/bin/ \
    && rm -rf /tmp/download \
    && rm -rf /var/cache/apk/* \
    && composer global require hirak/prestissimo
