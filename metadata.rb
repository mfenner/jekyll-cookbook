name              "jekyll"
maintainer        "Martin Fenner"
maintainer_email  "mfenner@plos.org"
license           "MIT"
description       "Install Jekyll"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "0.1.0"
depends           "apt"
depends           "build-essential"
depends           "git"
depends           "rvm"

%w{ ubuntu }.each do |platform|
  supports platform
end
