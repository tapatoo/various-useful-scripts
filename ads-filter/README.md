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
3. Create cron jobs to run the script regularly on sa chedule.

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

4. Create a service to run at startup:
```shell
sudo touch /etc/systemd/system/hosts-update.service

echo "
[Unit]
Description=Update hosts file to prevent traffice to hosts known to serve ads, tracking scripts and malware.
# After=network.target
# After=systemd-user-sessions.service
# After=network-online.target

[Service]
# User=root
# Type=simple
# PIDFile=/run/hosts-update.pid
ExecStart=/usr/local/bin/hosts_update.sh start
# ExecReload=/usr/local/bin/hosts_update.sh reload
# ExecStop=/usr/local/bin/hosts_update.sh stop
# TimeoutSec=30
# Restart=on-failure
# RestartSec=30
# StartLimitInterval=350
# StartLimitBurst=10

[Install]
WantedBy=multi-user.target
" | sudo tee -a /etc/systemd/system/hosts-update.service

systemctl enable hosts-update.service
systemctl start hosts-update.service
```

More information on systemd unit file structure can be found in this [Digital Ocean post](https://www.digitalocean.com/community/tutorials/understanding-systemd-units-and-unit-files).