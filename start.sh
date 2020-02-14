#!/bin/sh
node web/server.js &

 _jq() {
  echo ${row} | base64 --decode | jq -r ${1}
}

while [ true ] 
do
  for row in $(cat audits.json | jq -r '.[] | @base64'); do
    ./lighthouse.sh  $(_jq '.url') $(_jq '.name')
  done

  #Cleanup old files (older than 1 day)
  find reports/ -type f -mtime +1 -exec rm -f {} \;

  # Set interval for the tests
  sleep 60;
done
