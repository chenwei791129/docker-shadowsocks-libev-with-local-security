# shadowsocks-libev for docker with local security
This project is used to enhance the shadowsocks/shadowsocks-libev.

Because shadowsocks/shadowsocks-libev does not restrict local area network access, this can cause security problems.

This project added iptables rules to restrict access to private ip.

## How to use
[![This image on DockerHub](https://img.shields.io/docker/pulls/awei/shadowsocks-libev-with-local-security.svg)](https://hub.docker.com/r/awei/shadowsocks-libev-with-local-security/)

[View on Docker Hub](https://hub.docker.com/r/awei/shadowsocks-libev-with-local-security)
```console
$ docker run -d --privileged -p <PORT>:<DOCKER-PORT> -p <PORT>:<DOCKER-PORT>/udp -e PASSWORD="<PASSWORD>" awei/shadowsocks-libev-with-local-security
```
```e.g.
$ docker run -d --privileged -p 8388:8388 -p 8388:8388/udp -e PASSWORD="P@ssw0rd" awei/shadowsocks-libev-with-local-security
```
### Necessary Environment Variables
* `PASSWORD` Set a password

### Option Environment Variables

* `SERVER_ADDR` Server listen ip (default: 0.0.0.0)
* `SERVER_PORT` Server listen port (default: 8388)
* `METHOD` Encryption type (default: aes-256-gcm)
* `TIMEOUT` Timeout (unit:second) (default: 300)
* `DNS_ADDRS` DNS Servers (default: 8.8.8.8,8.8.4.4)
* `ARGS` other args

see [shadowsocks/shadowsocks-libev dockerfile](https://hub.docker.com/r/shadowsocks/shadowsocks-libev/dockerfile)

## Related Projects
- [shadowsocks/shadowsocks-libev](https://hub.docker.com/r/shadowsocks/shadowsocks-libev)

## License
The repository is open-sourced software licensed under the [MIT license](https://opensource.org/licenses/MIT).
