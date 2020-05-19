#!/bin/bash

echo "127.0.0.1       localhost
127.0.1.1       $(hostname)
::1     localhost ip6-localhost ip6-loopback
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters

## My custom filters
0.0.0.0 min-api.cryptocompare.com
0.0.0.0 mobile.pipe.aria.microsoft.com
0.0.0.0 www.alimama.com
0.0.0.0 na61-na62.wagbridge.advertisement.tanx.com
## My custom filters end
" > /etc/hosts

curl https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts | cat >> /etc/hosts

## Define an array of urls from different sources to download filter lists
declare -a URLS=(
https://mirror1.malwaredomains.com/files/justdomains
https://s3.amazonaws.com/lists.disconnect.me/simple_tracking.txt
https://s3.amazonaws.com/lists.disconnect.me/simple_ad.txt
)

## Iterate and add to hosts file
for i in $URLS; do
  while read line; do
    if [[ "$line" =~ \#.* || -z "$line" ]]; then
      echo $line >> /etc/hosts
    else 
      echo "0.0.0.0 $line" >> /etc/hosts
    fi
  done < <(curl $i)
done
