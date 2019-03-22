@echo off

SET num_loops=10

IF NOT "%1"=="" (
    SET num_loops=%1
)

jmeter -n -t RestGET-TestPlan.jmx -Jloops=%num_loops%

