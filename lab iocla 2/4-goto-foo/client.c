/* 
 * Description: Simple client implemntation C. Used to illustrate the
 * use of gotos.
 * IOCLA 2019
*/

#include <stdio.h> 
#include <sys/socket.h> 
#include <arpa/inet.h> 
#include <unistd.h> 
#include <string.h> 
#include <stdlib.h> 
#define PORT 8080 
   
int main(void) 
{ 
    int sock = 0; 
    struct sockaddr_in serv_addr; 
    char *hello = "Hello from client"; 
    char buffer[1024] = {0}; 

    char *error_buffer = malloc(100);

    if (error_buffer == NULL)
    {

        goto error_buf;

    } 

    if ((sock = socket(AF_INET, SOCK_STREAM, 0)) < 0) 
    { 

		goto socket_error;
        
    } 
   
    serv_addr.sin_family = AF_INET; 
    serv_addr.sin_port = htons(PORT); 
       
    if(inet_pton(AF_INET, "127.0.0.1", &serv_addr.sin_addr)<=0)  
    { 

		goto invalid_adress;

    } 
   
    if (connect(sock, (struct sockaddr *)&serv_addr, sizeof(serv_addr)) < 0) 
    { 

		goto connection_fail;

    } 

    send(sock , hello , strlen(hello) , 0 ); 
    printf("Hello message sent\n"); 
    read( sock , buffer, 1024); 
    printf("%s\n",buffer ); 
    return 0; 

error_buf:
    printf("malloc failed\n");
    goto free;
socket_error:
    printf("socket error\n");
     goto free;
invalid_adress:
    printf("invalid adress\n");
     goto free;
connection_fail:
    printf("connection failed\n");
     goto free;
free:
    free(error_buffer);
    return -1;

} 
