#
# Cookbook Name:: jboss
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

jboss_install_loc=node['jboss']['jboss_install_loc']
jboss_build_loc=node['jboss']['jboss_build_loc']

template "/tmp/jboss_install.properties" do
  source "jboss_install.properties.erb"
  owner "root" 
  mode "0644"  
end


execute "Install Jboss" do
  command " \"#{jboss_build_loc}\" -i silent -f \"/tmp/jboss_install.properties\" "  
  creates "#{jboss_install_loc}/JBossPostgreSQL_InstallLog.log"
  action :run
  
end




