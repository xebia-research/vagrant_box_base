echo "Provisioning NodeGoat..."

#config.vm.provider "virtualbox" do |v|
    #v.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/vagrant", "1"]
#end

cd workspace
git clone https://github.com/nbaars/NodeGoat.git
cd NodeGoat

sudo add-apt-repository ppa:chris-lea/node.js


npm install

npm install chromedriver

npm run db:seed

cd test
cd security
mv profile-test.js profile-test.js.bak
