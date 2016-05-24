FROM gcr.io/google_appengine/base
MAINTAINER Leonardo Saraiva <vyper@maneh.org>

RUN apt-get update \
    && apt-get install -y --no-install-recommends openjdk-7-jre-headless wget unzip \
    && wget "https://storage.googleapis.com/gcd/tools/gcd-grpc-head.zip" \
    && mkdir -p /opt/google \
    && unzip gcd-grpc-head.zip -d /opt/google \
    && mv /opt/google/gcd /opt/google/gcd-grpc-head \
    && rm gcd-grpc-head.zip \
    && apt-get clean

RUN /opt/google/gcd-grpc-head/gcd.sh create /opt/google/gcd-grpc-head/data

EXPOSE 8181

CMD ["/opt/google/gcd-grpc-head/gcd.sh", "start", "-p", "8181", "-a", "0.0.0.0", "/opt/google/gcd-grpc-head/data"]
