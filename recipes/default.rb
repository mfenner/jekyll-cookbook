# Install required packages
%w{ruby1.9.3 curl}.each do |pkg|
  package pkg do
    action :install
  end
end
gem_package "bundler" do
  gem_binary "/usr/bin/gem"
end

# Install required gems via bundler
script "bundle" do
  interpreter "bash"
  cwd "/vagrant"
  code "bundle install"
end