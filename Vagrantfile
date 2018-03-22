# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

$version = `git describe --abbrev=0 --tags`
if ENV['ENV'] =='other'
  $baseImage = "generic/ubuntu1604"
  $baseName = "SIRC builderbox "+$version
else
  $baseImage = "ubuntu/xenial64"
  $baseName = "SIRC virtualbox builderbox "+$version
end

config.vm.box = $baseImage
if ENV['ENV'] !='other'
  config.vm.synced_folder '.', '/vagrant', disabled: true
end

config.vm.provider :virtualbox do |v|
   v.gui = true
   v.memory = 4096
   v.cpus = 2
   v.name = $baseName
   v.customize ["modifyvm", :id, "--nictype1", "virtio"]
   v.customize ["modifyvm", :id, "--vram", "64"]
   v.customize ["modifyvm", :id, '--uartmode1', 'disconnected']

 end


 config.vm.synced_folder '.', '/vagrant', disabled: true

   config.vm.provision 'shell' do |s|
     s.path = 'scripts/00_init.sh'
     s.privileged = true
   end

   config.vm.provision 'shell' do |s|
     s.path = 'scripts/create_folders.sh'
     s.privileged = false
   end

   # ZSH
     config.vm.provision 'shell' do |s|
     s.path = 'scripts/provision-zsh.sh'
     s.privileged = true
   end

   config.vm.provision 'file' do |s|
      s.source = 'generics/zshrc.template'
      s.destination = '~/.zshrc'
    end

   # Lubuntu desktop
   config.vm.provision 'shell' do |s|
     s.path = 'scripts/provision-lubuntu.sh'
     s.privileged = true
   end

   # creating a post install link so you can actually run the screen driver update in virtualbox
   if ENV['ENV'] !='other'
     config.vm.provision 'shell' do |s|
       s.path = 'scripts/prepare-vboxguestextensions.sh'
       s.privileged = true
     end
   end

   # JDK
   config.vm.provision 'shell' do |s|
     s.path = 'scripts/provision-jdk.sh'
     s.privileged = true
   end

   # NodeJS
   config.vm.provision 'shell' do |s|
     s.path = 'scripts/provision-node.sh'
     s.privileged = true
   end

   # Docker
   config.vm.provision 'shell' do |s|
     s.path = 'scripts/provision-docker.sh'
     s.privileged = true
   end

   # Atom
   config.vm.provision 'shell' do |s|
     s.path = 'scripts/provision-atom.sh'
     s.privileged = true
   end

   # Chrome
   config.vm.provision 'shell' do |s|
     s.path = 'scripts/provision-chrome.sh'
     s.privileged = true
   end

  # provision MongoDB
  config.vm.provision 'shell' do |s|
    s.path = 'scripts/provision-mongodb.sh'
    s.privileged = false
  end

  # provision Nodegoat
  config.vm.provision 'shell' do |s|
    s.path = 'scripts/provision-nodegoat.sh'
    s.privileged = false
  end

  # provision Webgoat
  config.vm.provision 'shell' do |s|
    s.path = 'scripts/provision-webgoat.sh'
    s.privileged = false
  end



  # provision juiceshop
  config.vm.provision 'shell' do |s|
    s.path = 'scripts/provision-juiceshop.sh'
    s.privileged = false
  end

  # provision ZAP
  config.vm.provision 'shell' do |s|
    s.path = 'scripts/provision-zap.sh'
    s.privileged = true
  end


  # provision Nmap
  config.vm.provision 'shell' do |s|
    s.path = 'scripts/provision_nmap.sh'
    s.privileged = true
  end
#10

  # provision maven
  config.vm.provision 'shell' do |s|
    s.path = 'scripts/provision-mvn.sh'
    s.privileged = true
  end

  # trigger reload
  config.vm.provision :reload


  # provision containers
  config.vm.provision 'shell' do |s|
    s.path = 'scripts/provision-containers.sh'
    s.privileged = true
  end



end
