# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.

# The most common configuration options are documented and commented below.
# For a complete reference, please see the online documentation at
# https://docs.vagrantup.com.
   
# Every Vagrant development environment requires a box. You can search for
# boxes at https://vagrantcloud.com/search.
    
Vagrant.configure("2") do |config|

  #======================================================================================#
  # Image: select virtual machine image (may be architecture specific)
  #--------------------------------------------------------------------------------------#
  # Mac OSX (Intel):
  # config.vm.box = "ubuntu/eoan64"
  # 
  # Intel x86-64:
  # config.vm.box = "ubuntu/eoan64"
  #======================================================================================#
  config.vm.box = "ubuntu/eoan64"


  #======================================================================================#
  # Timeout: time to initialize machine (in secs, default = 300 = 5 mins)
  #--------------------------------------------------------------------------------------#
  # config.vm.boot_timeout = 300
  #======================================================================================#
  config.vm.boot_timeout = 600
  

  #======================================================================================#
  # Machine: Customizations for machine (memory, etc)
  #--------------------------------------------------------------------------------------#
  # vb.memory = "2048"
  #======================================================================================#
  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  #
  # View the documentation for the provider you are using for more
  # information on available options.
  #
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #

  config.vm.provider "virtualbox" do |vb|
     
     # Custom VM name "ubuntu-eoan-swapmyvote"
     vb.name = "ubuntu-eoan-swapmyvote"
     
     # Display the VirtualBox GUI when booting the machine
     vb.gui = true
  
     # Customize the amount of memory on the VM:
     vb.memory = "2048" 
  end

  

  #======================================================================================#
  # Sharing: vb guest additions are needed for shared folders (synched folders)
  #--------------------------------------------------------------------------------------#
  # config.vbguest.auto_update = true
  #======================================================================================#
  config.vbguest.auto_update = true
  
    
  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false



  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  #======================================================================================#
  # NAT forward port mappings 
  #--------------------------------------------------------------------------------------#
  # config.vm.network "forwarded_port", guest: 22, host: 2222
  #======================================================================================#
  #config.vm.network "forwarded_port", guest: 3000, host: 3333


  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"


  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  
  
  

  #======================================================================================#
  # DiskSize: root filesystem disk size (requires vagrant-disksize plugin)
  #--------------------------------------------------------------------------------------#
  # config.disksize.size = "20GB"
  #======================================================================================#
  config.disksize.size = "20GB"


  
  #======================================================================================#
  # Boostrap: configure disks, mountpoints
  #--------------------------------------------------------------------------------------#
  # ResizeFS: resize root filesystem partition
  #--------------------------------------------------------------------------------------#
  # resize2fs /dev/sda1
  #--------------------------------------------------------------------------------------#
  #  
  #--------------------------------------------------------------------------------------#
  # Directories: configure directories for mounting shared folders 
  #--------------------------------------------------------------------------------------#
  # config.vm.provision "shell", "mkdir -p /work/swapmyvote"
  #======================================================================================#
  config.vm.provision "shell", inline: <<-SHELL

    echo ""  
    echo "resizing root filesystem"
    resize2fs /dev/sda1


    echo ""  
    echo "creating shared folders"
    mkdir -p /vagrant
    mkdir -p /mnt/work
    
    
    echo ""  
    echo "registering package repositories"
    echo "deb http://uk.archive.ubuntu.com/ubuntu/ eoan main restricted universe multiverse"               > /etc/apt/sources.list
    echo "deb-src http://uk.archive.ubuntu.com/ubuntu/ eoan main restricted universe multiverse"           >> /etc/apt/sources.list
    echo "deb http://uk.archive.ubuntu.com/ubuntu/ eoan-security main restricted universe multiverse"      >> /etc/apt/sources.list
    echo "deb-src http://uk.archive.ubuntu.com/ubuntu/ eoan-security main restricted universe multiverse"  >> /etc/apt/sources.list
    echo "deb http://uk.archive.ubuntu.com/ubuntu/ eoan-updates main restricted universe multiverse"       >> /etc/apt/sources.list
    echo "deb-src http://uk.archive.ubuntu.com/ubuntu/ eoan-updates main restricted universe multiverse"   >> /etc/apt/sources.list
    apt-get update


    echo ""  
    echo "adding apt repository tools"
    apt-get -y install apt-transport-https ca-certificates
    apt-get -y install software-properties-common python-software-properties
    apt-get update


    echo ""
    echo "installing virtualbox extensions"
    apt-get -y upgrade
    sudo apt -y install build-essential dkms linux-headers-$(uname -r)

    apt-get -y install dkms
    #apt-get -y install virtualbox-guest
    apt-get -y install virtualbox-guest-dkms
    apt-get -y install virtualbox-guest-utils    
    apt-get -y install virtualbox-guest-additions-iso
       
  SHELL
 
 
 
  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder ".", "/mnt/vagrant"

    
  #======================================================================================#
  # Folders: configure mountpoints for synched folders 
  #--------------------------------------------------------------------------------------#
  # config.vm.synced_folder ".", "/mnt/vagrant"
  #======================================================================================#
  #config.vm.synced_folder ".", "/vagrant"
  config.vm.synced_folder "../../", "/mnt/work"


  
  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.  
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y nginx
  # SHELL

  #
  # @see https://help.ubuntu.com/community/VirtualBox
  # @see https://askubuntu.com/questions/142549/how-to-install-ubuntu-on-virtualbox
  #
  # @see https://wiki.ubuntulinux.org/wiki/Docker

  config.vm.provision "shell", inline: <<-SHELL
  
    echo ""
    echo "configuring basic system"
    cp /vagrant/motd                /etc
    # todo certificates and credentials
    # warning: do not overwrite the vagrant credentials (~/.ssh/authorized_keys)
    # if using an ssh-agent, ssh-keys should already be preloaded (ssh-add -L) 
            

    echo ""  
    echo "creating source directories"
    mkdir -p /mnt/work/swapmyvote  
        
    
    echo ""
    echo "updating core linux utils"
    apt-get -y install syslinux
    apt-get -y install coreutils
    apt-get -y install util-linux
    #apt-get -y install procps
    apt-get -y install iotop
        
    echo ""
    echo "updating ubuntu linux utils"
    apt-get -y install systemd.d
    #apt-get -y install systemd.d-sysv
    #apt-get -y install init-system-helpers
    #apt-get -y install init.d
    apt-get -y install rc
    #apt-get -y install apt
    #apt-get update

    
  
    echo ""
    echo "installing file archive utils"
    #apt-get -y install tar
    apt-get -y install zip
    apt-get -y install unzip
    #apt-get -y install gzip
    #apt-get -y install bzip2
    apt-get -y install sharutils
    #apt-get -y install zlib
    #apt-get -y install zlib-dev

    echo ""
    echo "installing basic network utils"
    #apt-get -y install ifupdown
    apt-get -y install net-tools
    apt-get -y install dnsutils    
    apt-get -y install curl
    apt-get -y install wget

    echo ""
    echo "installing secure network utils"
    apt-get -y install gnutls
    apt-get -y install openssh
    apt-get -y install openssl
    apt-get -y install openssl-dev
    apt-get -y install stunnel
    
    
    echo ""
    echo "installing console tools"
    apt-get -y install ncurses
    apt-get -y install nano
    apt-get -y install vim

    echo ""
    echo "installing common dev utils"
    apt-get -y install bc
    apt-get -y install dos2unix

    echo ""
    echo "installing source control tools"
    apt-get -y install diffutils
    apt-get -y install patchutils
    apt-get -y install git


    echo ""
    echo "installing GNU libc"
    apt-get -y install libc-bin
    apt-get -y install libc6
    apt-get -y install libc6-dev
    
    echo ""
    echo "installing basic C and C++ compiler"
    apt-get -y install gcc
    apt-get -y install g++
    apt-get -y install gdb    
    
    echo ""
    echo "installing basic compiler tools"
    apt-get -y install libtool
    apt-get -y install binutils
    apt-get -y install make
    apt-get -y install automake
    apt-get -y install autoconf
   
   
    echo ""
    echo "installing grammar parser tools"
    apt-get -y install guile
    apt-get -y install bison
    apt-get -y install flex
    apt-get -y install swig
    apt-get -y install ctags
    
    echo ""
    echo "installing common io protocols"
    apt-get -y installd cpio
    apt-get -y install protobuf-compiler
    
    
    echo ""
    echo "installing perl development tools"
    apt-get -y install perl
    apt-get -y install cpanminus
    
    
    echo ""
    echo "installing python development tools"
    apt-get -y install python
    apt-get -y install python-dev
    apt-get -y install python-pip
    # patch broken pip by using easy_install
    easy_install pip
    cp /usr/local/bin/pip /usr/bin
    pip install --upgrade pip
    

    echo ""
    echo "installing ruby development tools"
    
    # note: rbenv / rvm are not working! we're installing ruby-2.6.5 from source 
    
    #apt-add-repository -y ppa:rael-gc/rvm
    #apt-get update
    #apt-get -y install rvm rbenv
    
    apt-get -y remove rvm
    rm -f /etc/rvmrc
    rm -f ~/.rvmrv
    
    #export RUBY_CONFIGURE_OPTS="--with-openssl-dir=/usr/lib/ssl" 
    #rbenv install  2.6.5


    # start with the default ruby-2.5 and gems
    
    apt-add-repository ppa:brightbox/ruby-ng
    apt-get update
    
    apt-get -y install ruby ruby-dev
    apt-get -y install gems rubygems-integration
    apt-get -y install ruby-rails ruby-railties
    apt-get -y install ruby-builder ruby-bundler
    
    
    # now override and compile ruby-2.6.5 from source
    
    cd /tmp/
    wget -c https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.5.tar.gz
    tar -xzf ruby-2.6.5.tar.gz
    cd ruby-2.6.5
    ./configure --prefix=/usr --with-rubylibprefix=/usr/lib/ruby/2.6.5 --with-openssl-dir=/usr/lib/ssl
    make
    make install
    cd /usr/local/bin


    
    echo ""
    echo "Installing ruby rake and rails"
    gem install builder:3.2.3
    gem install bundler:1.17.3
    gem install rake rails

    
    
    
    echo ""
    echo "installing yarn ruby webserver"
    apt-get -y install yarnpkg
    gem remove trollop
    gem install optimist yarn
    
    
    
    
    echo ""
    echo "installing dependency libs"
    apt-get -y install libpgf-dev
    apt-get -y install libpq-dev
    
    
    echo ""
    echo "installing postgresql"
    apt-get -y install postgresql postgresql-client
    
    
    
   
    echo ""
    echo "installing oniguruma regexp lib"
    apt-get -y install libonig
    apt-get -y install libonig-dev    
    #cd
    
    echo ""
    echo "installing jq/yq json/yaml processors"
    # jq json processor
    apt-get -y install jq
    # yq yaml processor (wrapper for jq)
    pip install 'yq < 2.0.0'
    
       
    echo ""
    echo "installing nodejs engine"
    apt-get -y install nodejs
    apt-get -y install npm
    cd; touch install_nvm.sh; chmod a+x install_nvm.sh
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh > install_nvm.sh
    ./install+nvm.sh
    source ~/.profile

 
    echo ""
    echo "configuring docker repostories"
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    sudo apt-get update
       
    echo ""
    echo "installing docker engine"
    apt-get -y install docker.io
    apt-get -y install composer
    
        
    echo ""
    echo "Done."
    #reboot

  SHELL


end
