#!/bin/sh
node server.js &

while [ true ] 
do
  # ADD SSITES TO TEST HERE, URL and NAME #
  ./lighthouse.sh https://www.tre.se/support support
  ./lighthouse.sh https://www.tre.se/handla/mobiltelefoner handla-mobiltelefoner

  # Set interval for the tests
  sleep 60;
done
