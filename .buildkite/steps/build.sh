#!/usr/bin/env sh

set -euf

docker buildx create --name remote --driver remote --driver-opt cacert=/buildkit/certs/ca.pem,cert=/buildkit/certs/cert.pem,key=/buildkit/certs/key.pem tcp://buildkitd.buildkite.svc:1234
docker buildx use remote
docker buildx build --progress=plain --tag="go-example:${BUILDKITE_COMMIT}" --platform=linux/amd64 .
