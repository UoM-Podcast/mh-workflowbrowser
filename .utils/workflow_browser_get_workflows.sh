#!/bin/bash
# This is a companion script to harvest data for the workflow browser tool. see https://github.com/UoM-Podcast/mh-workflowbrowser
# Define variables to connect to opencast, times for the dump and location of the workflow browser
env=""
server=""
user=""
access=""
datepast=`date -d "36 hours ago" '+%Y-%m-%dT%H:%M:%SZ'`
datenow=`date '+%Y-%m-%dT%H:%M:%SZ'`
wfdump=

# Run the curl command to get all the workflow data from the opencast admin node and store the JSON to file
curl --location-trusted -H "X-Requested-Auth: Digest" -H "X-Opencast-Matterhorn-Authorization: true" --digest --user "${user}:${access}" "${server}/workflow/instances.json?state=&q=&fromdate=${datepast}&todate=${datenow}&sort=&startPage=0&count=600" > ${wfdump}${env}.json
