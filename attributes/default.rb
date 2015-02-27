#
# Cookbook Name:: consul-manage
# Attributes:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

# Attributes for setting up the consul service
default['consul-manage']['service']['names'] = []
default['consul-manage']['service']['data_bag'] = ""

# Attributes for setting up a consul key watch
default['consul-manage']['watch']['key']['names'] = []
default['consul-manage']['watch']['key']['data_bag'] = ""

# Attributes for setting up a consul event watch
default['consul-manage']['watch']['event']['names'] = []
default['consul-manage']['watch']['event']['data_bag'] = ""

# Attributes for setting up a consul service  watch
default['consul-manage']['watch']['service']['names'] = []
default['consul-manage']['watch']['service']['data_bag'] = ""

# Attributes for deploying the handlers scripts
default['consul-manage']['handlers']['packages'] = []
default['consul-manage']['handlers']['sources'] = []
default['consul-manage']['handlers']['dir'] = ""
