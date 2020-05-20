# Update hosts file with a list of hosts to filter

This script will download lists of hosts that are known to be serving ads, tracking scripts and malware. It will modify hosts file to prevent any communication with the malicious hosts.

## Install
1. Put the script into your $PATH, i.e. /usr/local/bin
   ```shell
   curl https://raw.githubusercontent.com/tapatoo/various-useful-scripts/master/ads-filter/hosts_update.sh | sudo cat > /usr/local/bin/hosts_update.sh
   ```
2. Assign executable permissions
   ```shell
   chmod a+x /usr/local/bin/hosts_update.sh
   ```
3. Create cron jobs to run the script at reboot, introduce self updating and execute regularly on sa chedule.

## Cron
```shell
sudo crontab -e
```

Crontab entries:
```
@reboot /usr/local/bin/hosts_update.sh
55 19 * * * curl https://raw.githubusercontent.com/tapatoo/various-useful-scripts/master/ads-filter/hosts_update.sh | cat > /usr/local/bin/hosts_update.sh
0 20 * * * /usr/local/bin/hosts_update.sh
```