#
# Cookbook Name:: consul-manage
# Attributes:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

# Attributes for setting up the consul service
default['consul-manage']['service']['names'] = ["redis"]
default['consul-manage']['service']['data_bag'] = "consul_services"

