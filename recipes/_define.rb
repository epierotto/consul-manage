#
# Cookbook Name:: consul-manage
# Recipe:: _define
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
  port = consul_service['port']
  tags = consul_service['tags']
  check_interval = "#{consul_service['check']['interval']}"
  check_script = "#{consul_service['check']['script']}"
  
  # For checking port connectivity
  package "nc"
  
  consul_service_def "#{service}" do
    port port
    tags tags
    check(
      interval: "#{check_interval}",
      script: "#{check_script}"
    )
    notifies :reload, 'service[consul]', :immediately
    notifies :restart, 'service[dnsmasq]', :immediately
  end
  
end  
