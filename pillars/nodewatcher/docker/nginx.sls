docker:
  containers:
    nginx-proxy:
      image: jwilder/nginx-proxy
      tag: "alpine"
      network_mode:
        name: nodewatcher
      labels:
        - com.github.jrcs.letsencrypt_nginx_proxy_companion.nginx_proxy: "true" 
      ports:
        80/tcp:
          port: 80
        443/tcp:
          port: 443
      volumes:
        /srv/storage/ssl:
          bind: /etc/nginx/certs
        /var/run/docker.sock:
          bind: /tmp/docker.sock
        /srv/storage/vhost.d:
          bind: /etc/nginx/vhost.d
    letsencrypt:
      image: jrcs/letsencrypt-nginx-proxy-companion
      tag: "v1.9.1"
      network_mode:
        name: nodewatcher
        volumes:
          /srv/storage/ssl:
            bind: /etc/nginx/certs
          /var/run/docker.sock:
            bind: /var/run/docker.sock
          /srv/storage/vhost.d:
            bind: /etc/nginx/vhost.d
