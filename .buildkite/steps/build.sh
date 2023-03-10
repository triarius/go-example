#!/usr/bin/env sh

set -euf

apk add docker-cli-buildx

docker buildx create \
  --name remote \
  --driver remote \
  --driver-opt cacert=/buildkit/certs/ca.pem,cert=/buildkit/certs/cert.pem,key=/buildkit/certs/key.pem \
  tcp://buildkitd.buildkite.svc:1234 \
  --use
docker buildx build --progress=plain --tag="go-example:${BUILDKITE_COMMIT}" --platform=linux/amd64 .
