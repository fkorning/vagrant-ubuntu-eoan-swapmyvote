# steps for a clean local build with bundle and rails on vagrant vm
# replace -b 10.0.2.15 with the NAT ip of your virtualbox guest vm
# make sure you open-up the firewall ports and map NAT port forwards

rm *.lock

bundle clean --force

bundle
bundle install
bundle install --without=production

bundle exec rake db:setup

bundle exec rails db:migrate

bundle exec rails webpacker:install

bundle exec rails server -b 10.0.2.15
