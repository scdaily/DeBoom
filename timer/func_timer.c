/* timer function to time a function provided by an external object

   The provided function has no return value or parameters.  If those are desired, the
   function can be a wrapper function for a function with them.

   Code for clock_gettime from example in:
       http://www.guyrutenberg.com/2007/09/22/profiling-code-using-clock_gettime/

*/

#include <stdio.h>
#include <time.h>
 
struct timespec diff(struct timespec start, struct timespec end);

void func_to_run();
 
int main()
{
    struct timespec time1, time2;

    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &time1);

    func_to_run();

    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &time2);
    printf("%ld:%ld\n", diff(time1,time2).tv_sec, diff(time1,time2).tv_nsec);
    return 0;
}
 
struct timespec diff(struct timespec start, struct timespec end)
{
    struct timespec temp;
    if ((end.tv_nsec-start.tv_nsec)<0) {
        temp.tv_sec = end.tv_sec-start.tv_sec-1;
        temp.tv_nsec = 1000000000+end.tv_nsec-start.tv_nsec;
    } else {
        temp.tv_sec = end.tv_sec-start.tv_sec;
        temp.tv_nsec = end.tv_nsec-start.tv_nsec;
    }
    return temp;
}

