docker:
  containers:
    # OpenWrt only.
    builderar71xx_generic_lede:
      image: otvorenamreza/openwrt-builder
      tag: 18.06.1_ar71xx_generic_eoip
      network_mode:
        name: nodewatcher
      environment:
        BUILDER_PUBLIC_KEY: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDKV/HjziXwhsQLFtsyQX3ybKxQ/w2Sa8ymPyHcbsO42iaNjdgAGMpiy0c6N3MwfcGbsGKLdA1/x6xQLsh7VIvG5B45F1IcIucVBut8ip3cYme1Ny1sUc4P0o0ZusdwFIweVF1Y6shT2XMWBycA3Ln4zVUdosBO5k7nZDbFZZZ1ybobB0tCXchSqcRvflKoOYLSAIfl0TbMb+58Y1AcaH59WrQ6HDgaH1lQa2D5JQ25ZXxHzahYkxB96sZOg72Xw52uqiT/LlWDgXe6/GzBRGMX5K/wUextc4PPAT/VGzSPuhBt8gj5TEb3oNGRNlxqYaiv9ctyFyNZurAgTuqKstcx root@temp-for-install
    builderar71xx_tiny_lede:
      image: otvorenamreza/openwrt-builder
      tag: 18.06.1_ar71xx_tiny_eoip
      network_mode:
        name: nodewatcher
      environment:
        BUILDER_PUBLIC_KEY: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDKV/HjziXwhsQLFtsyQX3ybKxQ/w2Sa8ymPyHcbsO42iaNjdgAGMpiy0c6N3MwfcGbsGKLdA1/x6xQLsh7VIvG5B45F1IcIucVBut8ip3cYme1Ny1sUc4P0o0ZusdwFIweVF1Y6shT2XMWBycA3Ln4zVUdosBO5k7nZDbFZZZ1ybobB0tCXchSqcRvflKoOYLSAIfl0TbMb+58Y1AcaH59WrQ6HDgaH1lQa2D5JQ25ZXxHzahYkxB96sZOg72Xw52uqiT/LlWDgXe6/GzBRGMX5K/wUextc4PPAT/VGzSPuhBt8gj5TEb3oNGRNlxqYaiv9ctyFyNZurAgTuqKstcx root@temp-for-install
    builderar71xx_tiny_17_01:
      image: otvorenamreza/openwrt-builder
      tag: 17.01.6_ar71xx_tiny_17_01
      network_mode:
        name: nodewatcher
      environment:
        BUILDER_PUBLIC_KEY: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDKV/HjziXwhsQLFtsyQX3ybKxQ/w2Sa8ymPyHcbsO42iaNjdgAGMpiy0c6N3MwfcGbsGKLdA1/x6xQLsh7VIvG5B45F1IcIucVBut8ip3cYme1Ny1sUc4P0o0ZusdwFIweVF1Y6shT2XMWBycA3Ln4zVUdosBO5k7nZDbFZZZ1ybobB0tCXchSqcRvflKoOYLSAIfl0TbMb+58Y1AcaH59WrQ6HDgaH1lQa2D5JQ25ZXxHzahYkxB96sZOg72Xw52uqiT/LlWDgXe6/GzBRGMX5K/wUextc4PPAT/VGzSPuhBt8gj5TEb3oNGRNlxqYaiv9ctyFyNZurAgTuqKstcx root@temp-for-install
    builderar71xx_nand_lede:
      image: otvorenamreza/openwrt-builder
      tag: 18.06.1_ar71xx_nand_eoip
      network_mode:
        name: nodewatcher
      environment:
        BUILDER_PUBLIC_KEY: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDKV/HjziXwhsQLFtsyQX3ybKxQ/w2Sa8ymPyHcbsO42iaNjdgAGMpiy0c6N3MwfcGbsGKLdA1/x6xQLsh7VIvG5B45F1IcIucVBut8ip3cYme1Ny1sUc4P0o0ZusdwFIweVF1Y6shT2XMWBycA3Ln4zVUdosBO5k7nZDbFZZZ1ybobB0tCXchSqcRvflKoOYLSAIfl0TbMb+58Y1AcaH59WrQ6HDgaH1lQa2D5JQ25ZXxHzahYkxB96sZOg72Xw52uqiT/LlWDgXe6/GzBRGMX5K/wUextc4PPAT/VGzSPuhBt8gj5TEb3oNGRNlxqYaiv9ctyFyNZurAgTuqKstcx root@temp-for-install
    builderar71xx_mikrotik_lede:
      image: otvorenamreza/openwrt-builder
      tag: 18.06.1_ar71xx_mikrotik_eoip
      network_mode:
        name: nodewatcher
      environment:
        BUILDER_PUBLIC_KEY: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDKV/HjziXwhsQLFtsyQX3ybKxQ/w2Sa8ymPyHcbsO42iaNjdgAGMpiy0c6N3MwfcGbsGKLdA1/x6xQLsh7VIvG5B45F1IcIucVBut8ip3cYme1Ny1sUc4P0o0ZusdwFIweVF1Y6shT2XMWBycA3Ln4zVUdosBO5k7nZDbFZZZ1ybobB0tCXchSqcRvflKoOYLSAIfl0TbMb+58Y1AcaH59WrQ6HDgaH1lQa2D5JQ25ZXxHzahYkxB96sZOg72Xw52uqiT/LlWDgXe6/GzBRGMX5K/wUextc4PPAT/VGzSPuhBt8gj5TEb3oNGRNlxqYaiv9ctyFyNZurAgTuqKstcx root@temp-for-install
    buildermt7620_lede:
      image: otvorenamreza/openwrt-builder
      tag: 18.06.1_ramips_mt7620_eoip
      network_mode:
        name: nodewatcher
      environment:
        BUILDER_PUBLIC_KEY: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDKV/HjziXwhsQLFtsyQX3ybKxQ/w2Sa8ymPyHcbsO42iaNjdgAGMpiy0c6N3MwfcGbsGKLdA1/x6xQLsh7VIvG5B45F1IcIucVBut8ip3cYme1Ny1sUc4P0o0ZusdwFIweVF1Y6shT2XMWBycA3Ln4zVUdosBO5k7nZDbFZZZ1ybobB0tCXchSqcRvflKoOYLSAIfl0TbMb+58Y1AcaH59WrQ6HDgaH1lQa2D5JQ25ZXxHzahYkxB96sZOg72Xw52uqiT/LlWDgXe6/GzBRGMX5K/wUextc4PPAT/VGzSPuhBt8gj5TEb3oNGRNlxqYaiv9ctyFyNZurAgTuqKstcx root@temp-for-install
    buildermt7621_lede:
      image: otvorenamreza/openwrt-builder
      tag: 18.06.1_ramips_mt7621_eoip
      network_mode:
        name: nodewatcher
      environment:
        BUILDER_PUBLIC_KEY: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDKV/HjziXwhsQLFtsyQX3ybKxQ/w2Sa8ymPyHcbsO42iaNjdgAGMpiy0c6N3MwfcGbsGKLdA1/x6xQLsh7VIvG5B45F1IcIucVBut8ip3cYme1Ny1sUc4P0o0ZusdwFIweVF1Y6shT2XMWBycA3Ln4zVUdosBO5k7nZDbFZZZ1ybobB0tCXchSqcRvflKoOYLSAIfl0TbMb+58Y1AcaH59WrQ6HDgaH1lQa2D5JQ25ZXxHzahYkxB96sZOg72Xw52uqiT/LlWDgXe6/GzBRGMX5K/wUextc4PPAT/VGzSPuhBt8gj5TEb3oNGRNlxqYaiv9ctyFyNZurAgTuqKstcx root@temp-for-install
    buildermt76x8_lede:
      image: otvorenamreza/openwrt-builder
      tag: 18.06.1_ramips_mt76x8_eoip
      network_mode:
        name: nodewatcher
      environment:
        BUILDER_PUBLIC_KEY: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDKV/HjziXwhsQLFtsyQX3ybKxQ/w2Sa8ymPyHcbsO42iaNjdgAGMpiy0c6N3MwfcGbsGKLdA1/x6xQLsh7VIvG5B45F1IcIucVBut8ip3cYme1Ny1sUc4P0o0ZusdwFIweVF1Y6shT2XMWBycA3Ln4zVUdosBO5k7nZDbFZZZ1ybobB0tCXchSqcRvflKoOYLSAIfl0TbMb+58Y1AcaH59WrQ6HDgaH1lQa2D5JQ25ZXxHzahYkxB96sZOg72Xw52uqiT/LlWDgXe6/GzBRGMX5K/wUextc4PPAT/VGzSPuhBt8gj5TEb3oNGRNlxqYaiv9ctyFyNZurAgTuqKstcx root@temp-for-install
    builderx86_64_lede:
      image: otvorenamreza/openwrt-builder
      tag: 18.06.1_x86_64_eoip
      network_mode:
        name: nodewatcher
      environment:
        BUILDER_PUBLIC_KEY: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDKV/HjziXwhsQLFtsyQX3ybKxQ/w2Sa8ymPyHcbsO42iaNjdgAGMpiy0c6N3MwfcGbsGKLdA1/x6xQLsh7VIvG5B45F1IcIucVBut8ip3cYme1Ny1sUc4P0o0ZusdwFIweVF1Y6shT2XMWBycA3Ln4zVUdosBO5k7nZDbFZZZ1ybobB0tCXchSqcRvflKoOYLSAIfl0TbMb+58Y1AcaH59WrQ6HDgaH1lQa2D5JQ25ZXxHzahYkxB96sZOg72Xw52uqiT/LlWDgXe6/GzBRGMX5K/wUextc4PPAT/VGzSPuhBt8gj5TEb3oNGRNlxqYaiv9ctyFyNZurAgTuqKstcx root@temp-for-install
    builderipq40xx_lede:
      image: otvorenamreza/openwrt-builder
      tag: 18.06.1_ipq40xx_generic_eoip
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
    builderx86_64_lede_legacy:
      image: wlanslovenija/lede-builder
      tag: v078f89f_17_01_0_x86_64
      network_mode:
        name: nodewatcher
      environment:
        BUILDER_PUBLIC_KEY: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDKV/HjziXwhsQLFtsyQX3ybKxQ/w2Sa8ymPyHcbsO42iaNjdgAGMpiy0c6N3MwfcGbsGKLdA1/x6xQLsh7VIvG5B45F1IcIucVBut8ip3cYme1Ny1sUc4P0o0ZusdwFIweVF1Y6shT2XMWBycA3Ln4zVUdosBO5k7nZDbFZZZ1ybobB0tCXchSqcRvflKoOYLSAIfl0TbMb+58Y1AcaH59WrQ6HDgaH1lQa2D5JQ25ZXxHzahYkxB96sZOg72Xw52uqiT/LlWDgXe6/GzBRGMX5K/wUextc4PPAT/VGzSPuhBt8gj5TEb3oNGRNlxqYaiv9ctyFyNZurAgTuqKstcx root@temp-for-install
    builderipq40xx_meshpoint:
      image: otvorenamreza/openwrt-builder
      tag: snapshot_ipq40xx_meshpoint_eoip
      network_mode:
        name: nodewatcher
      environment:
        BUILDER_PUBLIC_KEY: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDKV/HjziXwhsQLFtsyQX3ybKxQ/w2Sa8ymPyHcbsO42iaNjdgAGMpiy0c6N3MwfcGbsGKLdA1/x6xQLsh7VIvG5B45F1IcIucVBut8ip3cYme1Ny1sUc4P0o0ZusdwFIweVF1Y6shT2XMWBycA3Ln4zVUdosBO5k7nZDbFZZZ1ybobB0tCXchSqcRvflKoOYLSAIfl0TbMb+58Y1AcaH59WrQ6HDgaH1lQa2D5JQ25ZXxHzahYkxB96sZOg72Xw52uqiT/LlWDgXe6/GzBRGMX5K/wUextc4PPAT/VGzSPuhBt8gj5TEb3oNGRNlxqYaiv9ctyFyNZurAgTuqKstcx root@temp-for-install
    builderath79_generic:
      image: otvorenamreza/openwrt-builder
      tag: snapshot_ath79_generic
      network_mode:
        name: nodewatcher
      environment:
        BUILDER_PUBLIC_KEY: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDKV/HjziXwhsQLFtsyQX3ybKxQ/w2Sa8ymPyHcbsO42iaNjdgAGMpiy0c6N3MwfcGbsGKLdA1/x6xQLsh7VIvG5B45F1IcIucVBut8ip3cYme1Ny1sUc4P0o0ZusdwFIweVF1Y6shT2XMWBycA3Ln4zVUdosBO5k7nZDbFZZZ1ybobB0tCXchSqcRvflKoOYLSAIfl0TbMb+58Y1AcaH59WrQ6HDgaH1lQa2D5JQ25ZXxHzahYkxB96sZOg72Xw52uqiT/LlWDgXe6/GzBRGMX5K/wUextc4PPAT/VGzSPuhBt8gj5TEb3oNGRNlxqYaiv9ctyFyNZurAgTuqKstcx root@temp-for-install
    builderath79_tiny:
      image: otvorenamreza/openwrt-builder
      tag: snapshot_ath79_tiny
      network_mode:
        name: nodewatcher
      environment:
        BUILDER_PUBLIC_KEY: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDKV/HjziXwhsQLFtsyQX3ybKxQ/w2Sa8ymPyHcbsO42iaNjdgAGMpiy0c6N3MwfcGbsGKLdA1/x6xQLsh7VIvG5B45F1IcIucVBut8ip3cYme1Ny1sUc4P0o0ZusdwFIweVF1Y6shT2XMWBycA3Ln4zVUdosBO5k7nZDbFZZZ1ybobB0tCXchSqcRvflKoOYLSAIfl0TbMb+58Y1AcaH59WrQ6HDgaH1lQa2D5JQ25ZXxHzahYkxB96sZOg72Xw52uqiT/LlWDgXe6/GzBRGMX5K/wUextc4PPAT/VGzSPuhBt8gj5TEb3oNGRNlxqYaiv9ctyFyNZurAgTuqKstcx root@temp-for-install
    builderath79_nand:
      image: otvorenamreza/openwrt-builder
      tag: snapshot_ath79_nand
      network_mode:
        name: nodewatcher
      environment:
        BUILDER_PUBLIC_KEY: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDKV/HjziXwhsQLFtsyQX3ybKxQ/w2Sa8ymPyHcbsO42iaNjdgAGMpiy0c6N3MwfcGbsGKLdA1/x6xQLsh7VIvG5B45F1IcIucVBut8ip3cYme1Ny1sUc4P0o0ZusdwFIweVF1Y6shT2XMWBycA3Ln4zVUdosBO5k7nZDbFZZZ1ybobB0tCXchSqcRvflKoOYLSAIfl0TbMb+58Y1AcaH59WrQ6HDgaH1lQa2D5JQ25ZXxHzahYkxB96sZOg72Xw52uqiT/LlWDgXe6/GzBRGMX5K/wUextc4PPAT/VGzSPuhBt8gj5TEb3oNGRNlxqYaiv9ctyFyNZurAgTuqKstcx root@temp-for-install
