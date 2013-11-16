# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
	config.vm.box = "quantal"
	config.vm.box_url = "https://github.com/downloads/roderik/VagrantQuantal64Box/quantal64.box"

	config.ssh.forward_agent = true

	config.vm.network :private_network, ip: "192.168.23.6"

	config.vm.provision :chef_solo do |chef|
		chef.cookbooks_path = [ "cookbooks", "site-cookbooks" ]

		#chef.log_level = :debug

		chef.add_recipe "typo3-cms"

	end

	config.vm.provider "virtualbox" do |v|
		v.name = "TYPO3 CMS"
		v.customize ["modifyvm", :id, "--memory", "2048"]
	end
end
