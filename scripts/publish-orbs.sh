#!/bin/bash -eo pipefail

for ORB in orbs/*; do
  orbname=$(basename $ORB)

  if [[ $(git diff $COMMIT_RANGE --name-status | grep "$orbname") ]]; then
    echo "publishing ${orbname}"
    # circleci orb publish ${ORB}/orb.yml grxy/${orbname}@version
  else
    echo "${orbname} not modified; no need to publish"
  fi
done
