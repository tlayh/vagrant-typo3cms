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
	command 'git clone --recursive git://git.typo3.org/TYPO3v4/Core.git /var/www/typo3.cms'
	creates '/var/www/typo3.cms'
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

# create symlink index.php
execute 'create symlink index.php' do
	command 'cd /var/www/typo3.cms/htdocs && ln -s ../index.php index.php'
	user 'vagrant'
	group 'www-data'
end

# create symlink t3lib
execute 'create symlink t3lib' do
	command 'cd /var/www/typo3.cms/htdocs && ln -s ../t3lib t3lib'
	user 'vagrant'
	group 'www-data'
end

# create symlink typo3
execute ' create symlink typo3 ' do
	command ' cd /var/www/typo3.cms/htdocs && ln -s ../typo3 typo3'
	user 'vagrant'
	group 'www-data'
end

# create database
execute 'create database' do
	command 'mysqladmin -uroot -proot -hlocalhost create typo3cms'
end

# copy prepared LocalConfiguration
# setup host
cookbook_file '/var/www/typo3.cms/htdocs/typo3conf/LocalConfiguration.php' do
	source "LocalConfiguration.php"
	mode 0755
	user 'vagrant'
	group 'www-data'
end

