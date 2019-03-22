@echo off

REM script to run jmeter load test plan
REM argument is number of times to send the GET request

SET num_loops=10

IF NOT "%1"=="" (
    SET num_loops=%1
)

jmeter -n -t RestGET-TestPlan.jmx -Jloops=%num_loops%

