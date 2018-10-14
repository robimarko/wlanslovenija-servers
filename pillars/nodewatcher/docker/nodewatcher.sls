#!yaml|gpg
docker:
  containers:
    nodewatcher-frontend:
      image: robimarko/nodewatcher-frontend
      network_mode:
        name: nodewatcher
      environment:
        # We use a different virtual host for pushing monitoring data as we configure
        # TLS client authentication there.
        - VIRTUAL_HOST: beta.otvorenamreza.org,nodewatcher.otvorenamreza.org,push.nodewatcher.otvorenamreza.org
          VIRTUAL_URL: /
          VIRTUAL_LETSENCRYPT: "true"
        - nodewatcher
        - postgresql
      config:
        nodewatcher: /code/nodewatcher/settings_production.py
      files:
        /srv/storage/ssl/push.nodewatcher.otvorenamreza.org_nonssl.conf: |
          # Allow push without SSL (needed for simple sensors). There is still a
          # per-node configuration that determines whether this should be allowed.
          location /push/http/ {
            proxy_pass http://push.nodewatcher.otvorenamreza.org-u;
          }
        /srv/storage/ssl/push.nodewatcher.otvorenamreza.org_ssl.conf: |
          # Setup client authentication. Allow authentication with any certificate
          # as all verification is done by the nodewatcher modules.
          ssl_verify_client optional_no_ca;

          # Accept push requests.
          location ~ ^/push/http[/$] {
            proxy_pass http://push.nodewatcher.otvorenamreza.org-u;
          }

          # Redirect all other requests to the main site.
          location ~ / {
            return 301 https://nodewatcher.otvorenamreza.org$request_uri;
          }
        /srv/storage/ssl/beta.otvorenamreza.org_ssl.conf: |
          # Redirect push requests to its proper virtual host.
          location /push/http/ {
            return 301 https://push.nodewatcher.otvorenamreza.org$request_uri;
          }

          # Redirect all requests to main site.
          location ~ / {
            return 301 https://nodewatcher.otvorenamreza.org$request_uri;
          }
        /srv/storage/ssl/nodewatcher.otvorenamreza.org_ssl.conf: |
          # Redirect push requests to its proper virtual host.
          location /push/http/ {
            return 301 https://push.nodewatcher.otvorenamreza.org$request_uri;
          }
      volumes:
        /srv/storage/nodewatcher/media:
          bind: /media
          user: www-data
          group: www-data
          mode: 755
        /srv/storage/nodewatcher/static:
          bind: /static
        /srv/log/nodewatcher/uwsgi:
          bind: /var/log/uwsgi
          user: nobody
          group: nogroup
    nodewatcher-generator:
      image: robimarko/nodewatcher-generator
      network_mode:
        name: nodewatcher
      environment:
        - nodewatcher
        - postgresql
      config:
        nodewatcher: /code/nodewatcher/settings_production.py
      volumes:
        /srv/storage/nodewatcher/media:
          bind: /media
          user: www-data
          group: www-data
          mode: 755
        /srv/log/nodewatcher/generator:
          bind: /var/log/celery
          user: nobody
          group: nogroup
    nodewatcher-monitor:
      image: robimarko/nodewatcher-monitor
      network_mode:
        type: container
        container: mesh-network
      environment:
        - nodewatcher
        - postgresql
      config:
        nodewatcher: /code/nodewatcher/settings_production.py
      volumes:
        /srv/storage/nodewatcher/media:
          bind: /media
          user: www-data
          group: www-data
          mode: 755
        /srv/log/nodewatcher/monitor:
          bind: /var/log/monitor
          user: nobody
          group: nogroup
    nodewatcher-monitorq:
      image: robimarko/nodewatcher-monitorq
      network_mode:
        type: container
        container: mesh-network
      environment:
        - nodewatcher
        - postgresql
      config:
        nodewatcher: /code/nodewatcher/settings_production.py
      volumes:
        /srv/storage/nodewatcher/media:
          bind: /media
          user: www-data
          group: www-data
          mode: 755
        /srv/log/nodewatcher/monitorq:
          bind: /var/log/celery
          user: nobody
          group: nogroup
  environments:
    nodewatcher:
      DJANGO_SETTINGS_MODULE: nodewatcher.settings_production
      SECRET_KEY: |
        -----BEGIN PGP MESSAGE-----
        Version: GnuPG v1

        hQIMA2+rYdYI/PftAQ//asH9yzGLG9U+gS8oZ2hd0pc+hju3n0yLDM13WAdaFoms
        SplX/lLS8vp3qhesy/DxoPKUgSvSyUhKEIJDvJH1OdlbTeG/35lAGRuG/zvaFTMp
        Fgo8e0eKSKcyUTGhLjehwZQilBJN22jTqbjqdp5Xj5qnTRENSH91AS/dgTxNnRzI
        4pTzIR/thhFph+E0upNpjeGYqOVslLT0JTxlmLCUGJ6IFc/rlSMASxMyBxp1iU5H
        pgzSXJFdZeNtUcpveg8qeTPldllzKW2yiDFrQXA/EIQEQpzNTQavrIBPH1LW1rI2
        PahA36my8QVcMGvN9IKvLlM05qU7SQ2OG7c6sCTPyt7BmpBD+5El02LRuA69AVif
        iN8bBsLaX/x6YD+XRBVqJwbO/9T9OmVHPzcUqdGTew8drNkLWdDmb1ClHOjUGsdg
        TIlTAkw4U7MffwYLtqL3gmfA0A5So05tWR80ZjQUMWJhyBdt7XXi9emfB+cb7hGM
        Alp9KUHHBoIBLVPtHPpcIWWb1NTXJLWUSmIQyOw1ALKG7uDn1k0FFsAeL+P7yPuJ
        iXAbohj4Bpv1WtZnC8M0lD02k7j1UVHFr4mdf7yzeZb0ALdUVsYa9iKsIe8Vi4m6
        irjz22Ep8SzUKLezo91Xq0pv9ZkxWkULZXenrZ3T+A13ToD6294UOqHihAtCM7TS
        YwEZCtGAaKx5cJH0EyFoQ17LJCpsSo9+i8OHyCe2dec1FEYM/QyFy874Xbkzitfi
        FGqnAQNipQK86qHd8wG6VZOwPNQhQ5fnIKpvlGg2vRbewGh3j7Rs9k+hXX2/6Du2
        LrE+5w==
        =s4ug
        -----END PGP MESSAGE-----
  configs:
    nodewatcher: |
      from .settings import *

      DEBUG = False
      TEMPLATE_DEBUG = DEBUG
      TEMPLATE_URL_RESOLVERS_DEBUG = DEBUG

      SECRET_KEY = os.environ.get('SECRET_KEY')

      ADMINS = (
        ('Robert Marko', 'robimarko@gmail.com'),
      )

      MANAGERS = ADMINS

      DATABASES = {
          'default': {
              'ENGINE': 'django.contrib.gis.db.backends.postgis',
              'NAME': 'nodewatcher',
              'USER': 'nodewatcher',
              'PASSWORD': os.environ.get('PGSQL_ROLE_1_PASSWORD', ''),
              'HOST': 'postgresql',
              'PORT': '5432',
          }
      }

      TIME_ZONE = 'Europe/Zagreb'

      MEDIA_ROOT = '/media'
      STATIC_ROOT = '/static'

      EMAIL_HOST = 'smtp.gmail.com'
      EMAIL_BACKEND = 'django.core.mail.backends.smtp.EmailBackend'

      BROKER_URL = 'redis://redis:6379/0'
      CELERY_RESULT_BACKEND = BROKER_URL

      DATASTREAM_BACKEND = 'datastream.backends.influxdb.Backend'
      DATASTREAM_BACKEND_SETTINGS = {
          'connection_influxdb': {
              'host': 'influxdb',
              'port': 8086,
              'database': 'nodewatcher'
          },
          'connection_metadata': {
              'host': DATABASES['default']['HOST'],
              'port': DATABASES['default']['PORT'],
              'database': DATABASES['default']['NAME'],
              'user': DATABASES['default']['USER'],
              'password': DATABASES['default']['PASSWORD'],
          },
      }

      OLSRD_MONITOR_HOST = '127.0.0.1'
      OLSRD_MONITOR_PORT = 2006

      MONITOR_HTTP_PUSH_HOST = 'push.nodewatcher.otvorenamreza.org'

      MEASUREMENT_SOURCE_NODE = '5dcf6dae-9246-47ec-8ba5-f864d8f88778'

      USE_HTTPS = True
      CSRF_COOKIE_SECURE = USE_HTTPS
      SESSION_COOKIE_SECURE = USE_HTTPS
      SECURE_PROXY_SSL_HEADER = ('HTTP_X_FORWARDED_PROTO', 'https')

      AUTHENTICATION_BACKENDS += (
          'nodewatcher.extra.accounts.auth.AprBackend',
          'nodewatcher.extra.accounts.auth.CryptBackend',
      )

      HTTPS_PUBLIC_KEY = """
      -----BEGIN PUBLIC KEY-----
      MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEA2gCARJCGa4PmrAyRxKp5
      DvjVYRAFVZI25ACOHmTUSz6pp10hH8V6xp3ubbTnROG25K0xMjvHVjqH+ZrKtetr
      iU9ShvRhY0wFM3BjdTzD0qAKvHFBlRrqT+Lx+7f739ZfGCVQ6FeaWuDRMLDv4uhm
      4QIIOCBX9Kaj1DR2ayABsw05mFR5KrAu6HGLH22dDebhcMOueO4nR0PeOlaKBjuH
      +F0h/FKz8gqofd3VR+J/C+h9+SzanXGJXGr6vhxIfshkSnuv2BneYNAg2CY0Ft0b
      dO55GDbaQZHbKTnA0Cg+V9H4x/ArdmGfeEm6UE8TCoQHr6zAGPJ5e7XIzE4fvAS4
      qgctt7vH1QJ3YUI72HAQjyARQ+9VPo6YfdtMXac5s3tMfvKz4Ks9Bf+kVbCF40/t
      ZQvUCFIjc8ntqPZZ4Ml5I5RQ7JPnEcNTRcF9Dn2qGBTqRyi+J3HCP993djzP5AI3
      ZbNH4aN8zXdstxXOu5DQraQ+V8cCSEEErgfjcqK2MTAejBqBefWy1mLad04Ai4/l
      TfWWO8OUUgTALqNHA9B6e2za5ORkteAc1/wXznM+KdGoWGF69Q2e6BisA7scLY9W
      uRQ+n/hMQ+vvFqM0xpv6PTl7X8uqXamTUjviSpS2ebcMwTJ2ZTMa7H5xERu4iaPT
      lCPkcr8951RzeYJljgbqdmECAwEAAQ==
      -----END PUBLIC KEY-----
      """

      NODEUPGRADE_SERVER = '10.31.0.16'
      NODEUPGRADE_PORT = 28932
      NODEUPGRADE_USER = 'fileserver'
      NODEUPGRADE_PRIVATE_KEY = |
        -----BEGIN PGP MESSAGE-----
        Version: GnuPG v1

        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
        M+XcsNB1Ec4p5OJAmNkRXB5KmU/t
        =zBuh
        -----END PGP MESSAGE-----
      NODEUPGRADE_SERVER_PUBLIC_KEY = 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDKV/HjziXwhsQLFtsyQX3ybKxQ/w2Sa8ymPyHcbsO42iaNjdgAGMpiy0c6N3MwfcGbsGKLdA1/x6xQLsh7VIvG5B45F1IcIucVBut8ip3cYme1Ny1sUc4P0o0ZusdwFIweVF1Y6shT2XMWBycA3Ln4zVUdosBO5k7nZDbFZZZ1ybobB0tCXchSqcRvflKoOYLSAIfl0TbMb+58Y1AcaH59WrQ6HDgaH1lQa2D5JQ25ZXxHzahYkxB96sZOg72Xw52uqiT/LlWDgXe6/GzBRGMX5K/wUextc4PPAT/VGzSPuhBt8gj5TEb3oNGRNlxqYaiv9ctyFyNZurAgTuqKstcx nodeupgrade@otvorenamreza.org'

      NETWORK.update({
        'NAME': 'Otvorena Mreza',
        'HOME': 'https://otvorenamreza.org',
        'CONTACT': 'info@otvorenamreza.org',
        'CONTACT_PAGE': 'https://www.otvorenamreza.org/javite-nam-se/',
        'DESCRIPTION': 'Open wireless community of Croatia',
        'FAVICON_FILE': 'wlansi/images/favicon.ico',
      })

      EMAIL_SUBJECT_PREFIX = '[' + NETWORK['NAME'] + '] '
      DEFAULT_FROM_EMAIL = NETWORK['CONTACT']
      SERVER_EMAIL = DEFAULT_FROM_EMAIL

      ALLOWED_HOSTS = os.environ.get('VIRTUAL_HOST', '127.0.0.1').split(',')

      TELEMETRY_PROCESSOR_PIPELINE = (
          # Validators should start here in order to obtain previous state.
          'nodewatcher.modules.monitor.validation.reboot.processors.RebootValidator',
          'nodewatcher.modules.monitor.validation.version.processors.VersionValidator',
          'nodewatcher.modules.monitor.validation.interfaces.processors.InterfaceValidator',
          # Telemetry processors should be below this point.
          'nodewatcher.modules.monitor.sources.http.processors.HTTPTelemetry',
          'nodewatcher.modules.monitor.http.general.processors.GeneralInfo',
          'nodewatcher.core.monitor.processors.GeneralInfo',
          'nodewatcher.modules.monitor.http.resources.processors.SystemStatus',
          'nodewatcher.modules.monitor.http.interfaces.processors.DatastreamInterfaces',
          'nodewatcher.modules.monitor.http.clients.processors.ClientInfo',
          'nodewatcher.modules.routing.olsr.processors.NodeTopology',
          'nodewatcher.modules.routing.babel.processors.BabelTopology',
          'nodewatcher.modules.sensors.generic.processors.GenericSensors',
          'nodewatcher.extra.irnas.koruzav2.processors.Koruza',
          'nodewatcher.extra.irnas.sfp.processors.SFP',
          'nodewatcher.modules.vpn.tunneldigger.processors.DatastreamTunneldigger',
          'nodewatcher.modules.administration.status.processors.NodeStatus',
          'nodewatcher.modules.monitor.datastream.processors.NodeDatastream',
      )

      MONITOR_RUNS = {
          'latency': {
              'workers': 5,
              'interval': 600,
              'processors': (
                  'nodewatcher.modules.routing.olsr.processors.GlobalTopology',
                  'nodewatcher.modules.routing.babel.processors.IncludeRoutableNodes',
                  'nodewatcher.modules.monitor.measurements.rtt.processors.RttMeasurement',
                  'nodewatcher.modules.monitor.datastream.processors.TrackRegistryModels',
                  'nodewatcher.modules.monitor.measurements.rtt.processors.StoreNode',
                  'nodewatcher.modules.administration.status.processors.NodeStatus',
                  'nodewatcher.modules.monitor.datastream.processors.NodeDatastream',
              ),
          },

          'telemetry': {
              'workers': 15,
              'interval': 300,
              'max_tasks_per_child': 50,
              'processors': (
                  'nodewatcher.core.monitor.processors.GetAllNodes',
                  'nodewatcher.modules.routing.olsr.processors.GlobalTopology',
                  'nodewatcher.modules.routing.babel.processors.IncludeRoutableNodes',
                  'nodewatcher.modules.monitor.datastream.processors.TrackRegistryModels',
                  'nodewatcher.modules.routing.olsr.processors.NodeTopology',
                  TELEMETRY_PROCESSOR_PIPELINE,
                  'nodewatcher.modules.monitor.datastream.processors.MaintenanceBackprocess',
                  'nodewatcher.modules.administration.status.processors.PushNodeStatus',
              ),
          },

          'telemetry-push': {
              # This run does not define any scheduling or worker information, so it will only be
              # executed on demand.
              'processors': (
                  'nodewatcher.modules.monitor.unknown_nodes.processors.DiscoverUnknownNodes',
                  'nodewatcher.modules.monitor.sources.http.processors.HTTPGetPushedNode',
                  'nodewatcher.modules.identity.base.processors.VerifyNodeIdentity',
                  'nodewatcher.modules.monitor.datastream.processors.TrackRegistryModels',
                  TELEMETRY_PROCESSOR_PIPELINE,
              ),
          },

          'topology': {
              'workers': 5,
              'interval': 60,
              'processors': (
                  'nodewatcher.modules.routing.olsr.processors.GlobalTopology',
                  'nodewatcher.modules.routing.olsr.processors.NodeTopology',
                  'nodewatcher.modules.monitor.topology.processors.Topology',
                  'nodewatcher.modules.monitor.datastream.processors.NetworkDatastream',
              ),
          },
      }
