#!/bin/sh









cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak

sed -Ei "s/^#PermitRootLogin prohibit-password$/#PermitRootLogin prohibit-password\nPermitRootLogin yes/gi" /etc/ssh/sshd_config

sed -Ei "s/^#PasswordAuthentication yes$/#PasswordAuthentication yes\nPasswordAuthentication yes/gi" /etc/ssh/sshd_config








cp /etc/pam.d/login /etc/pam.d/login.bak

sed -Ei "s/^auth [success=ok new_authtok_reqd=ok ignore=ignore user_unknown=bad default=die] pam_securetty.so$/#auth [success=ok new_authtok_reqd=ok ignore=ignore user_unknown=bad default=die] pam_securetty.so/gi" /etc/pam.d/login












#service ssh start
service ssh restart

#service ssh status






update-rc.d ssh enable















