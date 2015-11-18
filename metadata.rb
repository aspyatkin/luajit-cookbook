name 'luajit'
maintainer 'Alexander Pyatkin'
maintainer_email 'aspyatkin@gmail.com'
license 'MIT'
description 'Installs and configures luajit'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '1.0.0'

recipe 'luajit', 'Installs and configures luajit'

depends 'apt'
depends 'build-essential'
