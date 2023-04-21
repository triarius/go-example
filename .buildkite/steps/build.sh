#!/usr/bin/env sh

set -euf

repo=253213882263.dkr.ecr.ap-southeast-2.amazonaws.com

echo --- :hammer: Installing Tools
apk add --update-cache --no-progress aws-cli

docker buildx create \
  --name remote \
  --driver remote \
  --driver-opt cacert=/buildkit/certs/ca.pem,cert=/buildkit/certs/cert.pem,key=/buildkit/certs/key.pem \
  tcp://buildkitd:1234 \
  --use

echo --- :ecr: Logging into ECR
aws ecr get-login-password --region ap-southeast-2 |
  docker login \
    --username AWS \
    --password-stdin \
    "$repo"

echo --- :docker: Building Image
docker buildx build --progress=plain --tag="$repo/go-example:${BUILDKITE_COMMIT}" --push --platform=linux/amd64,linux/arm64 .
