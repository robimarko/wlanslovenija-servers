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
        - VIRTUAL_HOST: nodes.otvorenamreza.org
          VIRTUAL_URL: /
          LETSENCRYPT_HOST: nodes.otvorenamreza.org
          LETSENCRYPT_EMAIL: robimarko@gmail.com
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
      EMAIL_PORT = '587'
      EMAIL_USE_TLS = True
      EMAIL_HOST_USER = 'email@otvorenamreza.org'

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

      MEASUREMENT_SOURCE_NODE = '97988fcb-cda4-409e-aea9-99fb7f052863'

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

      NODEUPGRADE_SERVER = '10.31.0.0'
      NODEUPGRADE_PORT = 28932
      NODEUPGRADE_USER = 'fileserver'
      NODEUPGRADE_PRIVATE_KEY = """
      AAAAB3NzaC1yc2EAAAADAQABAAABAQC1M6TGKaUX9k6B/NJPwpJlKaTEu9LBaEiMVLz+9NaKituc
      8IB9Ynm/r07rRq65AXSu+bHBO9431TPiRRQ3oak7nlXhIWTUL2oH4DnwFbmFm5/NkFdP9p+PYcn9
      YnhmWGAGFFdKGDuiGHcbVH/bulvZobBC2EDvDOlg1iA2/Xx9Jdgyq8t6M0iIxaEQydGxNa/2JpfR
      u4O9uHq3+LZjM6i4/X2IY9JYFPUUMhnZ80uHBrjWHXZgBEyF9aT01PXvGejxJ5D4UDVe2UT6Tbl1
      /w/zEq9BnNt1ZggXUz7S/h2xrlZMrVMDDEnBE2Mbq1tHXyHeEoclLMG9RIpF/osG1Ja3AAABADb5
      WxVPzyms7XacaIYQRu/wKXASd8d7xv7kOo6zY1+W7zf281SXCs7v9eaFhD7WxTrMwHQaoLmZsmsE
      gDS8lCZlTDLIOdnyJJ4NFibTwHxbkakBEKxO62vJxElelZ6fU0qk4zK0lWsBNymQglX8fR9S4bH2
      AAVGiot5iz6Du0AQNrpZA2gdkoNHR01oITmZOzpQ1g7aU4EE0eni2lwW4GJsugvU4sx51MTKEoSZ
      1U+zlN+L8hMPcoaSfv6OOW616ct8eopdXi7mOkZ/87UFjUY6WtySYO90n6YjN9LLpD2iLlHyIfjZ
      uwu7mFYebvH9HtO+6d6G99JexdmrNhcrXTkAAACBAPEJtenGdpWlonhTbJe9x3QKkQtsMwC41OmD
      d7AEVI/8thRRIRFUMpAoThzAD7q37wnw7/I1j6tAawZQRxhmqHPbC69ro/fcuhg/MDOs7rFKXXtn
      shhInQwUjP2pU6g8SN9RRntuC+7hTSHRB25jaW/7weJt1Jpt0xIgE4JGeivLAAAAgQDAcxZHdD/J
      hiQ+/ggFsYdhvauCR9Z66oQfkkCRX5BOcoph4fMjQxgUxwfUYXVUCx5e9q19LKnWDB4FnnLNNTm9
      Reyg1xSZvl98FcR8sh3l3ZdvA6feW1xd6vg8rpWtdnJag1iuKY+HpgU256Ub6yf8/M2J+zmicg6s
      lWebI407RQ==
      """
      NODEUPGRADE_SERVER_PUBLIC_KEY = 'ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBOzKxvjv/RFDOd2BE4HgxvqNsMljGiSRim7KUQNI/ifjvBe4Z325DBe78OJ6P9d2kf6omHUxnLi1oPu+YaEdDDk='
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
