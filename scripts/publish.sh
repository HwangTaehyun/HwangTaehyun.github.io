#! /bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
PROJ_DIR="$( realpath $DIR/.. )"

bundle exec jekyll serve
