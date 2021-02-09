#!/bin/sh

set -o pipefail

# comment-on-pr parameter from the action
if [ "$2" == "true" ]; then
    pcvalidate "$1" | reviewdog -efm="%f:%l:%c: %m" -reporter=github-pr-review -tee
else
    pcvalidate "$1"
fi
