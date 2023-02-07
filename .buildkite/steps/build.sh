#!/usr/bin/env sh

set -euf

buildctl --addr kube-pod://buildkitd-0 build --frontend dockerfile.v0 --local context=. --local dockerfile=./Dockerfile
