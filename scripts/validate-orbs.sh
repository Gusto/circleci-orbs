#!/bin/bash -eo pipefail

for ORB in orbs/*; do
  path=${ORB}/orb.yml

  circleci orb validate ${path}; RETURN_CODE=$?

  if [[ $RETURN_CODE != 0 ]]; then
  	exit 1
  fi
done
