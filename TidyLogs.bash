#!/bin/bash
sudo logrotate -f /etc/logrotate.conf
sudo rm -f /var/log/*.gz /var/log/*.old /var/log/sysslog.1
