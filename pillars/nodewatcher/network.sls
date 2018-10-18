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
          address: 108.61.179.247
          netmask: 255.255.254.0
          gateway: 108.61.178.1
mailer:
  relay: smtp.gmail.com
  root_alias:
    - robimarko@gmail.com
