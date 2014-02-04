ssl-vault Cookbook
======================

This cookbook manages OpenSSL key pairs, using
[chef-vault](https://github.com/Nordstrom/chef-vault/) to share and
store private keys.

This cookbook's home is at https://github.com/OnBeep/cookbook-ssl-vault

Requirements
------------

Usage
-----

1. Generate a self-signed key or a secret key and certificate.
2. Store the private key in chef-vault. The name should be set to
    *ssl-key-key.name*.:

        ruby -rjson -e 'puts JSON[Hash[Hash[*ARGV].map { |k,v| [k, File.read(v)] }]]' -- \
            chain.pem example.com.chain.pem \
            crt example.com.crt \
            csr example.com.csr \
            key example.com.key \
            pem example.com.pem \
            > example.com.json

        knife encrypt create certs --mode client \
            --search 'QUERY' --admins '' \
            --name ssl-key-example_com \
            --json /path/to/example.com.json

       Either add Chef server's admin API users to the `--admins`, or make
       the key otherwise accessible to yourself in future (e.g. with
       [knife-briefcase](https://github.com/3ofcoins/knife-briefcase/)).

3. Add the certificate to node's `ssl_certificates` attribute (key is
   key's name, and value is full certificate):

        node['ssl-vault']['certificates'] = {
          'example.com' => {...}
        }

4. Add `recipe[ssl-vault]` to node's run list.

The key will be stored in `/etc/ssl/private/key.name.key`, and
certificate in `/etc/ssl/certs/key.name.pem`.

TODOs
-----
Currently there are NO built-in tests (unit, spec, integration).

Author
------
Author:: Maciej Pasternacki <maciej@3ofcoins.net>
Author:: Greg Albrecht <gba@onbeep.com>

Copyright
---------
Copyright 2014 OnBeep, Inc.

License
-------
MIT TK
