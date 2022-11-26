#!/bin/bash
# Read list of files from file and convert

if [[ -z ${1} ]]; then
  echo "You must provide the file with filepaths"
  exit 1
fi

FILEPATH=${1}

while read -r line; do
  /bin/bash scripts/simplify.sh ${line}
echo $line
done < ${FILEPATH}
