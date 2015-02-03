#
# Cookbook Name:: consul-manage
# Recipe:: _remove
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

service = "#{node['consul-manage']['service']}"

# Remove the Consul service
consul_service_def "#{service}" do
  action :delete
  notifies :reload, 'service[consul]'
  notifies :restart, 'service[dnsmasq]'
end

