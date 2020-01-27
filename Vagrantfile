# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/trusty64"
  config.vm.provision "shell", inline: <<-SHELL
    
    cd /tmp

    PACKERVERSION=1.5.1
    PACKERDOWNLOAD=https://releases.hashicorp.com/packer/${PACKERVERSION}/packer_${PACKERVERSION}_linux_amd64.zip
    TERRAFORMVERSION=0.12.19
    TERRAFORMDOWNLOAD=https://releases.hashicorp.com/terraform/${TERRAFORMVERSION}/terraform_${TERRAFORMVERSION}_linux_amd64.zip
    VAULTVERSION=1.3.2
    VAULTDOWNLOAD=https://releases.hashicorp.com/vault/${VAULTVERSION}/vault_${VAULTVERSION}_linux_amd64.zip
    echo "Dependencies..."
    sudo apt-get install -y unzip tree

    # Azure CLI
    echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ wheezy main" | sudo tee /etc/apt/sources.list.d/azure-cli.list
    sudo apt-key adv --keyserver packages.microsoft.com --recv-keys 417A0893
    sudo apt-get install apt-transport-https
    sudo apt-get update && sudo apt-get install azure-cli

    # Disable the firewall
    sudo ufw disable

    ## Packer
    echo Fetching Packer...
    curl -L $PACKERDOWNLOAD > packer.zip
    echo Installing Packer...
    unzip packer.zip -d /usr/local/bin
    chmod 0755 /usr/local/bin/packer
    chown root:root /usr/local/bin/packer

    ## Terraform
    echo Fetching Terraform...
    curl -L $TERRAFORMDOWNLOAD > terraform.zip
    echo Installing Terraform...
    unzip terraform.zip -d /usr/local/bin
    chmod 0755 /usr/local/bin/terraform
    chown root:root /usr/local/bin/terraform

    ## Vault
    echo Fetching Vault...
    curl -L $VAULTDOWNLOAD > vault.zip
    echo Installing Vault...
    unzip vault.zip -d /usr/local/bin
    chmod 0755 /usr/local/bin/vault
    chown root:root /usr/local/bin/vault


    ## Docker
    echo deb https://apt.dockerproject.org/repo ubuntu-`lsb_release -c | awk '{print $2}'` main | sudo tee /etc/apt/sources.list.d/docker.list
    sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
    sudo apt-get update
    sudo apt-get install -y docker-engine

  SHELL

  config.vm.synced_folder "shared/", "/home/vagrant/shared", owner: "vagrant", group: "vagrant"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
    vb.cpus = 2
  end

end
