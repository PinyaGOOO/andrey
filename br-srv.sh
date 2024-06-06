#!/bin/bash
dnf remove -y git
dnf install -y chrony
nmcli con modify ens18 ipv4.method manual ipv4.addresses 192.168.100.10/29
nmcli con modify ens18 ipv4.gateway 192.168.100.1


useradd -c "Branch admin" Branch_admin -U
echo "Branch_admin:P@ssw0rd" | chpasswd
useradd -c "Network Admin" Network_admin -U
echo "Network_admin:P@ssw0rd" | chpasswd

hostnamectl set-hostname BR-SRV; exec bash






