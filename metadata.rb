maintainer       "Ryan J. Geyer"
maintainer_email "me@ryangeyer.com"
license          "All rights reserved"
description      "Installs/Configures phpenv"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"

# Only tested on OSX, but this could very likely work on any flavor of linux
%w{mac_os_x}.each do |os|
  supports os
end

%w{rightscale}.each do |dep|
  depends dep
end

recipe "phpenv::install", "Installs phpenv for the current user"