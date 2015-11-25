name 'luajit'
maintainer 'Alexander Pyatkin'
maintainer_email 'aspyatkin@gmail.com'
license 'MIT'
description 'Installs and configures luajit'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '1.0.0'

recipe 'luajit', 'Installs and configures luajit'

source_url 'https://github.com/aspyatkin/luajit-cookbook' if respond_to? :source_url

depends 'apt'
depends 'build-essential'
