#!/usr/bin/env sh

set -euf

if ! command -v gotestsum >/dev/null; then
  go install gotest.tools/gotestsum@v1.9.0
fi

echo '+++ Running tests'
gotestsum --junitfile "junit-${BUILDKITE_JOB_ID}.xml" -- -count=1 -failfast "$@" ./...
