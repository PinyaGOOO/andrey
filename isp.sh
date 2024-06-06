#!/bin/bash
dnf remove -y git
dnf install -y iperf3
nmcli con modify Проводное\ подключение\ 1 ipv4.method manual ipv4.addresses 1.1.1.1/30

nmcli con modify Проводное\ подключение\ 2 ipv4.method manual ipv4.addresses 3.3.3.1/30

nmcli con modify Проводное\ подключение\ 3 ipv4.method manual ipv4.addresses 2.2.2.1/30

echo -e "net.ipv4.ip_forward=1" >> /etc/sysctl.conf
sysctl -p
dnf install -y nftables
echo -e 'table inet my_nat {\n\tchain my_masquerade {\n\ttype nat hook postrouting priority srcnat;\n\toifname "ens18" masquerade\n\t}\n}' > /etc/nftables/isp.nft
echo 'include "/etc/nftables/isp.nft"' >> /etc/sysconfig/nftables.conf
systemctl enable --now nftables

hostnamectl set-hostname ISP; exec bash
