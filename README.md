# Wordpress-PostSelector

Plugin for wordpress which gives a web-based graphical interface for
filtering posts in a category, specifically a drag-and-drop interface
for publishing/hiding posts.

Chris Greenhalgh, The University of Nottingham

Copyright (c) 2014,2015 The University of Nottingham

## What's here?

- `plugins/postselector/` - the plugin itself
- `Vagrantfile` and `saltstack` - vagrant configuration for a development machine image
- `test-setup.sh` - script to setup testing pre-requisites (assumes the test DB already exists, as created with salt from Vagrantfile, above)
- `test-plugins.sh` - script to run tests on plugin (lots of style errors at present)
- `tests/` and `phpunit.xml` - PHP unit tests (none yet)
- `docs/` - a bit of documentation
- `fix-plugins.sh` - script to fix simple style errors
- `zip-plugins.sh` - script to zip plugins to upload to other wordpress instances

## Getting started

- install [virtual box](https://www.virtualbox.org/wiki/Downloads)
- install [vagrant](https://www.vagrantup.com/downloads.html)
- download [source](https://github.com/cgreenhalgh/wp-postselector/archive/master.zip) and unzip (or install git, on windows  `git config --global core.autocrlf false` and then `git clone https://github.com/cgreenhalgh/wp-postselector.git`)

- `cd wp-postselector`
- `vagrant up` - sets up new ubuntu virtual machine (VM) and starts it (takes a few minutes)
- `vagrant ssh` - log into virtual machine 

- `cd /vagrant` - where these files are visible within the VM
- `./test-setup.sh` - install wordpress for development
- `./install-plugins.sh` - install the latest version of the plugin into wordpress

- on desktop browser visit [http://127.0.0.1:8080/wordpress-dev](http://127.0.0.1:8080/wordpress-dev), the wordpress development site
- Login with username `admin`, password `admin`
- add a new Category - see `Posts` > `Categories`, enter `Name` and `Add New Category`
- add a couple of posts and assign them to your category. You can leave them as draft status or published
- now see the [user guide](https://github.com/cgreenhalgh/wp-postselector/blob/master/docs/userguide.md)


