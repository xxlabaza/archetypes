#!/usr/bin/env bash


GROUP_ID="com.xxlabaza.test"
ARTIFACT_ID=""
VERSION="1.0.0"
PACKAGE=""
SPRING_BOOT_VERSION="2.5.2"
INTERACTIVE="NO"
DEBUG="NO"
POSITIONAL_PARAMETERS=()



function parse_parameters () {
  while [[ ${#} -gt 0 ]]
  do
    case "${1}" in
      -g|--group)
        GROUP_ID="${2}"
        shift # past argument
        shift # past value
        ;;
      -a|--artifact)
        ARTIFACT_ID="${2}"
        shift # past argument
        shift # past value
        ;;
      -v|--version)
        VERSION="${2}"
        shift # past argument
        shift # past value
        ;;
      -p|--package)
        PACKAGE="${2}"
        shift # past argument
        shift # past value
        ;;
      -b|--spring-boot)
        SPRING_BOOT_VERSION="${2}"
        shift # past argument
        shift # past value
        ;;
      -i|--interactive)
        INTERACTIVE="YES"
        shift # past argument
        ;;
      -d|--debug)
        DEBUG="YES"
        shift # past argument
        ;;
      --) # end argument parsing
        shift
        break
        ;;
      -*|--*=) # unsupported flags
        echo "ERROR: Unsupported flag ${1}" >&2
        exit 1
        ;;
      *)    # unknown option
        POSITIONAL+=("${1}") # save it in an array for later
        shift # past argument
        ;;
    esac
  done
  set -- "${POSITIONAL_PARAMETERS[@]}" # restore positional parameters
}

function validate_parameters () {
  if [ -z "${ARTIFACT_ID}" ]; then
    echo "ERROR: Artifact ID (-a|--artifact option) is mandatory and must be set" >&2
    exit 1
  fi

  if [ "${INTERACTIVE}" == "NO" ]
  then
    BATCH_MODE="-DinteractiveMode=false"
  else
    BATCH_MODE="-DinteractiveMode=true"
  fi

  if [ -z "${PACKAGE}" ]
  then
    PARSED_GROUP_ID=`echo "$GROUP_ID" | sed 's/-/./g'`
    PARSED_ARTIFACT_ID=`echo "$ARTIFACT_ID" | sed 's/-/./g'`
    PACKAGE="${PARSED_GROUP_ID}.${PARSED_ARTIFACT_ID}"
  fi
}

function print_debug_info () {
  echo GROUP_ID = "${GROUP_ID}"
  echo ARTIFACT_ID = "${ARTIFACT_ID}"
  echo VERSION = "${VERSION}"
  echo PACKAGE = "${PACKAGE}"
  echo SPRING_BOOT_VERSION = "${SPRING_BOOT_VERSION}"
  echo INTERACTIVE = "${INTERACTIVE}"
}



parse_parameters ${@}
validate_parameters
if [ "${DEBUG}" == "YES" ]
then
  print_debug_info
fi

mvn archetype:generate \
    "${BATCH_MODE}" \
    -DarchetypeGroupId=com.xxlabaza.archetypes \
    -DarchetypeArtifactId=spring-boot \
    -DarchetypeVersion=1.0.0 \
    -DgroupdId=${GROUP_ID} \
    -DartifactId=${ARTIFACT_ID} \
    -Dversion=${VERSION} \
    -Dpackage=${PACKAGE} \
    -Dspring-boot=${SPRING_BOOT_VERSION}
