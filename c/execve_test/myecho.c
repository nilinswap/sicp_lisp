#include <stdio.h>
#include <unistd.h>

int main(int argc, char *argv[], char *envp[]){
    printf("argc: %d\n", argc);
    for(int i = 0; i < argc; i++){
        printf("argv %d: %s\n", i, argv[i]);
    }
    printf("\n\n");
    int i = 0;
    while(envp[i]){
        printf("envp %d: %s\n", i, envp[i]);
        i++;
    }
    if(fork() == 0){
        int status = execve("hello.o", argv, envp);
        printf("status %d", status);
    }
    return 0;
}