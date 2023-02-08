#!/usr/bin/env sh

set -euf

docker buildx create --name remote-buildkit --driver remote --driver-opt cacert=/buildkit/certs/ca.pem,cert=/buildkit/certs/cert.pem,key=/buildkit/certs/key.pem tcp://buildkitd.default.svc:1234 --use
trap "docker buildx rm remote0buildkit" EXIT

docker buildx build --tag="go-example:${BUILDKITE_COMMIT}" --platform=linux/amd64
