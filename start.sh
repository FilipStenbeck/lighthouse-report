#!/bin/sh
 _jq() {
  echo ${row} | base64 --decode | jq -r ${1}
}

#Create output folder
mkdir -p reports

#Set time between audit runs
SLEEP=$(cat config/app.json | jq '.sleep') 

#Start web erver
node web/server.js &

#Start audits for urls in config.js
while [ true ] 
  do
    for row in $(cat config/audits.json | jq -r '.[] | @base64'); do
      ./scripts/lighthouse.sh  $(_jq '.url') $(_jq '.name')
  done

  #Cleanup old files (older than 1 day)
  find reports/ -type f -mtime +1 -exec rm -f {} \;

  # Set interval for the tests
  sleep $SLEEP;
done
