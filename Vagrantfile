# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/trusty64"

  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
  end

  config.vm.network "forwarded_port", guest: 80, host: 8080

  # no salt pre-reqs?
  # config.vm.provision "shell", inline: <<-SHELL
  #   sudo apt-get update
  #   sudo apt-get install -y apache2
  # SHELL

  # Workaround https://github.com/mitchellh/vagrant/issues/5973
  # config.vm.provision :shell, path: "salt/salt-install.sh", privileged: false
  config.vm.provision "shell", inline: <<-SHELL
    # master formulas, pillars and states
    apt-get install -y git
    [ -d /srv ] ||  mkdir /srv
    cd /srv
    [ -d formulas ] || mkdir /srv/formulas
    cd /srv/formulas
    [ -d apache-formula ] || git clone https://github.com/cgreenhalgh/apache-formula.git
    [ -d mysql-formula ] || git clone https://github.com/cgreenhalgh/mysql-formula.git
    [ -d docker-formula ] || git clone https://github.com/cgreenhalgh/docker-formula.git
    [ -d php-formula ] || git clone https://github.com/cgreenhalgh/php-formula.git
    [ -d wordpress-selfservice ] || git clone https://github.com/cgreenhalgh/wordpress-selfservice.git
    # see http://docs.saltstack.com/en/latest/topics/installation/ubuntu.html
    add-apt-repository ppa:saltstack/salt
    apt-get update

    # master
    #apt-get install -y salt-master
    #cp /srv/wordpress-selfservice/saltstack/etc/master.conf /etc/salt/master
    
    #service salt-master restart

    apt-get install -y salt-minion
    
    # This will set the salt ID, which will determine what gets installed!! - here 'dockertest' :-)
    cp /vagrant/saltstack/etc/minion-local-dev.conf /etc/salt/minion


    # install key
    #(cd /tmp; salt-key --gen-keys=dev)
    #cp /tmp/dev.pub /etc/salt/pki/minion/minion.pub
    #cp /tmp/dev.pem /etc/salt/pki/minion/minion.pem
    # to master
    #cp /tmp/dev.pub /etc/salt/pki/master/minions/dev

    service salt-minion restart
    salt-call state.highstate

  SHELL

  #config.vm.provision :salt do |salt|
  #  salt.install_master = false
  #  salt.no_minion = false
  #  salt.install_type = "stable"
  #  # https://github.com/mitchellh/vagrant/issues/5973
  #  salt.minion_config = "salt/minion-local.conf"
  #  salt.run_highstate = true
  #end

end
