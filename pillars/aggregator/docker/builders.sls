docker:
  containers:
    # LEDE.
    builderar71xx_generic_lede:
      image: otvorenamreza/openwrt-builder
      tag: 18.06.1_ar71xx_generic
      network_mode:
        name: nodewatcher
      environment:
        BUILDER_PUBLIC_KEY: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCdqJhdBCJB3oMkhw0WiJ+JPrZjNQ2d8QVFx0BuuzRrDrQinuwcwNIzTcDBwzRhH53Z4Dx4nEMyNorZJwSWtMBUYlEHprZfc6x6/uOyb0c7bMg4VpQhrhJsSx2VLyzee/XtCNpo51qTkq/FoNXYx3xjgWVjwJ3iWZ46526Voru7hYlzDW8XOwqXAEpdnfnXIa37xj/Aopn1x7q7CaGXy7ASvbM46dXDHFSfpLn+NYTHQCbM07oHcTXoTfcMaCAX6Ot9tJ0G2tlY7IiXuQIQlnNRVezYn9gzzQpP5UZ9km3njMb+AlFjtyAJaKUngnzGteUk73K0Clwwu7qmSHZQbI5n builder@wlan-si.net
    builderar71xx_tiny_lede:
      image: otvorenamreza/openwrt-builder
      tag: 18.06.1_ar71xx_tiny
      network_mode:
        name: nodewatcher
      environment:
        BUILDER_PUBLIC_KEY: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCdqJhdBCJB3oMkhw0WiJ+JPrZjNQ2d8QVFx0BuuzRrDrQinuwcwNIzTcDBwzRhH53Z4Dx4nEMyNorZJwSWtMBUYlEHprZfc6x6/uOyb0c7bMg4VpQhrhJsSx2VLyzee/XtCNpo51qTkq/FoNXYx3xjgWVjwJ3iWZ46526Voru7hYlzDW8XOwqXAEpdnfnXIa37xj/Aopn1x7q7CaGXy7ASvbM46dXDHFSfpLn+NYTHQCbM07oHcTXoTfcMaCAX6Ot9tJ0G2tlY7IiXuQIQlnNRVezYn9gzzQpP5UZ9km3njMb+AlFjtyAJaKUngnzGteUk73K0Clwwu7qmSHZQbI5n builder@wlan-si.net
    builderar71xx_nand_lede:
      image: otvorenamreza/openwrt-builder
      tag: 18.06.1_ar71xx_nand
      network_mode:
        name: nodewatcher
      environment:
        BUILDER_PUBLIC_KEY: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCdqJhdBCJB3oMkhw0WiJ+JPrZjNQ2d8QVFx0BuuzRrDrQinuwcwNIzTcDBwzRhH53Z4Dx4nEMyNorZJwSWtMBUYlEHprZfc6x6/uOyb0c7bMg4VpQhrhJsSx2VLyzee/XtCNpo51qTkq/FoNXYx3xjgWVjwJ3iWZ46526Voru7hYlzDW8XOwqXAEpdnfnXIa37xj/Aopn1x7q7CaGXy7ASvbM46dXDHFSfpLn+NYTHQCbM07oHcTXoTfcMaCAX6Ot9tJ0G2tlY7IiXuQIQlnNRVezYn9gzzQpP5UZ9km3njMb+AlFjtyAJaKUngnzGteUk73K0Clwwu7qmSHZQbI5n builder@wlan-si.net
    builderar71xx_mikrotik_lede:
      image: otvorenamreza/openwrt-builder
      tag: 18.06.1_ar71xx_mikrotik
      network_mode:
        name: nodewatcher
      environment:
        BUILDER_PUBLIC_KEY: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCdqJhdBCJB3oMkhw0WiJ+JPrZjNQ2d8QVFx0BuuzRrDrQinuwcwNIzTcDBwzRhH53Z4Dx4nEMyNorZJwSWtMBUYlEHprZfc6x6/uOyb0c7bMg4VpQhrhJsSx2VLyzee/XtCNpo51qTkq/FoNXYx3xjgWVjwJ3iWZ46526Voru7hYlzDW8XOwqXAEpdnfnXIa37xj/Aopn1x7q7CaGXy7ASvbM46dXDHFSfpLn+NYTHQCbM07oHcTXoTfcMaCAX6Ot9tJ0G2tlY7IiXuQIQlnNRVezYn9gzzQpP5UZ9km3njMb+AlFjtyAJaKUngnzGteUk73K0Clwwu7qmSHZQbI5n builder@wlan-si.net
    buildermt7620_lede:
      image: otvorenamreza/openwrt-builder
      tag: 18.06.1_ramips_mt7620
      network_mode:
        name: nodewatcher
      environment:
        BUILDER_PUBLIC_KEY: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCdqJhdBCJB3oMkhw0WiJ+JPrZjNQ2d8QVFx0BuuzRrDrQinuwcwNIzTcDBwzRhH53Z4Dx4nEMyNorZJwSWtMBUYlEHprZfc6x6/uOyb0c7bMg4VpQhrhJsSx2VLyzee/XtCNpo51qTkq/FoNXYx3xjgWVjwJ3iWZ46526Voru7hYlzDW8XOwqXAEpdnfnXIa37xj/Aopn1x7q7CaGXy7ASvbM46dXDHFSfpLn+NYTHQCbM07oHcTXoTfcMaCAX6Ot9tJ0G2tlY7IiXuQIQlnNRVezYn9gzzQpP5UZ9km3njMb+AlFjtyAJaKUngnzGteUk73K0Clwwu7qmSHZQbI5n builder@wlan-si.net
    buildermt7621_lede:
      image: otvorenamreza/openwrt-builder
      tag: 18.06.1_ramips_mt7621
      network_mode:
        name: nodewatcher
      environment:
        BUILDER_PUBLIC_KEY: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCdqJhdBCJB3oMkhw0WiJ+JPrZjNQ2d8QVFx0BuuzRrDrQinuwcwNIzTcDBwzRhH53Z4Dx4nEMyNorZJwSWtMBUYlEHprZfc6x6/uOyb0c7bMg4VpQhrhJsSx2VLyzee/XtCNpo51qTkq/FoNXYx3xjgWVjwJ3iWZ46526Voru7hYlzDW8XOwqXAEpdnfnXIa37xj/Aopn1x7q7CaGXy7ASvbM46dXDHFSfpLn+NYTHQCbM07oHcTXoTfcMaCAX6Ot9tJ0G2tlY7IiXuQIQlnNRVezYn9gzzQpP5UZ9km3njMb+AlFjtyAJaKUngnzGteUk73K0Clwwu7qmSHZQbI5n builder@wlan-si.net
   buildermt76x8_lede:
      image: otvorenamreza/openwrt-builder
      tag: 18.06.1_ramips_mt76x8
      network_mode:
        name: nodewatcher
      environment:
        BUILDER_PUBLIC_KEY: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCdqJhdBCJB3oMkhw0WiJ+JPrZjNQ2d8QVFx0BuuzRrDrQinuwcwNIzTcDBwzRhH53Z4Dx4nEMyNorZJwSWtMBUYlEHprZfc6x6/uOyb0c7bMg4VpQhrhJsSx2VLyzee/XtCNpo51qTkq/FoNXYx3xjgWVjwJ3iWZ46526Voru7hYlzDW8XOwqXAEpdnfnXIa37xj/Aopn1x7q7CaGXy7ASvbM46dXDHFSfpLn+NYTHQCbM07oHcTXoTfcMaCAX6Ot9tJ0G2tlY7IiXuQIQlnNRVezYn9gzzQpP5UZ9km3njMb+AlFjtyAJaKUngnzGteUk73K0Clwwu7qmSHZQbI5n builder@wlan-si.net
    builderx86_64_lede:
      image: otvorenamreza/openwrt-builder
      tag: 18.06.1_x86_64
      network_mode:
        name: nodewatcher
      environment:
        BUILDER_PUBLIC_KEY: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCdqJhdBCJB3oMkhw0WiJ+JPrZjNQ2d8QVFx0BuuzRrDrQinuwcwNIzTcDBwzRhH53Z4Dx4nEMyNorZJwSWtMBUYlEHprZfc6x6/uOyb0c7bMg4VpQhrhJsSx2VLyzee/XtCNpo51qTkq/FoNXYx3xjgWVjwJ3iWZ46526Voru7hYlzDW8XOwqXAEpdnfnXIa37xj/Aopn1x7q7CaGXy7ASvbM46dXDHFSfpLn+NYTHQCbM07oHcTXoTfcMaCAX6Ot9tJ0G2tlY7IiXuQIQlnNRVezYn9gzzQpP5UZ9km3njMb+AlFjtyAJaKUngnzGteUk73K0Clwwu7qmSHZQbI5n builder@wlan-si.net
    builderipq40xx_lede:
      image: otvorenamreza/openwrt-builder
      tag: 18.06.1_ipq40xx_generic
      network_mode:
        name: nodewatcher
      environment:
        BUILDER_PUBLIC_KEY: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCdqJhdBCJB3oMkhw0WiJ+JPrZjNQ2d8QVFx0BuuzRrDrQinuwcwNIzTcDBwzRhH53Z4Dx4nEMyNorZJwSWtMBUYlEHprZfc6x6/uOyb0c7bMg4VpQhrhJsSx2VLyzee/XtCNpo51qTkq/FoNXYx3xjgWVjwJ3iWZ46526Voru7hYlzDW8XOwqXAEpdnfnXIa37xj/Aopn1x7q7CaGXy7ASvbM46dXDHFSfpLn+NYTHQCbM07oHcTXoTfcMaCAX6Ot9tJ0G2tlY7IiXuQIQlnNRVezYn9gzzQpP5UZ9km3njMb+AlFjtyAJaKUngnzGteUk73K0Clwwu7qmSHZQbI5n builder@wlan-si.net
    builderbcm2708_lede:
      image: otvorenamreza/openwrt-builder
      tag: 18.06.1_brcm2708_bcm2708
      network_mode:
        name: nodewatcher
      environment:
        BUILDER_PUBLIC_KEY: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCdqJhdBCJB3oMkhw0WiJ+JPrZjNQ2d8QVFx0BuuzRrDrQinuwcwNIzTcDBwzRhH53Z4Dx4nEMyNorZJwSWtMBUYlEHprZfc6x6/uOyb0c7bMg4VpQhrhJsSx2VLyzee/XtCNpo51qTkq/FoNXYx3xjgWVjwJ3iWZ46526Voru7hYlzDW8XOwqXAEpdnfnXIa37xj/Aopn1x7q7CaGXy7ASvbM46dXDHFSfpLn+NYTHQCbM07oHcTXoTfcMaCAX6Ot9tJ0G2tlY7IiXuQIQlnNRVezYn9gzzQpP5UZ9km3njMb+AlFjtyAJaKUngnzGteUk73K0Clwwu7qmSHZQbI5n builder@wlan-si.net
    builderrt305x_lede:
      image: otvorenamreza/openwrt-builder
      tag: 18.06.1_ramips_rt305x
      network_mode:
        name: nodewatcher
      environment:
        BUILDER_PUBLIC_KEY: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCdqJhdBCJB3oMkhw0WiJ+JPrZjNQ2d8QVFx0BuuzRrDrQinuwcwNIzTcDBwzRhH53Z4Dx4nEMyNorZJwSWtMBUYlEHprZfc6x6/uOyb0c7bMg4VpQhrhJsSx2VLyzee/XtCNpo51qTkq/FoNXYx3xjgWVjwJ3iWZ46526Voru7hYlzDW8XOwqXAEpdnfnXIa37xj/Aopn1x7q7CaGXy7ASvbM46dXDHFSfpLn+NYTHQCbM07oHcTXoTfcMaCAX6Ot9tJ0G2tlY7IiXuQIQlnNRVezYn9gzzQpP5UZ9km3njMb+AlFjtyAJaKUngnzGteUk73K0Clwwu7qmSHZQbI5n builder@wlan-si.net
