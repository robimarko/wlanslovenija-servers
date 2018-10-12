network:
  system:
    hostname: nodewatcher
    fqdn: nodewatcher.otvorenamreza.org
  dns:
    ipv4:
      - 8.8.8.8
      - 8.8.4.4
  interfaces:
    p3p1:
      ipv4:
        - type: static
          address: 45.76.90.160
          netmask: 255.255.254.0
          gateway: 45.76.90.1
mailer:
  relay: mail.tnode.com
  root_alias:
    - monitoring@unico.re
