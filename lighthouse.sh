#!/bin/sh

OUTPUT_NAME=reports/$(TZ=Europe/Stockholm date +%Y-%m-%d-%H:%M)
PAGE=$1
SUFFIX=$2
lighthouse --quiet --chrome-flags="--headless --no-sandbox" $1 --output json --output-path ${OUTPUT_NAME}.json;
lighthouse --quiet --chrome-flags="--headless --no-sandbox" $1 --output html --output-path ${OUTPUT_NAME}-${SUFFIX}.html
cp -f ${OUTPUT_NAME}-${SUFFIX}.html reports/latest.html
node buildReport.js $OUTPUT_NAME.json
