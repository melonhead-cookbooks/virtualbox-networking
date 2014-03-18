#
# Cookbook Name:: virtualbox-networking
# Recipe:: default
#
# Copyright (C) 2014 Salesforce Pardot
#
# All rights reserved - Do Not Redistribute
#

(0..5).each do |adapter|
  execute "Remove VirtualBox adapter vboxnet#{adapter}" do
    command "sudo VBoxManage hostonlyif remove vboxnet#{adapter}"
    action :run
    only_if "ifconfig vboxnet#{adapter} 2>/dev/null | grep -q inet"
  end
end
