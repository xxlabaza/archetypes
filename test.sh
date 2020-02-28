#!/usr/bin/env sh

set -e


CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
TEST_DIRECTORY="${CURRENT_DIR}/test"
SHELL_SCRIPTS_DIRECTORY="${HOME}/.m2/bin"
SCRIPT_NAMES=( "jpure.sh" "jboot.sh" "jcloud.sh" )


if [ -d "${TEST_DIRECTORY}" ]; then
  rm -rf "${TEST_DIRECTORY}"
fi
mkdir -p "${TEST_DIRECTORY}"


for SCRIPT_NAME in "${SCRIPT_NAMES[@]}"
do
  SCRIPT="${SHELL_SCRIPTS_DIRECTORY}/${SCRIPT_NAME}"
  ( cd "${TEST_DIRECTORY}" ; "${SCRIPT}" -a removeme )
  ( cd "${TEST_DIRECTORY}/removeme" ; ./mvnw verify )
  rm -rf "${TEST_DIRECTORY}/removeme"
done

rm -rf "${TEST_DIRECTORY}"
