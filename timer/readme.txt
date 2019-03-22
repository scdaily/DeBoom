Two files:

func_timer.c - main program to run the test function and getting performance time
func_to_run.c - example of the test funtion to be timed

Build steps:

cc -o timer func_timer.c func_to_run.c

or

cc -c func_to_run.c
cc -o timer func_timer.c func_to_run.o

