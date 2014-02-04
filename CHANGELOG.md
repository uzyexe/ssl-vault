Change History
==============

1.0.0
-----
 - Changed to use 'chef-vault' Cookbook. - @ampledata
 - Chagned name to 'ssl-vault'. - @ampledata
 - Added 'chef-vault' Gem & Cookbook version constraints. - @ampledata
 - Movied all Attributes to 'ssl-vault' namespace. - @ampledata
 - Changed private & certificate dir to Attributes. - @ampledata
 - Factored out default Recipe into individual Recipies. - @ampledata
 - Changed 'ssl_certificates' Attribute to 'certificates'. - @ampledata

0.1.2
-----
 - Support multiple certificate files (for separate CA path file)

0.1.1
-----
 - Add default empty `node['ssl_certificates']`

0.1.0
-----
 - Initial release
