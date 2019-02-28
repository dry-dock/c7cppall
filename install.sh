#!/bin/bash

yum -y update
sudo yum install -y yum-utils
sudo yum install -y centos-release-scl
sudo yum-config-manager --enable rhel-server-rhscl-8-rpms
sudo rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-SIG-SCLo
sudo yum install -y devtoolset-8
export PATH="/opt/rh/devtoolset-8/root/usr/bin:$PATH"
echo 'export PATH="/opt/rh/devtoolset-8/root/usr/bin:$PATH"' >> /etc/drydock/.env
scl enable devtoolset-8 bash
gcc --version
g++ --version


#Add this 3rd party repo to install clang-6
echo "[leonmaxx-clang-6-epel]
name=Copr repo for clang-6-epel owned by leonmaxx
baseurl=https://copr-be.cloud.fedoraproject.org/results/leonmaxx/clang-6-epel/epel-7-x86_64/
type=rpm-md
skip_if_unavailable=True
gpgcheck=1
gpgkey=https://copr-be.cloud.fedoraproject.org/results/leonmaxx/clang-6-epel/pubkey.gpg
repo_gpgcheck=0
enabled=1
enabled_metadata=1" >> /etc/yum.repos.d/epel.repo

sudo rpm --import https://copr-be.cloud.fedoraproject.org/results/leonmaxx/clang-6-epel/pubkey.gpg
yum install clang -y

clang --version
