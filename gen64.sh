#Random generator ipv6 addresses within your ipv6 network prefix.
#!/usr/local/bin/bash

# Copyright
# Vladislav V. Prodan
# universite@ukr.net
# 2011


array=( 1 2 3 4 5 6 7 8 9 0 a b c d e f )
MAXCOUNT=500
count=1
network=2a07:14c0:0:2451 # your ipv6 network prefix

rnd_ip_block ()
{
    a=${array[$RANDOM%16]}${array[$RANDOM%16]}${array[$RANDOM%16]}${array[$RANDOM%16]}
    b=${array[$RANDOM%16]}${array[$RANDOM%16]}${array[$RANDOM%16]}${array[$RANDOM%16]}
    c=${array[$RANDOM%16]}${array[$RANDOM%16]}${array[$RANDOM%16]}${array[$RANDOM%16]}
    d=${array[$RANDOM%16]}${array[$RANDOM%16]}${array[$RANDOM%16]}${array[$RANDOM%16]}
    echo $network:$a:$b:$c:$d
    echo /sbin/ip -6 addr add $network:$a:$b:$c:$d/64 dev ens321 >> /root/ip.list2.sh
	echo /sbin/ip -6 addr del $network:$a:$b:$c:$d/64 dev ens321 >> /root/ip.list3.sh
}

#echo "$MAXCOUNT СЃР»СѓС‡Р°Р№РЅС‹С… IPv6:"
#echo "-----------------"
while [ "$count" -le $MAXCOUNT ]        # Р“РµРЅРµСЂР°С†РёСЏ 20 ($MAXCOUNT) СЃР»СѓС‡Р°Р№РЅС‹С… С‡РёСЃРµР».
do
        rnd_ip_block
        let "count += 1"                # РќР°СЂР°СЃС‚РёС‚СЊ СЃС‡РµС‚С‡РёРє.
        done
#echo "-----------------"
