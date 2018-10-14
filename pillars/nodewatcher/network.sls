network:
  system:
    hostname: nodewatcher
    fqdn: nodewatcher.otvorenamreza.org
  dns:
    ipv4:
      - 8.8.8.8
      - 8.8.4.4
  interfaces:
    ens3:
      ipv4:
        - type: static
          address: 45.76.90.160
          netmask: 255.255.254.0
          gateway: 45.76.90.1
mailer:
  relay: smtp.gmail.com
  root_alias:
    - robimarko@gmail.com
