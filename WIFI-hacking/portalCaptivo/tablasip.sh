let interface=

echo 1 > /proc/sys/net/ipv4/ip_forward
iptables --flush
iptables --table nat --flush
iptables --delete-chain
iptables --table nat --delete-chain
iptables -P FORWARD ACCEPT

dnsmasq -C dnsmasq.conf
hostapd hostapd.conf -B
service apache2 start

ifconfig interface 10.0.0.1 netmask 255.255.255.0
