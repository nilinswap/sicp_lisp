#include<stdio.h>
#include <unistd.h>
int main(int argc, char *argv[], char *envp[]){
    printf("hello world!");fflush(stdout);
    if(fork() == 0){
        int status = execve("/bin/mkdir", argv, envp);
        printf("status %d", status);fflush(stdout);
    }
    return 0;
}