# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

domain = "example.co.uk"
settings = {
  :hostname => "myapp",
  :box => "precise64",
  :ip => "192.168.33.10",
}

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    # Box name
    config.vm.box = settings[:box]

    # Hostname
    config.vm.host_name = "#{settings[:hostname]}.#{domain}"

    # Virtualbox provider box url
    config.vm.provider "virtualbox" do |vb|
        config.vm.box_url = "http://files.vagrantup.com/#{settings[:box]}.box"
    end
    # VMWare provider box url
    config.vm.provider "vmware" do |vb|
        config.vm.box_url = "http://files.vagrantup.com/#{settings[:box]}_vmware.box"
    end

    # Port forwarding
    config.vm.network :forwarded_port, guest: 80, host: 8080

    # Host-only access private network
    config.vm.network :private_network, ip: settings[:ip]

    # Shared folders
    config.vm.synced_folder "src/", "/var/www/#{settings[:hostname]}.#{domain}/src"

    # Puppet config
    config.vm.provision :puppet do |puppet|
        puppet.manifests_path = "puppet/manifests"
        puppet.manifest_file  = "site.pp"
        puppet.module_path = "puppet/modules"
    end

end
