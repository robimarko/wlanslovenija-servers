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
        TUNNELDIGGER_UUID: f2177b15-7078-46d5-8cad-464f63d930ba
        TUNNELDIGGER_BROKERS: 77.234.148.154:8942
        TUNNELDIGGER_BRIDGE: td-vpn0
      networks:
        - id: td-vpn0
      volumes:
        /srv/log/tunneldigger/vpn0:
          bind: /var/log/tunneldigger
          user: nobody
          group: nogroup
