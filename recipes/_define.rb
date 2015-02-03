#
# Cookbook Name:: consul-manage
# Recipe:: _define
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

service = "#{node['consul-manage']['service']}"
port = node['consul-manage']['port']
tags = node['consul-manage']['tags']
check_interval = "#{node['consul-manage']['check']['interval']}"
check_script = "#{node['consul-manage']['check']['script']}"

# For checking port connectivity
package "nc"

consul_service_def "#{service}" do
  port port
  tags tags
  check(
    interval: "#{check_interval}",
    script: "#{check_script}"
  )
  notifies :reload, 'service[consul]'
  notifies :restart, 'service[dnsmasq]'
end


