
#ifndef _TCP_SERVER_H_
#define _TCP_SERVER_H_

#include <unistd.h>  
#include <sys/socket.h>  
#include <arpa/inet.h>  
  
#define MAXSIZE 1024  
  
class tcp_server  
{  
private:  
        int socket_fd;
        int accept_fd;  
        sockaddr_in myserver;  
        sockaddr_in remote_addr;  
  
public:  
        tcp_server(int listen_port);  
        int recv_msg();  
}; 
#endif /* _TCP_SERVER_H_ */
