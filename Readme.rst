TYPO3Flow Vagrant Box
==============================

Copyright 2013, Thomas Layh <thomas@layh.com>

Description:
--------------

Will install a TYPO3Flow Welcome package including all required setups for the server environment.


Installation:
--------------

1. Setup Ruby and RubyGems on your system.

2. Install Vagrant and Librarian
	gem install vagrant
	gem install librarian

3. Install required cookbooks
	librarian-chef install

4. Add to your host file
	192.168.23.3 typo3.cms

5. Run "vagrant up"

6. Call the page http://typo3.cms and complete the setup using the 1-2-3 Install Tool
-> Username and Passwort for the database: root / root

7. Shutdown with "vagrant suspend" and restart with "vagrant resume"
