# Add ppa with newer Ruby version
apt_repository "brightbox-ruby-ng" do
  action       :add
  uri          "http://ppa.launchpad.net/brightbox/ruby-ng/ubuntu"
  distribution "precise"
  components   ["main"]
  keyserver    "keyserver.ubuntu.com"
  key          "C3173AA6"
end

# Install Ruby and other required packages
%w{ruby2.1 ruby2.1-dev ruby-switch curl}.each do |pkg|
  package pkg do
    action :install
  end
end

# Make Ruby 2.1 the default Ruby
script "ruby-switch" do
  interpreter "bash"
  code "sudo ruby-switch --set ruby2.1"
end

# Install bundler
gem_package "bundler" do
  gem_binary "/usr/bin/gem"
end

# Install required gems via bundler
# store them in vendor/bundle
script "bundle" do
  interpreter "bash"
  cwd "/vagrant"
  code "bundle install --path vendor/bundle"
end

# Package required gems in vendor folder
script "bundle" do
  interpreter "bash"
  cwd "/vagrant"
  code "bundle package --all"
end