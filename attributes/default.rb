#
# Cookbook Name:: consul-manage
# Attributes:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

# Attributes for setting up the consul service
default['consul-manage']['service'] = "http"
default['consul-manage']['port'] = 80
default['consul-manage']['tags'] = ['_docker._http']
default['consul-manage']['check']['interval'] = '30s'
default['consul-manage']['check']['script'] = "nc -zv #{node['consul-manage']['service']}.service.consul #{node['consul-manage']['port']}"

