docker:
  containers:
    # Create a container that will hold the actual network resources for interacting with
    # the mesh network. This way, multiple other containers can share this network which
    # will not get lost even if the individual containers are taken down.
    mesh-network:
      image: kubernetes/pause
      network_mode:
        name: nodewatcher
      networks:
        - id: td-vpn0
          ips:
            - address: 10.31.0.16/16
    # Babel routing protocol.
    babeld:
      image: robimarko/docker-router-babeld
      # Privileges needed because Docker does otherwise not allow setting network sysctls.
      # See: https://github.com/docker/docker/issues/4717#issuecomment-98653017
      privileged: true
      # TODO: The below capability drop does not really work for privileged containers.
      capabilities:
        # Drop all capabilities as the container is in privileged mode.
        - name: ALL
          drop: true
        # Only allow a small subset of capabilities.
        - NET_ADMIN
      environment:
        ROUTER_INTERFACES: td-vpn0
        BABELD_DISABLE_ANNOUNCE: 1
      network_mode:
        type: container
        container: mesh-network
