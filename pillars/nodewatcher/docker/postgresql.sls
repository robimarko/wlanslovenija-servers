#!yaml|gpg
docker:
  containers:
    postgresql:
      image: otvorenamreza/docker-postgresql
      tag: "10"
      network_mode:
        name: nodewatcher
      volumes:
        /srv/storage/postgresql:
          bind: /var/lib/postgresql/10/main
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

        hQIMA2+rYdYI/PftAQ/+Ll3BWlZIQIVYZbgRQHkcqKMs6Ln0DwlrrIDbPIsdvBlY
        l8grzWNyLw0tZHqjcg1734UedeBIdTSaCL/en0qQ21g1igqJZYmbZcm6KWfF7vMy
        HOCTcciEROUEMEBTmXVmFICp8HAxYLEg165HpnkV+XDplDlVJZ8qns3OEkG6WOz0
        SAphPe0LuWgQvd8dR852QHxa96sv/IKXGh1+T0WIYBKgUXIAaW47TQPKibJhkHKP
        T42aNWKW0ijDRYSGJdIEigsWPe4v6MzGT3KHm118WcvZReT0LBhKPs4J2KbZMpER
        cZYCypmZB0mUjsBe2JtAb2suxmcLVuU6HU/jdXikpJm7pDVk4VpfcBPIes8yCtbC
        fKQ7yvCXbgl5mRg3WsLkGbXckvUXfWQrU6awxsXiTGsRqGLtlaypK2qwvzJP4KLL
        XAtICC8gIbgscKHAj71jttBZSJlmACwbNqiGF7yjoMRLxqXBAnVgP/xeNYBSqfSR
        q/t/Ve8KJ1TRAY3cJ7LwR/ysX7JAYaw2CPTizOcFRnW6lPDA27QOJrWeoXmlWlW5
        pk6UGsw/KyOVB8WHtGsuS6BSHZ60k/RD6oMeEQTJcbzYSRxxoiRiMqh3PFuNQmi4
        fqf5CZpdh5SFtxZ+CCiVBsKZyDgtcpKL+NA9VOj0XjFK8WTHICEpTz22X5o8tuzS
        RwFyEyKosV6TE3DPTMDGWw5vbroidP5s873uPPHeGpCJYfsvNvzqI2fjtDbRHksR
        b4EGzs4iYggzm/a/SbdqgQij52WQ0I59
        =pwuX
        -----END PGP MESSAGE-----
      PGSQL_ROLE_1_FLAGS: LOGIN
      PGSQL_DB_1_NAME: nodewatcher
      PGSQL_DB_1_OWNER: nodewatcher
      PGSQL_DB_1_ENCODING: UNICODE
      PGSQL_DB_1_POSTGIS: true
