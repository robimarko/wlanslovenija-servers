Otvorena Mreza servers installation
===================================

This repository contains Salt_ files to deploy various *Otvorena mreza* servers.
Expected to be used with Ubuntu Server 14.04 and 16.04, but it might work with other distributions
as well.

.. _Salt: http://docs.saltstack.com/en/latest/

You should create a ``config/roster`` file with something like::

    nodewatcher:
      host: nodes.otvorenamreza.org
      port: 22
      user: <username>
      passwd: <password>
      sudo: True

Then you can sync the state of a server by doing::

    $ salt-ssh '<servername>' state.highstate

Secrets are encrypted with a GPG keypair to be protected. Future secrets can be encrypted using::

    echo -n "supersecret" | gpg --armor --encrypt -r <keyid>

`See Salt GPG renderer documentation for more information`_.

.. _See Salt GPG renderer documentation for more information: https://docs.saltstack.com/en/latest/ref/renderers/all/salt.renderers.gpg.html

Source Code
-------------------------------------------

Source code is available on GitHub_.
.. _GitHub: https://github.com/wlanslovenija/servers-salt-states
