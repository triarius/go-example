#!/usr/bin/env sh

set -euf

builder=$(docker buildx create --driver kubernetes --use)
# shellcheck disable=SC2064 # we want the current $builder_name to be trapped, not the runtime one
trap "docker buildx rm $builder || true" EXIT

docker buildx build --progress=plain --builder "$builder" .
