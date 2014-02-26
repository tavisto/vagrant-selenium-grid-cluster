# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "centos65-x86_64-20131205"
  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  config.vm.box_url = "https://github.com/2creatives/vagrant-centos/releases/download/v6.5.1/centos65-x86_64-20131205.box"


  config.vm.define :hub do |config01|
      config01.vm.provider :virtualbox do |vb|
          vb.customize ["modifyvm", :id, "--memory", "512"]
      end
      config01.vm.host_name = "hub"
      config01.vm.network "forwarded_port", guest: 4444, host: 4444
      config01.vm.network "private_network", ip: "192.168.1.10"
      config01.vm.provision :shell, :path => "provisioning/bootstrap.sh"
      config01.vm.provision :puppet do |puppet|
          puppet.manifest_file = "hub.pp"
          puppet.module_path   = "provisioning/modules"
          puppet.manifests_path = "provisioning/manifests"
      end
  end
  config.vm.define :node do |config02|
      config02.vm.provider :virtualbox do |vb|
          vb.customize ["modifyvm", :id, "--memory", "512"]
      end
      config02.vm.host_name = "node"
      config02.vm.network "forwarded_port", guest: 4444, host: 4445
      config02.vm.network "forwarded_port", guest: 5900, host: 5901
      config02.vm.network "private_network", ip: "192.168.1.11"
      config02.vm.provision :shell, :path => "provisioning/bootstrap.sh"
      config02.vm.provision :puppet do |puppet|
          puppet.manifest_file = "node.pp"
          puppet.module_path   = "provisioning/modules"
          puppet.manifests_path = "provisioning/manifests"
      end
  end


end
