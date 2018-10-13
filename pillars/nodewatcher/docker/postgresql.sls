#!yaml|gpg
docker:
  containers:
    postgresql:
      image: tozd/postgresql
      tag: "9.5"
      network_mode:
        name: nodewatcher
      volumes:
        /srv/storage/postgresql:
          bind: /var/lib/postgresql/9.5/main
          user: 102
          group: 106
        /srv/log/postgresql:
          bind: /var/log/postgresql
          user: nobody
          group: nogroup
      environment:
        - postgresql
  environments:
    postgresql:
      PGSQL_ROLE_1_USERNAME: nodewatcher
      PGSQL_ROLE_1_PASSWORD: |
        -----BEGIN PGP MESSAGE-----
        Version: GnuPG v1

        hQEMA1azKk3jGwQJAQf/cRe5i6f0B55eMpMP+GJ72/Dg1ctkoSQmbwa3dEPyqRk5
        yxTxsxx2VIkwDESnkZK0z8PsGFaS9iTidPEmECyk307S0PYAasNg/7ccVqiEpGSA
        QpFvlv0zpdmGJbiIPufqUW6F7OVt4wUwxfNWPh3iNOOKEZ+Q0HMN21gOEK56TQIq
        vzEyrdRQh7S2GK5mujsMj0BX/ZxcXHQ82qzFcBP8FBNwC0xIe22Wx2K28A4O7y7V
        RCNFQQ9ObCLCqR/yasgZva58rmFbO1HJ0yRYDoVlYgOh2MDxJgkQw0Lpws/Gz8Gb
        cASbnCbjUA51Fh7fGuyNBRFJJ1hwTvCbhgYH9+uewdJHAV8wK/giAd0tdqI7f1Qy
        d0omlpVQebCi4RaZJXTuIcUjU5Yo2vq5YnBcb4fyIYq3U18H5OI6b+27g1eQQNg+
        AFvicsRV7SY=
        =JgeP
        -----END PGP MESSAGE-----
      PGSQL_ROLE_1_FLAGS: LOGIN
      PGSQL_DB_1_NAME: nodewatcher
      PGSQL_DB_1_OWNER: nodewatcher
      PGSQL_DB_1_ENCODING: UNICODE
      PGSQL_DB_1_POSTGIS: true
