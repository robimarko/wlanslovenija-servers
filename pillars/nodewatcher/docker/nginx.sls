docker:
  containers:
    nginx-proxy:
      image: otvorenamreza/docker-nginx-proxy
      network_mode:
        name: nodewatcher
      environment:
        - MAILTO: robimarko@gmail.com
          REMOTES: mail.tnode.com
          LETSENCRYPT_EMAIL: robimarko@gmail.com
      ports:
        80/tcp:
          ip: 45.76.90.160
          port: 80
        443/tcp:
          ip: 45.76.90.160
          port: 443
      volumes:
        /srv/storage/ssl:
          bind: /ssl
          user: root
          group: root
          mode: 701
        /var/run/docker.sock:
          bind: /var/run/docker.sock
          type: socket
        /srv/log/nginx-proxy:
          bind: /var/log/nginx
          user: nobody
          group: nogroup
