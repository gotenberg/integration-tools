#!/bin/bash

# Exit early.
# See: https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#The-Set-Builtin.
set -e

# Source dot env file.
source .env

# Arguments.
platform=""
dry_run=""

while [[ $# -gt 0 ]]; do
  case $1 in
    --platform)
      platform="$2"
      shift 2
      ;;
    --dry-run)
      dry_run="$2"
      shift 2
      ;;
    *)
      echo "Unknown option $1"
      exit 1
      ;;
  esac
done

echo "Build and push 👷"
echo

echo "Target platform: $platform"

 if [ "$dry_run" = "true" ]; then
   echo "🚧 Dry run"
 fi

IFS='/' read -ra arch <<< "$platform"
tag="$DOCKER_REGISTRY/$DOCKER_REPOSITORY:latest-${arch[1]}"

# Build and push images.
run_cmd() {
  local cmd="$1"

  if [ "$dry_run" = "true" ]; then
    echo "🚧 Dry run - would run the following command:"
    echo "$cmd"
    echo
  else
    echo "⚙️ Running command:"
    echo "$cmd"
    eval "$cmd"
    echo
  fi
}

join() {
  local delimiter="$1"
  shift
  local IFS="$delimiter"
  echo "$*"
}

cmd="docker buildx build \
    --push \
    --platform $platform \
    -t $tag \
    -f Dockerfile .
"
run_cmd "$cmd"

echo "✅ Done!"
echo "tag=$tag" >> "$GITHUB_OUTPUT"
exit 0
