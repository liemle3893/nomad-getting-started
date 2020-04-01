# How to

```shell
$ ansible-playbook -i inventory/vagrant.ini site.yaml
```

# Test on Vagrant

1. Install Vagrant
2. Install VirtualBox
3. 

    $ vagrant ssh mgmt
    $ cd /vagrant
    $ ansible-playbook -i inventory/vagrant.ini site.yaml

    


# To add new node

```shell

# Example:
# export NODE_ADDRESS=38.19.93.22
$ ansible-playbook -i inventory/vagrant.init add-node.yaml -e new_nodes=${NODE_ADDRESS}
```