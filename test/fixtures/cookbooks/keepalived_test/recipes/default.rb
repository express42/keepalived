include_recipe 'keepalived'

keepalived_check_script 'test' do
  script '/bin/true'
  action :create
end

file "#{node['keepalived']['confpath']}/test.conf" do
  action :create
end

keepalived_clean 'test' do
  action :run
end

keepalived_vrrp 'test' do
  interface 'eth0'
  virtual_ipaddress ['127.0.1.1']
  action :create
end

keepalived_virtual_server 'test' do
  vs_listen_ip '127.0.0.1'
  vs_listen_port '443'
  real_servers [{ 'ip' => '127.0.2.1', 'port' => '443' }, { 'ip' => '127.0.2.2', 'port' => '443' }]
  action :create
end
