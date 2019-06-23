VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/xenial64"

  config.vm.define :mongo0 do | mongo |
    mongo.vm.hostname = "mongo0"
    mongo.vm.network :private_network, ip: "192.168.33.200"#, virtualbox__intnet: "intnet"
    mongo.vm.provision :shell, :path => "./init.sh",:privileged   => true
  end

  config.vm.define :mongo1 do | mongo |
    mongo.vm.hostname = "mongo1"
    mongo.vm.network :private_network, ip: "192.168.33.201"#, virtualbox__intnet: "intnet"
    mongo.vm.provision :shell, :path => "./init.sh",:privileged   => true
  end

  config.vm.define :mongo2 do | mongo |
    mongo.vm.hostname = "mongo2"
    mongo.vm.network :private_network, ip: "192.168.33.202"#, virtualbox__intnet: "intnet"
    mongo.vm.provision :shell, :path => "./init.sh",:privileged   => true
  end
end
