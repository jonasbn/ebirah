#!/bin/bash

# REF:http://jonasbn.github.io/til/bash/write_safe_shell_scripts.html
set -euf -o pipefail

# run ebirah docker image in current directory and cleanup the image afterwards
docker run --rm --volume $PWD:/tmp ebirah "$@"
