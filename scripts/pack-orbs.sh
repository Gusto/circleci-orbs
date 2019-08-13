#!/bin/bash -eo pipefail

for ORB in orbs/*; do
  path=${ORB}/orb.yml

  rm -f path
  
  circleci config pack ${ORB} > ${path}; RETURN_CODE=$?

  if [[ $RETURN_CODE != 0 ]]; then
  	exit 1
  fi
done
