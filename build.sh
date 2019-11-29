# steps to build on vagrant vm

rm *.lock


bundle clean --force

bundle
bundle install
bundle install --without=production

bundle exec rails webpacker:install

bundle exec rake db:setup

bundle exec rails server -b 10.0.2.15
