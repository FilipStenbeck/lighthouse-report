#!/bin/sh
node server.js &

while [ true ] 
do
  # ADD SSITES TO TEST HERE, URL and NAME #
  ./lighthouse.sh https://www.tre.se/support support
  ./lighthouse.sh https://www.tre.se/handla/mobiltelefoner handla-mobiltelefoner

  #Cleanup old files (older than 1 day)
  find reports/ -type f -mtime +1 -exec rm -f {} \;

  # Set interval for the tests
  sleep 60;
done
