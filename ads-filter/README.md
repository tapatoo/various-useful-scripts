# Update hosts file with a list of hosts to fileter

1. Put the script into your $PATH, i.e. /usr/local/bin
2. Assign executable permissions
3. Create a cron job

```shell
sudo crontab -e
```

Crontab entries:
```
@reboot /usr/local/bin/hostupdate
0 20 * * * /usr/local/bin/hostsupdate
```