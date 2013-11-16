TYPO3 CMS Vagrant Box
==============================

Copyright 2013, Thomas Layh <thomas@layh.com>

Description:
--------------

Will install TYPO3 CMS with the current master of 6.x.

After installation you have to run the 1-2-3 Install tool and then you are ready to go.


Installation:
--------------

*Tested with Vagrant 1.3.5 and VirtualBox 4.3.2*

1. Download the Vagrant installer from:
    http://downloads.vagrantup.com/

2. Install required cookbooks
::
    vagrant plugin install vagrant-vbguest
    vagrant plugin install vagrant-librarian-chef

3. Add to your host file
::
    192.168.23.6 typo3.cms

4. Run "vagrant up"

5. Call the page http://typo3.cms and complete the setup using the 1-2-3 Install Tool
-> Username and Passwort for the database: root / root

6. Shutdown with "vagrant suspend" and restart with "vagrant resume"
