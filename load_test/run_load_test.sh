#!/bin/sh

# script to run jmeter load test plan
# argument is number of times to send the GET request

if [ -z "$1" ] 
then
    num_loops=10
else
    num_loops="$1"
fi

jmeter -n -t RestGET-TestPlan.jmx -Jloops=${num_loops}

