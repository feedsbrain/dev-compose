#!/bin/bash
GITHUB_RUNNER_ENVIRONMENTS=/home/runner/github/environments
BUILDMYSTACK_VERSION=0.2.9

# read from .env if exist
if test -f "../.env"; then
    source ../.env
fi

# execute only when all required environment variables exist
if [[ -z $BASE_VOLUME_DIR ]]; then
  echo "--------------------------------------------"
  echo "Required environment variable is not set ..."
  echo "--------------------------------------------"
else
  # copy runner script
  if [[ ! -f $BASE_VOLUME_DIR/github-runner/runner/runner.sh ]]; then
    cp ./runner.sh $BASE_VOLUME_DIR/github-runner/runner
    chmod 777 $BASE_VOLUME_DIR/github-runner/runner/runner.sh
  fi

  if [[ -z "$1" ]]; then
    docker run -ti -v $BASE_VOLUME_DIR/github-runner/runner:$GITHUB_RUNNER_ENVIRONMENTS feedsbrain/buildmystack:$BUILDMYSTACK_VERSION /bin/bash -l
  else
    docker run -ti -v $BASE_VOLUME_DIR/github-runner/runner:$GITHUB_RUNNER_ENVIRONMENTS feedsbrain/buildmystack:$BUILDMYSTACK_VERSION /bin/bash -lc "cp -r /home/runner/github/actions-runner $GITHUB_RUNNER_ENVIRONMENTS/$1"
  fi
fi
