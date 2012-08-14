#
# Cookbook Name:: phpenv
# Recipe:: install
#
#  Copyright 2012 Ryan J. Geyer
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#  http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

rightscale_marker :begin

tempdir = ::File.join(Chef::Config['file_cache_path'], 'phpenv')
unless ::File.directory?(::File.join(ENV['HOME'], '.phpenv'))
  git tempdir do
    repository node['phpenv']['git_uri']
    revision 'master'
    action :checkout
  end

  bash "Run the phpenv installer" do
    cwd tempdir
    code <<-EOF
  bin/phpenv-install.sh
  UPDATE=yes bin/phpenv-install.sh
    EOF
  end
else
  log "phpenv is already installed at #{::File.join(ENV['HOME'], '.phpenv')} skipping installation..."
end

rightscale_marker :end