#!/bin/sh

fetch_metadata(){
git pull 
echo "############## Listing all git branches and owners ###################33"
#git branch -a
git for-each-ref --format='%(committerdate) %09 %(authorname) %09 %(refname)' | sort -k5n -k2M -k3n -k4n | awk {'print $7,$8,$9,$10,$11'}
}

