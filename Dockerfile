FROM openjdk:8u151-jdk-alpine AS resource
RUN apk add --no-cache bash tzdata ca-certificates
# https://github.com/concourse/concourse/issues/2042
RUN unlink  $JAVA_HOME/jre/lib/security/cacerts && \
    cp /etc/ssl/certs/java/cacerts $JAVA_HOME/jre/lib/security/cacerts
RUN mkdir -p /assets
# WORKDIR /assets
COPY ./assets /opt/resource/
RUN chmod +x /opt/resource/mvnw