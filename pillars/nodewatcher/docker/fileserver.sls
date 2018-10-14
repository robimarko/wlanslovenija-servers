#!yaml|gpg
docker:
  containers:
    nodewatcher-fileserver:
      image: wlanslovenija/scp-server
      environment:
        - FILESERVER_PUBLIC_KEY: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDKV/HjziXwhsQLFtsyQX3ybKxQ/w2Sa8ymPyHcbsO42iaNjdgAGMpiy0c6N3MwfcGbsGKLdA1/x6xQLsh7VIvG5B45F1IcIucVBut8ip3cYme1Ny1sUc4P0o0ZusdwFIweVF1Y6shT2XMWBycA3Ln4zVUdosBO5k7nZDbFZZZ1ybobB0tCXchSqcRvflKoOYLSAIfl0TbMb+58Y1AcaH59WrQ6HDgaH1lQa2D5JQ25ZXxHzahYkxB96sZOg72Xw52uqiT/LlWDgXe6/GzBRGMX5K/wUextc4PPAT/VGzSPuhBt8gj5TEb3oNGRNlxqYaiv9ctyFyNZurAgTuqKstcx nodeupgrade@otvorenamreza.org
      network_mode:
        type: container
        container: mesh-network
      volumes:
        /srv/storage/nodewatcher/fileserver-keys:
          bind: /etc/ssh/keys
          mode: 700
        /srv/storage/nodewatcher/media:
          type: other
          bind: /readonly/files
          readonly: true
