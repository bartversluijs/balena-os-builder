# balenaOS builder
Build / Deploy Balena projects using balenaOS, with an nginx proxy in front of the balena.sock.  
This uses nginx to proxy the `balena.sock` to a defined port (default 3000, can be changed using `SOCK_PORT`) and binds on `0.0.0.0` (can be changed using `SERVER_NAME`).  

I've created this because I don't want to cross-compile my deployments for openBalena, and I wanted to use balenaOS as a builder. Because it's easy to setup for multiple architectures. You can use local mode to accomplish the exact same thing (but on port 2375), but I wanted to have the ability to create a release, so I can add more containers if I wanted to. And creating a new builder will be as easy as flashing a new SD card and it's ready to build!

There's not much else to tell about this container. It does just that, nothing more nothing less.

## Using the socket
If you want to use the socket with the `balena-cli`, you have to specify the host and port in the command.  
So for `balena build`, use this:
```
balena build -a <my-app> -h <device-ip> -p <SOCK_PORT> <source-map>
```

For `balena deploy`, use this:
```
balena deploy <my-app> -h <device-ip> -p <SOCK_PORT> --source <source-map>
```
