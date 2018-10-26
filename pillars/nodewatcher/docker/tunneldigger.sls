docker:
  containers:
    tunneldigger-vpn0:
      image: wlanslovenija/tunneldigger-client
      host_kernel_modules:
        - l2tp_core
        - l2tp_eth
        - l2tp_netlink
      capabilities:
        - NET_ADMIN
      environment:
        TUNNELDIGGER_UUID: df693e61-abfa-4323-aca0-78c6ca290680
        TUNNELDIGGER_BROKERS: 77.234.148.154:8942
        TUNNELDIGGER_BRIDGE: td-vpn0
      networks:
        - id: td-vpn0
      volumes:
        /srv/log/tunneldigger/vpn0:
          bind: /var/log/tunneldigger
          user: nobody
          group: nogroup
