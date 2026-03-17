#!/bin/sh

set -o pipefail

PUBLICCODE_YML_PATH="$1"
COMMENT_ON_PR="$2"
NO_NETWORK="$3"
NO_EXTERNAL_CHECKS="$4"

EXTRA_ARGS=""

if [ "$NO_NETWORK" == "true" ]; then
    EXTRA_ARGS="$EXTRA_ARGS --no-network"
fi

if [ "$NO_EXTERNAL_CHECKS" == "true" ]; then
    EXTRA_ARGS="$EXTRA_ARGS --no-external-checks"
fi

if [ "$COMMENT_ON_PR" == "true" ]; then
    publiccode-parser $EXTRA_ARGS "$PUBLICCODE_YML_PATH" | reviewdog -efm="%f:%l:%c: %t%*[^:]: %m" -reporter=github-pr-review -tee
else
    publiccode-parser $EXTRA_ARGS "$PUBLICCODE_YML_PATH"
fi
