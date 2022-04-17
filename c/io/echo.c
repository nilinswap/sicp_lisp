#include<stdio.h>
#include<stdlib.h>
#include<sys/types.h>
#include<sys/stat.h>
#include<fcntl.h>
#include <unistd.h>

int main(void)
{
    char c;

    while(read(STDIN_FILENO, &c, 1) != 0)
        printf(" ad %d", (int)write(STDOUT_FILENO, &c, 1));
    exit(0);
}