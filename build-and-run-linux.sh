#!/bin/bash

set -e

DOCKER_BUILDKIT=1 docker build --ssh default -t buildkit-ssh-sample:latest .
docker run --rm buildkit-ssh-sample:latest
