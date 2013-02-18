#include_recipe "composer"

execute 'download composer' do
	command 'curl -s https://getcomposer.org/installer | php'
	cwd '/home/vagrant/'
end

cookbook_file '/home/vagrant/composer.json' do
	source "phpunit.json"
end

execute 'install phpunit' do
	command 'php composer.phar install'
	cwd '/home/vagrant/'
end