#!/bin/bash

echo "127.0.0.1       localhost
127.0.1.1       $(hostname)
::1     localhost ip6-localhost ip6-loopback
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters

## My custom filters
0.0.0.0 min-api.cryptocompare.com
0.0.0.0 www.alimama.com
0.0.0.0 na61-na62.wagbridge.advertisement.tanx.com
0.0.0.0 mobile.pipe.aria.microsoft.com
" > /etc/hosts

curl https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts | cat >> /etc/hosts 
