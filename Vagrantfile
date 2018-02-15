Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"

  config.vm.provider "virtualbox" do |vb|
    vb.gui = true
    # Customize the amount of memory on the VM:
    vb.memory = "4096"
    vb.cpus = 2
    vb.linked_clone = true
  end

  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"

  #starting up
  config.vm.provision 'shell' do |s|
      s.path = 'scripts/00_init.sh'
      s.privileged = true
    end

  #get you a desktop 
  config.vm.provision 'shell' do |s|
    s.path = 'scripts/ubuntu_desktop.sh'
    s.privileged = true
  end
end
