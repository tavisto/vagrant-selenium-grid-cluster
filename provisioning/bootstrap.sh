#!/usr/bin/env bash

if [ ! -f /etc/puppet/hiera.yaml ]; then
    sudo rpm -ivh https://yum.puppetlabs.com/el/6/products/x86_64/puppetlabs-release-6-7.noarch.rpm
    yum update -y
    yum install -y puppet wget

    touch /etc/puppet/hiera.yaml
fi
