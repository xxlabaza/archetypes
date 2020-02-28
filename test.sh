#!/usr/bin/env bash

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
  echo "--- Test the '${SCRIPT_NAME}'"
  SCRIPT="${SHELL_SCRIPTS_DIRECTORY}/${SCRIPT_NAME}"

  echo ""
  echo "-- Generate a 'removeme' project"
  echo ""
  ( cd "${TEST_DIRECTORY}" ; "${SCRIPT}" -a removeme )

  echo ""
  echo "-- Build and verify the project"
  echo ""
  ( cd "${TEST_DIRECTORY}/removeme" ; ./mvnw -B --quiet verify )

  echo ""
  echo "-- Remove the project's directory"
  echo ""
  rm -rf "${TEST_DIRECTORY}/removeme"
done

rm -rf "${TEST_DIRECTORY}"
