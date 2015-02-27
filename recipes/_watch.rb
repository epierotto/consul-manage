#
# Cookbook Name:: consul-manage
# Recipe:: _watch
#
# Copyright (C) 2015 Exequiel Pierotto
#
# All rights reserved - Do Not Redistribute
#

#### Key watch ####

watch_keys = node['consul-manage']['watch']['key']['names']
keys_bag = "#{node['consul-manage']['watch']['key']['data_bag']}"

watch_keys.each do |key_def|

  # Load config from data_bag
  watch_key = data_bag_item( keys_bag, key_def)

  key_watch_name = "#{watch_key['name']}"
  key = "#{watch_key['key']}"
  handler = watch_key['handler']
  
  # Key watch definition
  consul_key_watch_def "#{key_watch_name}" do
    key "#{key}"
    handler "#{handler}"
    notifies :reload, 'service[consul]', :immediately
  end
 
end  


#### Event watch ####

watch_events = node['consul-manage']['watch']['event']['names']
events_bag = "#{node['consul-manage']['watch']['event']['data_bag']}"

watch_events.each do |event|

  # Load config from data_bag
  watch_event = data_bag_item( events_bag, event)

  event_name = "#{watch_event['event_name']}"
  handler = watch_event['handler']
  
  # Event watch definition
  consul_event_watch_def "#{event_name}" do
    handler "#{handler}"
    notifies :reload, 'service[consul]', :immediately
  end
 
end  


#### Service watch ####

watch_services = node['consul-manage']['watch']['service']['names']
services_bag = "#{node['consul-manage']['watch']['service']['data_bag']}"

watch_services.each do |service|

  # Load config from data_bag
  watch_service = data_bag_item( services_bag, service)

  service_name = "#{watch_service['service_name']}"
  passingonly = watch_service['passingonly']
  handler = watch_service['handler']
  
  # Event watch definition
  consul_service_watch_def "#{service_name}" do
    passingonly passingonly
    handler "#{handler}"
    notifies :reload, 'service[consul]', :immediately
  end
end  
