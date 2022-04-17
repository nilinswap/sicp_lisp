#include<unistd.h>
#include<stdio.h>
#include<stdlib.h>
#include<signal.h>

unsigned int wake_up(unsigned int secs){
    int p = sleep(secs);
    printf("woke up after %d %d", secs, p);
    return p;
}

void sigint_handler(int sig) /* SIGINT handler */
{
    printf("Caught SIGINT!\n");
    exit(0);
}

void unix_error(char *msg){
    printf("%s", msg);
    exit(1);
}

int main(int argc, char *argv[], char *envp[]){
    /* Install the SIGINT handler */
    if (signal(SIGINT, sigint_handler) == SIG_ERR)
        unix_error("signal error");
    pause(); /* Wait for the receipt of a signal */
    return 0;
}