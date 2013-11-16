#
# Cookbook:: typo3-cms
# Recipe:: default.rb
#
# Copyright 2013, Thomas Layh
#
# Version 0.1
#
# prepare everything to install typo3


include_recipe 'apache2'
['rewrite', 'deflate', 'php5', 'headers', 'expires', 'status', 'negotiation', 'setenvif'].each do |mod|
	include_recipe "apache2::mod_#{mod}"
end

include_recipe "php::package"
['apc', 'curl', 'gd', 'mysql', 'sqlite3'].each do |mod|
	include_recipe "php::module_#{mod}"
end

include_recipe "typo3-cms::basic"
include_recipe "mysql::server"
include_recipe "git"

# setup host
cookbook_file "/etc/apache2/sites-available/typo3.cms" do
	source "typo3.cms"
	mode 0755
end

# prepare php.ini config
cookbook_file "/etc/php5/conf.d/php_dateTimeZone.ini" do
	source "php_dateTimeZone.ini"
	mode 0655
end

# enable host and disable default host
#apache_site "default" do
#	enable false
#end
apache_site "typo3.cms" do
	enable true
end

# reload apache
execute "reload apache" do
	command "/etc/init.d/apache2 reload"
end

include_recipe "typo3-cms::typo3"

# install composer and TYPO3 Flow
#include_recipe "composer"
#typo3_flow "/var/www/typo3.cms" do
#    command_line_user "vagrant"
#    web_user "vagrant"
#    stability "dev"
#    action :install
#end
