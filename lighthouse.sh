#!/bin/sh

OUTPUT_NAME=reports/output-$(date +%Y-%m-%d:%H:%M).json
lighthouse --quiet --chrome-flags="--headless --no-sandbox" $1 --output json --output-path ${OUTPUT_NAME};
node buildReport.js $OUTPUT_NAME
