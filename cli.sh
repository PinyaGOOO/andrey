#!/bin/bash
dnf remove -y git
dnf install -y chrony
nmcli con modify ens18 ipv4.method manual ipv4.addresses 3.3.3.2/30
nmcli con modify ens18 ipv4.gateway 3.3.3.1

nmcli con modify Проводное\ подключение\ 1 ipv4.method manual ipv4.addresses 4.4.4.2/30
nmcli con modify Проводное\ подключение\ 1 ipv4.gateway 4.4.4.1


systemctl restart NetworkManager

useradd -c "Admin" Admin -U
echo "Admin:P@ssw0rd" | chpasswd

hostnamectl set-hostname CLI; exec bash





