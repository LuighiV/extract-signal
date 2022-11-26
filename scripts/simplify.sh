#! /bin/bash
# this script must be executed from the root path of python module

MODULE_PATH="$PWD"
PYTHON_SCRIPT_PATH=${MODULE_PATH}/extracttools/simplify.py

if [[ -z ${1} ]]; then
  echo "You must provide an input file"
  exit 1
fi

FILEPATH_IN=${1}

if [[ -z ${2} ]]; then
  FILENAME=$(basename -- "${FILEPATH_IN}")
  EXTENSION="${FILENAME##*.}"
  FILENAME="${FILENAME%.*}"
  FILEPATH_OUT="${FILEPATH_IN%.*}.simplified.${EXTENSION}"
  echo "WARN: You have not provided an output file, using ${FILEPATH_OUT}"
else
  FILEPATH_OUT=${2}
fi

echo "Executing script..."
python ${PYTHON_SCRIPT_PATH} ${FILEPATH_IN} ${FILEPATH_OUT}

echo "Finish processing"
