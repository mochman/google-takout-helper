FROM python:3.9-alpine
ARG LOCAL_VERSION
LABEL maintainer="Luke Moch" \
			name="google-takeout-helper" \
			version=$LOCAL_VERSION \
			gpth-version="v2.0.0rc1"

COPY docker-entrypoint.sh /

RUN apk upgrade --no-cache musl
RUN pip3 install -U google-photos-takeout-helper==2.0.0rc1

RUN mkdir -m777 /photosIn /photosOut

VOLUME ["/photosIn", "/photosOut"]

ENTRYPOINT ["/bin/sh", "/docker-entrypoint.sh"]
