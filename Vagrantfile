# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/trusty64"
  config.vm.network :private_network, ip: "192.168.1.2"
  config.vm.synced_folder "/Users/ayushagarwal/Projects/ems", "/vagrant", id: "web-root",
    owner: "vagrant",
    group: "www-data",
    mount_options: ["dmode=775,fmode=775"]
  config.vm.provision "shell" do |s|
    s.path = "provision/vagrant_provision.sh"
  end
end
