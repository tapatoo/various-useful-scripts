# Update hosts file with a list of hosts to fileter

1. Put the script into your $PATH, i.e. /usr/local/bin
2. Assign executable permissions
3. Create a cron job

```shell
sudo crontab -e
```

Crontab entries:
```
@reboot /usr/local/bin/hosts_update.sh
55 19 * * * curl https://raw.githubusercontent.com/tapatoo/various-useful-scripts/master/ads-filter/hosts_update.sh | cat > /usr/local/bin/hosts_update.sh
0 20 * * * /usr/local/bin/hosts_update.sh
```