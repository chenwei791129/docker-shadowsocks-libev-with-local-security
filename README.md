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
e.g.
```
$ docker run -d --privileged -p 8388:8388 -p 8388:8388/udp -e PASSWORD="P@ssw0rd" awei/shadowsocks-libev-with-local-security
```
deploy to kubernetes example:
```yaml
kind: Service
apiVersion: v1
metadata:
  name: service-shadowsocks
spec:
  selector:
    app: shadowsocks-1
  ports:
    - name: tcp
      protocol: TCP
      port: 8388
      targetPort: 8388
      nodePort: 30000
    - name: udp
      protocol: UDP
      port: 8388
      targetPort: 8388
      nodePort: 30000
  type: NodePort

---

apiVersion: apps/v1
kind: Deployment
metadata:
  name: deployment-shadowsocks-1
  labels:
    app: shadowsocks-1
spec:
  replicas: 1
  selector:
    matchLabels:
      app: shadowsocks-1
  template:
    metadata:
      labels:
        app: shadowsocks-1
    spec:
      containers:
      - name: pod-shadowsocks
        image: awei/shadowsocks-libev-with-local-security:latest
        env:
        - name: PASSWORD
          value: "P@ssw0rd"
        - name: METHOD
          value: "aes-256-gcm"
        ports:
        - containerPort: 8388
        securityContext:
          privileged: true
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
