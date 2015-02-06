# Vagrant Setup

- Install Vagrant from https://www.vagrantup.com/

- Install Virtual Box from https://www.virtualbox.org/

- Install Vagrant Plugins:

    # To cache on the host machine the packages used by the VMs
    vagrant plugin install vagrant-cachier 

    # To automatically install updated Virtual Box Additions on the VM 
    vagrant plugin install vagrant-vbguest

# Vagrant Usage

- Clone this git repo on the local host:

    git clone https://github.com/alvagante/training-ti

- Vagrant essential usage:

    cd training-ti
    vagrant status          # Show VM status
    vagrant up web01        # Start VM web01
    vagrant provision web01 # Run provisioning on VM web01
    vagrant halt web01      # Stop VM web01
    vagrant destroy web01   # Destroy VM web01

