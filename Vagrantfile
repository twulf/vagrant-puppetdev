# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "centos-6.6-x86_64_minimal"

  config.vm.hostname = "devlocal-puppet01.hobsons.local"

  config.vm.provision "shell", path: "provision.sh"

  config.vm.provision "shell", inline: <<-SHELL
    sudo yum -y install puppet-3.8.6
  SHELL

  config.vm.synced_folder "~/Documents/workspace/hieradata", "/tmp/hieradata"

  config.vm.provision "puppet" do |puppet|
    puppet.manifest_file = "site.pp"
    puppet.manifests_path = "~/Documents/workspace/puppet/manifests"
    puppet.module_path = "~/Documents/workspace/puppet/modules"
    puppet.hiera_config_path = "hiera.yaml"
    puppet.working_directory = "/tmp/vagrant-puppet"
    puppet.options << "--yamldir /tmp/hieradata"
    puppet.options << "--environment dev_local"
  end

end
