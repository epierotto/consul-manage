#
# Cookbook Name:: consul-manage
# Recipe:: dns
#
# Copyright (C) 2015 Exequiel Pierotto
#
# All rights reserved - Do Not Redistribute
#

# Select the right network service name

case node["platform"]
  when "centos","redhat","fedora"
    service_name = "network"
    dhclient_conf = "/etc/dhcp/dhclient-eth0.conf"
  else
    service_name = "networking"
    dhclient_conf = "/etc/dhcp/dhclient.conf"
end

# Install dnsmasq

package 'dnsmasq' do
  action :install
end

service 'dnsmasq' do
  action [ :enable, :start ]
end

file '/etc/dnsmasq.conf' do
  content "server=/consul/127.0.0.1##{node[:consul][:ports][:dns]}"
  notifies :restart, "service[dnsmasq]", :immediately
end

service "#{service_name}" do
  action :nothing
end

file "#{dhclient_conf}" do
  content <<-eos
timeout 300;
prepend domain-name-servers 127.0.0.1;
  eos
  notifies :restart, "service[#{service_name}]"
end
