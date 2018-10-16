docker:
  containers:
    nginx-proxy:
      image: robimarko/nginx-proxy
      network_mode:
        name: nodewatcher
      labels:
        - com.github.jrcs.letsencrypt_nginx_proxy_companion.nginx_proxy: "true" 
      ports:
        80/tcp:
          ip: 45.76.90.160
          port: 80
        443/tcp:
          ip: 45.76.90.160
          port: 443
      volumes:
        /srv/storage/ssl:
          bind: /etc/nginx/certs
        /var/run/docker.sock:
          bind: /tmp/docker.sock
          type: socket
        /srv/storage/vhost.d:
          bind: /etc/nginx/vhost.d
    letsencrypt:
      image: jrcs/letsencrypt-nginx-proxy-companion
      network_mode:
        name: nodewatcher
        volumes:
          /srv/storage/ssl:
            bind: /etc/nginx/certs
          /var/run/docker.sock:
            bind: /var/run/docker.sock
            type: socket
          /srv/storage/vhost.d:
            bind: /etc/nginx/vhost.d
