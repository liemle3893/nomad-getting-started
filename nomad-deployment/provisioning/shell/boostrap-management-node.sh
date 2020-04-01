#!/usr/bin/env bash

# install ansible (http://docs.ansible.com/intro_installation.html)
yum -y update 
yum install epel-release ansible python-pip -y
pip install netaddr

# copy examples into /home/vagrant (from inside the mgmt node)
chown -R vagrant:vagrant /home/vagrant

# configure hosts file for our internal network defined by Vagrantfile
cat >>/etc/hosts <<EOL
# vagrant environment nodes
38.19.93.10  mgmt
38.19.93.11  server1
38.19.93.12  server2
38.19.93.13  server3
38.19.93.21  agent1
38.19.93.22  agent2
38.19.93.23  agent3
EOL

# ln -sf /vagrant/provisioning/inventory.ini /etc/ansible/hosts
# Generate ssh key
# su - vagrant -c "ssh-keygen -f /home/vagrant/.ssh/id_rsa -t rsa -N ''"
# su - vagrant -c "ssh-keyscan agent1 agent2 agent3 server1 server2 server3 >> /home/vagrant/.ssh/known_hosts"
