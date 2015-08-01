#
# Cookbook Name:: gnome3
# Recipe:: default
#
# Copyright 2015, Ivan Li
#
# All rights reserved - Do Not Redistribute
#

package 'lightdm'
package 'ubuntu-gnome-desktop'

bash 'reconfigure lightdm' do
  code <<-EOH
  
sudo debconf-set-selections <<-EOF
  gdm     shared/default-x-display-manager      select    lightdm
  lightdm shared/default-x-display-manager      select    lightdm
EOF
sudo DEBIAN_FRONTEND="noninteractive" dpkg-reconfigure lightdm

  EOH
end