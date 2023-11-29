#!/bin/bash
ssh -o "StrictHostKeyChecking no" -i /vagrant/.vagrant/machines/client/virtualbox/private_key -l vagrant 192.168.56.100
