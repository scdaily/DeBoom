#!/bin/sh

# This script will count the number of files in a directory and record
# a timestamp and number of files in a csv file.
# See usage below for a decription of the options.
# If the options are not specified, default values will be used

usage() {
# options:
    echo -d  directory to watch
    echo -i  interval to wait between samples
    echo -f  name of output file
    echo -h  usage message
}

# default values
WATCH_DIR=
INTERVAL=5
FILE_NAME=watch_file_results.csv

while getopts d:i:f:h option
do
case "${option}"
in
d) WATCH_DIR=${OPTARG};;
i) INTERVAL=${OPTARG};;
f) FILE_NAME=${OPTARG};;
h) usage ; exit;;
esac
done

echo watch directory: $WATCH_DIR
echo interval: $INTERVAL
echo output file name: $FILE_NAME

while [ 1 ] ; do
    echo $(date),$(ls -l ${WATCH_DIR} | grep -aE "^-" | wc -l) >> ${FILE_NAME}
    sleep ${INTERVAL}
done

