#
# Cookbook Name:: keepalived
# Recipe:: default
#
# Copyright 2013, LLC Express42
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

package 'keepalived' do
  action :install
end

directory '/etc/keepalived/conf.d' do
  action :create
  owner 'root'
  group 'root'
  mode '0775'
end

template 'keepalived.conf' do
  path '/etc/keepalived/keepalived.conf'
  source 'keepalived.conf.erb'
  owner 'root'
  group 'root'
  mode 0644
end

service 'keepalived' do
  supports restart: true, status: true
  action [:enable, :start]
  subscribes :restart, 'template[keepalived.conf]'
end

keepalived_clean node['fqdn'] do
  notifies :reload, 'service[keepalived]', :delayed
end
