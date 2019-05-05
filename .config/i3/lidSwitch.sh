#!/bin/sh

exec sed "s/HandleLidSwitch=/#HandleLidSwitch=/g" /etc/systemd/logind.conf
exec systemctl restart systemd-logind
