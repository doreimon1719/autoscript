#
#!/bin/bash
#Script generate akaun
#Script by syahz86
#
export DEBIAN_FRONTEND=noninteractive
OS=`uname -m`;
MYIP=$(wget -qO- ipv4.icanhazip.com);
MYIP2="s/xxxxxxxxx/$MYIP/g";
cd
clear
echo "==================================================================="
echo -e "      GENERATE AKAUN PELANGGAN | MENU SCRIPT BY syahz86      "
echo "==================================================================="
echo -e ""
read -p "Berapa jumlah akaun yang akan dibuat: " JUMLAH
read -p "Berapa hari akaun aktif: " AKTIF
today="$(date +"%Y-%m-%d")"
expire=$(date -d "$AKTIF days" +"%Y-%m-%d")
echo ""
echo "-------------------------------------------------------------------"
echo "Data Login:"
echo "-------------------------------------------------------------------"
echo "Host/IP: $MYIP"
echo "Dropbear Port: 443, 110, 109"
echo "OpenSSH Port: 22, 143"
echo "Squid Proxy: 80, 8080, 3128"
echo "OpenVPN Config: http://$MYIP:81/client.ovpn"
for (( i=1; i <= $JUMLAH; i++ ))
do
	username=`cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 15 | head -n 1`;
	useradd -M -N -s /bin/false -e $expire $username
	#password=`cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 15 | head -n 1`;
	echo $username:$username | chpasswd
	
	echo "$i. Username/Password: $username"
done

echo "Aktif sehingga: $(date -d "$AKTIF days" +"%d-%m-%Y")"
echo -e ""
echo "==================================================================="
echo -e "              SCRIPT BY syahz86 | GollumVPN              "
echo "==================================================================="
echo -e ""
