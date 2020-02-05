#!/bin/sh

while [ true ] 
do
  # ADD URLS TO TEST HERE #
  ./lighthouse.sh https://www.tre.se/support
  ./lighthouse.sh https://www.tre.se/support/\#kontaktaoss

  # Set interval for the tests
  sleep 60;
done
