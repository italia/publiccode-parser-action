#!/bin/sh

set -o pipefail

EXTRA_ARGS=""

if [ "$3" == "true" ]; then
    EXTRA_ARGS="$EXTRA_ARGS --no-network"
fi

if [ "$4" == "true" ]; then
    EXTRA_ARGS="$EXTRA_ARGS --no-external-checks"
fi

# comment-on-pr parameter from the action
if [ "$2" == "true" ]; then
    publiccode-parser $EXTRA_ARGS "$1" | reviewdog -efm="%f:%l:%c: %t%*[^:]: %m" -reporter=github-pr-review -tee
else
    publiccode-parser $EXTRA_ARGS "$1"
fi
