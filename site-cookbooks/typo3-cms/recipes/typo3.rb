#
# Cookbook:: typo3-cms
# Recipe:: default.rb
#
# Copyright 2013, Thomas Layh
#
# Version 0.1
#
# install typo3 and introduction package

# git clone typo3 trunk

# git://git.typo3.org/TYPO3v4/Core.git

# clone the TYPO3 Core
execute 'clone typo3' do
	command 'git clone --recursive git://git.typo3.org/Packages/TYPO3.CMS.git /var/www/typo3.cms/typo3_src'
	creates '/var/www/typo3.cms/typo3_src'
end

# clone the Introduction package
execute 'clone introduction package' do
	command 'git clone git://git.typo3.org/TYPO3v4/Distributions/Introduction.git /var/www/typo3.cms/htdocs'
	creates '/var/www/typo3.cms/htdocs'
end

# fix permissions
execute 'fix permissions' do
	command 'cd /var/www && chmod gu+w typo3.cms -R && chown vagrant:www-data typo3.cms -R'
end

# create symlink typo3_src
execute 'create symlink typo3_src' do
	command '[ -e /var/www/typo3.cms/htdocs/typo3_src ] && unlink /var/www/typo3.cms/htdocs/typo3_src; cd /var/www/typo3.cms/htdocs && ln -s ../typo3_src typo3_src'
	user 'vagrant'
	group 'www-data'
end

# create symlink index.php
execute 'create symlink index.php' do
	command '[ -e /var/www/typo3.cms/htdocs/index.php ] && unlink /var/www/typo3.cms/htdocs/index.php; cd /var/www/typo3.cms/htdocs && ln -s typo3_src/index.php index.php'
	user 'vagrant'
	group 'www-data'
end

# create symlink typo3
execute ' create symlink typo3 ' do
	command '[ -e /var/www/typo3.cms/htdocs/typo3 ] && unlink /var/www/typo3.cms/htdocs/typo3; cd /var/www/typo3.cms/htdocs && ln -s typo3_src/typo3 typo3'
	user 'vagrant'
	group 'www-data'
end

# create database
#execute 'create database' do
#	command 'mysqladmin -uroot -proot -hlocalhost create typo3cms'
#end

# copy prepared LocalConfiguration
# setup host
#cookbook_file '/var/www/typo3.cms/htdocs/typo3conf/LocalConfiguration.php' do
#	source "LocalConfiguration.php"
#	mode 0755
#	user 'vagrant'
#	group 'www-data'
#end

include_recipe "typo3-cms::phpunit"
