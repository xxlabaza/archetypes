#!/usr/bin/env sh

set -e


CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SHELL_SCRIPTS_DIRECTORY="${HOME}/.m2/bin/"
FISH_SCRIPTS_DIRECTORY="${HOME}/.config/fish/functions/"


if [ ! -d "${SHELL_SCRIPTS_DIRECTORY}" ]; then
  mkdir -p "${SHELL_SCRIPTS_DIRECTORY}"
fi


find "${CURRENT_DIR}" -name "pom.xml" -mindepth 2 -maxdepth 2 | while read POM_PATH; do
  POM_DIRECTORY=`dirname "${POM_PATH}"`
  echo "Installing ${POM_DIRECTORY}"
  ( cd "${POM_DIRECTORY}" ; ./mvnw clean install clean )

  if [ -d "${POM_DIRECTORY}/scripts" ]; then
    cp ${POM_DIRECTORY}/scripts/*.sh "${SHELL_SCRIPTS_DIRECTORY}"

    if [ -d "${FISH_SCRIPTS_DIRECTORY}" ]; then
      mkdir -p "${FISH_SCRIPTS_DIRECTORY}"
      cp ${POM_DIRECTORY}/scripts/*.fish "${FISH_SCRIPTS_DIRECTORY}"
    fi
  fi
done


chmod +x ${SHELL_SCRIPTS_DIRECTORY}/*.sh
