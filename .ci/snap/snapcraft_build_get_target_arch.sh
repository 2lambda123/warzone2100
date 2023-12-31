#!/bin/bash

# Get Snapcraft build-time target arch

echoerr() { echo "$@" 1>&2; }

BUILDTIME_TARGET_ARCH=""
if [ -n "${CRAFT_TARGET_ARCH}" ]; then
  # CRAFT_TARGET_ARCH is available - use it!
  BUILDTIME_TARGET_ARCH="${CRAFT_TARGET_ARCH}"
else
  # If CRAFT_TARGET_ARCH is not available, parse the CRAFT_ARCH_TRIPLET and convert it
  case ${CRAFT_ARCH_TRIPLET%%-*} in
  x86_64)
      BUILDTIME_TARGET_ARCH="amd64"
      ;;
  i386)
      BUILDTIME_TARGET_ARCH="i386"
      ;;
  aarch64)
      BUILDTIME_TARGET_ARCH="arm64"
      ;;
  s390x)
      BUILDTIME_TARGET_ARCH="s390x"
      ;;
  powerpc64le)
      BUILDTIME_TARGET_ARCH="ppc64el"
      ;;
  *)
      BUILDTIME_TARGET_ARCH=""
  esac
fi

echo "${BUILDTIME_TARGET_ARCH}"
