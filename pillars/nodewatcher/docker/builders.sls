docker:
  containers:
    # OpenWrt only.
    builderar71xx_generic_lede:
      image: otvorenamreza/openwrt-builder
      tag: 18.06.1_ar71xx_generic
      network_mode:
        name: nodewatcher
      environment:
        BUILDER_PUBLIC_KEY: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDKV/HjziXwhsQLFtsyQX3ybKxQ/w2Sa8ymPyHcbsO42iaNjdgAGMpiy0c6N3MwfcGbsGKLdA1/x6xQLsh7VIvG5B45F1IcIucVBut8ip3cYme1Ny1sUc4P0o0ZusdwFIweVF1Y6shT2XMWBycA3Ln4zVUdosBO5k7nZDbFZZZ1ybobB0tCXchSqcRvflKoOYLSAIfl0TbMb+58Y1AcaH59WrQ6HDgaH1lQa2D5JQ25ZXxHzahYkxB96sZOg72Xw52uqiT/LlWDgXe6/GzBRGMX5K/wUextc4PPAT/VGzSPuhBt8gj5TEb3oNGRNlxqYaiv9ctyFyNZurAgTuqKstcx root@temp-for-install
    builderar71xx_tiny_lede:
      image: otvorenamreza/openwrt-builder
      tag: 18.06.1_ar71xx_tiny
      network_mode:
        name: nodewatcher
      environment:
        BUILDER_PUBLIC_KEY: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDKV/HjziXwhsQLFtsyQX3ybKxQ/w2Sa8ymPyHcbsO42iaNjdgAGMpiy0c6N3MwfcGbsGKLdA1/x6xQLsh7VIvG5B45F1IcIucVBut8ip3cYme1Ny1sUc4P0o0ZusdwFIweVF1Y6shT2XMWBycA3Ln4zVUdosBO5k7nZDbFZZZ1ybobB0tCXchSqcRvflKoOYLSAIfl0TbMb+58Y1AcaH59WrQ6HDgaH1lQa2D5JQ25ZXxHzahYkxB96sZOg72Xw52uqiT/LlWDgXe6/GzBRGMX5K/wUextc4PPAT/VGzSPuhBt8gj5TEb3oNGRNlxqYaiv9ctyFyNZurAgTuqKstcx root@temp-for-install
    builderar71xx_nand_lede:
      image: otvorenamreza/openwrt-builder
      tag: 18.06.1_ar71xx_nand
      network_mode:
        name: nodewatcher
      environment:
        BUILDER_PUBLIC_KEY: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDKV/HjziXwhsQLFtsyQX3ybKxQ/w2Sa8ymPyHcbsO42iaNjdgAGMpiy0c6N3MwfcGbsGKLdA1/x6xQLsh7VIvG5B45F1IcIucVBut8ip3cYme1Ny1sUc4P0o0ZusdwFIweVF1Y6shT2XMWBycA3Ln4zVUdosBO5k7nZDbFZZZ1ybobB0tCXchSqcRvflKoOYLSAIfl0TbMb+58Y1AcaH59WrQ6HDgaH1lQa2D5JQ25ZXxHzahYkxB96sZOg72Xw52uqiT/LlWDgXe6/GzBRGMX5K/wUextc4PPAT/VGzSPuhBt8gj5TEb3oNGRNlxqYaiv9ctyFyNZurAgTuqKstcx root@temp-for-install
    builderar71xx_mikrotik_lede:
      image: otvorenamreza/openwrt-builder
      tag: 18.06.1_ar71xx_mikrotik
      network_mode:
        name: nodewatcher
      environment:
        BUILDER_PUBLIC_KEY: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDKV/HjziXwhsQLFtsyQX3ybKxQ/w2Sa8ymPyHcbsO42iaNjdgAGMpiy0c6N3MwfcGbsGKLdA1/x6xQLsh7VIvG5B45F1IcIucVBut8ip3cYme1Ny1sUc4P0o0ZusdwFIweVF1Y6shT2XMWBycA3Ln4zVUdosBO5k7nZDbFZZZ1ybobB0tCXchSqcRvflKoOYLSAIfl0TbMb+58Y1AcaH59WrQ6HDgaH1lQa2D5JQ25ZXxHzahYkxB96sZOg72Xw52uqiT/LlWDgXe6/GzBRGMX5K/wUextc4PPAT/VGzSPuhBt8gj5TEb3oNGRNlxqYaiv9ctyFyNZurAgTuqKstcx root@temp-for-install
    buildermt7620_lede:
      image: otvorenamreza/openwrt-builder
      tag: 18.06.1_ramips_mt7620
      network_mode:
        name: nodewatcher
      environment:
        BUILDER_PUBLIC_KEY: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDKV/HjziXwhsQLFtsyQX3ybKxQ/w2Sa8ymPyHcbsO42iaNjdgAGMpiy0c6N3MwfcGbsGKLdA1/x6xQLsh7VIvG5B45F1IcIucVBut8ip3cYme1Ny1sUc4P0o0ZusdwFIweVF1Y6shT2XMWBycA3Ln4zVUdosBO5k7nZDbFZZZ1ybobB0tCXchSqcRvflKoOYLSAIfl0TbMb+58Y1AcaH59WrQ6HDgaH1lQa2D5JQ25ZXxHzahYkxB96sZOg72Xw52uqiT/LlWDgXe6/GzBRGMX5K/wUextc4PPAT/VGzSPuhBt8gj5TEb3oNGRNlxqYaiv9ctyFyNZurAgTuqKstcx root@temp-for-install
    buildermt7621_lede:
      image: otvorenamreza/openwrt-builder
      tag: 18.06.1_ramips_mt7621
      network_mode:
        name: nodewatcher
      environment:
        BUILDER_PUBLIC_KEY: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDKV/HjziXwhsQLFtsyQX3ybKxQ/w2Sa8ymPyHcbsO42iaNjdgAGMpiy0c6N3MwfcGbsGKLdA1/x6xQLsh7VIvG5B45F1IcIucVBut8ip3cYme1Ny1sUc4P0o0ZusdwFIweVF1Y6shT2XMWBycA3Ln4zVUdosBO5k7nZDbFZZZ1ybobB0tCXchSqcRvflKoOYLSAIfl0TbMb+58Y1AcaH59WrQ6HDgaH1lQa2D5JQ25ZXxHzahYkxB96sZOg72Xw52uqiT/LlWDgXe6/GzBRGMX5K/wUextc4PPAT/VGzSPuhBt8gj5TEb3oNGRNlxqYaiv9ctyFyNZurAgTuqKstcx root@temp-for-install
    buildermt76x8_lede:
      image: otvorenamreza/openwrt-builder
      tag: 18.06.1_ramips_mt76x8
      network_mode:
        name: nodewatcher
      environment:
        BUILDER_PUBLIC_KEY: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDKV/HjziXwhsQLFtsyQX3ybKxQ/w2Sa8ymPyHcbsO42iaNjdgAGMpiy0c6N3MwfcGbsGKLdA1/x6xQLsh7VIvG5B45F1IcIucVBut8ip3cYme1Ny1sUc4P0o0ZusdwFIweVF1Y6shT2XMWBycA3Ln4zVUdosBO5k7nZDbFZZZ1ybobB0tCXchSqcRvflKoOYLSAIfl0TbMb+58Y1AcaH59WrQ6HDgaH1lQa2D5JQ25ZXxHzahYkxB96sZOg72Xw52uqiT/LlWDgXe6/GzBRGMX5K/wUextc4PPAT/VGzSPuhBt8gj5TEb3oNGRNlxqYaiv9ctyFyNZurAgTuqKstcx root@temp-for-install
    builderx86_64_lede:
      image: otvorenamreza/openwrt-builder
      tag: 18.06.1_x86_64
      network_mode:
        name: nodewatcher
      environment:
        BUILDER_PUBLIC_KEY: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDKV/HjziXwhsQLFtsyQX3ybKxQ/w2Sa8ymPyHcbsO42iaNjdgAGMpiy0c6N3MwfcGbsGKLdA1/x6xQLsh7VIvG5B45F1IcIucVBut8ip3cYme1Ny1sUc4P0o0ZusdwFIweVF1Y6shT2XMWBycA3Ln4zVUdosBO5k7nZDbFZZZ1ybobB0tCXchSqcRvflKoOYLSAIfl0TbMb+58Y1AcaH59WrQ6HDgaH1lQa2D5JQ25ZXxHzahYkxB96sZOg72Xw52uqiT/LlWDgXe6/GzBRGMX5K/wUextc4PPAT/VGzSPuhBt8gj5TEb3oNGRNlxqYaiv9ctyFyNZurAgTuqKstcx root@temp-for-install
    builderipq40xx_lede:
      image: otvorenamreza/openwrt-builder
      tag: 18.06.1_ipq40xx_generic
      network_mode:
        name: nodewatcher
      environment:
        BUILDER_PUBLIC_KEY: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDKV/HjziXwhsQLFtsyQX3ybKxQ/w2Sa8ymPyHcbsO42iaNjdgAGMpiy0c6N3MwfcGbsGKLdA1/x6xQLsh7VIvG5B45F1IcIucVBut8ip3cYme1Ny1sUc4P0o0ZusdwFIweVF1Y6shT2XMWBycA3Ln4zVUdosBO5k7nZDbFZZZ1ybobB0tCXchSqcRvflKoOYLSAIfl0TbMb+58Y1AcaH59WrQ6HDgaH1lQa2D5JQ25ZXxHzahYkxB96sZOg72Xw52uqiT/LlWDgXe6/GzBRGMX5K/wUextc4PPAT/VGzSPuhBt8gj5TEb3oNGRNlxqYaiv9ctyFyNZurAgTuqKstcx root@temp-for-install
    builderbcm2708_lede:
      image: otvorenamreza/openwrt-builder
      tag: 18.06.1_brcm2708_bcm2708
      network_mode:
        name: nodewatcher
      environment:
        BUILDER_PUBLIC_KEY: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDKV/HjziXwhsQLFtsyQX3ybKxQ/w2Sa8ymPyHcbsO42iaNjdgAGMpiy0c6N3MwfcGbsGKLdA1/x6xQLsh7VIvG5B45F1IcIucVBut8ip3cYme1Ny1sUc4P0o0ZusdwFIweVF1Y6shT2XMWBycA3Ln4zVUdosBO5k7nZDbFZZZ1ybobB0tCXchSqcRvflKoOYLSAIfl0TbMb+58Y1AcaH59WrQ6HDgaH1lQa2D5JQ25ZXxHzahYkxB96sZOg72Xw52uqiT/LlWDgXe6/GzBRGMX5K/wUextc4PPAT/VGzSPuhBt8gj5TEb3oNGRNlxqYaiv9ctyFyNZurAgTuqKstcx root@temp-for-install
    builderrt305x_lede:
      image: otvorenamreza/openwrt-builder
      tag: 18.06.1_ramips_rt305x
      network_mode:
        name: nodewatcher
      environment:
        BUILDER_PUBLIC_KEY: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDKV/HjziXwhsQLFtsyQX3ybKxQ/w2Sa8ymPyHcbsO42iaNjdgAGMpiy0c6N3MwfcGbsGKLdA1/x6xQLsh7VIvG5B45F1IcIucVBut8ip3cYme1Ny1sUc4P0o0ZusdwFIweVF1Y6shT2XMWBycA3Ln4zVUdosBO5k7nZDbFZZZ1ybobB0tCXchSqcRvflKoOYLSAIfl0TbMb+58Y1AcaH59WrQ6HDgaH1lQa2D5JQ25ZXxHzahYkxB96sZOg72Xw52uqiT/LlWDgXe6/GzBRGMX5K/wUextc4PPAT/VGzSPuhBt8gj5TEb3oNGRNlxqYaiv9ctyFyNZurAgTuqKstcx root@temp-for-install
