#!/bin/bash

set -e

docker build -t esm .
docker run -p 8080:80 --rm esm --dev