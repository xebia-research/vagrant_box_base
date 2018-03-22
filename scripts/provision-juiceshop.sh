# This will also call apt-get update
echo "Provisioning npm 4 for juiceshop"
curl -sL https://deb.nodesource.com/setup_4.x | sudo bash -

echo "Provisioning juice-shop..."
cd workspace
git clone https://github.com/bkimminich/juice-shop.git
