#!/bin/sh

set -o pipefail

# comment-on-pr parameter from the action
if [ "$2" == "true" ]; then
    publiccode-parser "$1" | reviewdog -efm="%f:%l:%c: %t%*[^:]: %m" -reporter=github-pr-review -tee
else
    publiccode-parser "$1"
 fi
