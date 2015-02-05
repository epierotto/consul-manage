#
# Cookbook Name:: consul-manage
# Recipe:: _remove
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

consul_services = node['consul-manage']['service']['names']
bag = "#{node['consul-manage']['service']['data_bag']}"

consul_services.each do |service|

  # Load container config from data_bag
  consul_service = data_bag_item( bag, service)

  
  service = "#{consul_service['service']}"
  
  # Remove the Consul service
  consul_service_def "#{service}" do
    action :delete
    notifies :reload, 'service[consul]'
    notifies :restart, 'service[dnsmasq]'
  end

end
