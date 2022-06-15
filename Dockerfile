FROM anchore/syft:latest as build

FROM alpine:latest

# RUN apk add docker-cli
RUN apk add --update --no-cache docker-cli && rm -rf /var/cache/apk/*

# create the /tmp dir, which is needed for image content cache
WORKDIR /tmp

COPY --from=build /syft /

ENTRYPOINT ["/syft"]
