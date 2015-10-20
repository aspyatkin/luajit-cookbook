include_recipe 'build-essential'

luajit_name = "LuaJIT-#{node['luajit']['version']}"
luajit_tar = "#{luajit_name}.tar.gz"
luajit_tar_path = "#{Chef::Config['file_cache_path']}/#{luajit_tar}"
luajit_src_url = "#{node['luajit']['url']}/#{luajit_tar}"
luajit_src_dir = "#{Chef::Config['file_cache_path']}/#{luajit_name}"

remote_file luajit_tar_path do
  source luajit_src_url
  checksum node['luajit']['checksum']
  mode 0644
end

directory luajit_src_dir do
  action :create
end

execute "tar --no-same-owner -zxf #{luajit_tar} -C #{luajit_src_dir} --strip-components 1" do
  cwd "#{Chef::Config['file_cache_path']}"
  creates File.join(luajit_src_dir, 'Makefile')
end

execute 'LuaJIT compile and install' do
  environment({
    'PATH' => '/usr/local/bin:/usr/bin:/bin',
    'PREFIX' => "#{node['luajit']['dir']}"
  })
  command "make && make install"
  cwd luajit_src_dir
  creates File.join(node['luajit']['dir'], 'lib', node['luajit']['creates'])
end
