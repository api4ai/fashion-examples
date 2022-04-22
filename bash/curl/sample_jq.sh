#!/bin/bash

######################################################
# NOTE:                                              #
#   This script requires "jq" command line tool!     #
#   See https://stedolan.github.io/jq/               #
######################################################


IMAGE=${1}
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Run base sample script to get raw output.
raw_response=$(bash ${DIR}/sample.sh "${IMAGE}")
echo -e "💬 Raw response:\n${raw_response}\n"

# Parse response and print top 5 classes.
echo "💬 Top 5 classes:"
jq ".results[0].entities[0].classes" <<< ${raw_response} | grep -v '{\|}' | sort -brg -t ':' -k 2 | head -n 5
