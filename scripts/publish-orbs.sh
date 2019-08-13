#!/bin/bash -eo pipefail

echo "Commit range: $COMMIT_RANGE"

for ORB in orbs/*; do
  orbname=$(basename $ORB)
  path=${ORB}/@orb.yml
  orb=$CIRCLE_NAMESPACE/${orbname}

  circleci orb info $orb; RETURN_CODE=$?

  if [[ $RETURN_CODE != 0 ]]; then
    echo ${orb} does not exist. Creating it.
    circleci orb create $orb --no-prompt
  fi
  
  circleci orb publish ${path} $orb patch

#   if [[ $(git diff $COMMIT_RANGE --name-status | grep "$orbname") ]]; then
#     echo "publishing ${orbname}"
#     # circleci orb publish ${ORB}/orb.yml grxy/${orbname}@version
#   else
#     echo "${orbname} not modified; no need to publish"
#   fi
done
