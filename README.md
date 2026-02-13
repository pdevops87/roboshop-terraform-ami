# roboshop-terraform-ami


syslog vs rsyslog:
=================
All systemd-managed services have their service logs in journald by default (stdout/stderr and errors).
Some application-specific logs may still go to separate log files unless configured to log to stdout/stderr.


systemd service logs are available in journald by default
rsyslog can read from journald and store logs in files or forward them
Together, they allow both real-time querying (journald) and long-term storage / centralization (rsyslog)


* find . "*rsyslog*"
* find . -name "*rsyslog*"
* cat ./d61/ansible/roles/common/templates/rsyslog.conf
* cat ./d61/ansible/roles/common/tasks/filebeat.yml
* cat ./d61/ansible/roles/common/tasks/main.yml
* cat /etc/rsyslog.d/23-cloud-init.conf
* 

