#!/bin/bash -eo pipefail

for ORB in orbs/*; do
  path=${ORB}/orb.yml
  orb=gusto/$(basename $ORB)

  circleci orb info ${orb}; RETURN_CODE=$?

  echo [DEBUG] return code: $RETURN_CODE

  if [[ ${RETURN_CODE} != 0 ]]; then
    echo ${orb} does not exist. Creating it.
    circleci orb create ${orb} --no-prompt
  fi
  
  circleci orb publish ${path} $orb@dev:$(date +%s)
done
