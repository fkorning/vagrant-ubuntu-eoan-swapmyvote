# replace -b 10.0.2.15 with the NAT ip of your virtualbox guest vm
# make sure you open-up the firewall ports and map NAT port forwards

# yarn is a dependency management tool for Javascript and nodejs
# the yarn used by webpacker is not the gem, it's https://yarnpkg.com/en/
# you must uninstall yarn gem, and install the js yarn instead
# https://yarnpkg.com/en/docs/install

#sudo apt-get -y remove rvm
#sudo rm ~/.rvmrc
#sudo rm /etc/rvmrc

# todo set git context to isolate from other work
#git config user.name yourname
#git config user.email youremail@domain.com

rm *.lock

bundle clean --force

bundle
bundle install
bundle install --without=production

bundle exec rake db:setup

bundle exec rails db:migrate

bundle exec rails webpacker:install

bundle exec rails server -b 10.0.2.15
