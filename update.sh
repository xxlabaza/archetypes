#!/usr/bin/env sh

set -e


CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


${CURRENT_DIR}/install.sh
${CURRENT_DIR}/test.sh
