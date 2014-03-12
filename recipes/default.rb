# Install Ruby via rvm
# Include here so that we can set Ruby version in this recipe
include_recipe "rvm::system"

# Install required packages
%w{curl}.each do |pkg|
  package pkg do
    action :install
  end
end
gem_package "bundler" do
  action :install
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