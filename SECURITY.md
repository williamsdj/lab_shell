# Security Recommendations
Once installed, users may want to consider reconfiguring their systems to enhance security.  The list below is for manually configuring security controls and documenting recommendations.

#### SSH: _/etc/ssh/sshd_config_

The following command will configure sshd_config to match the next example, with the exception of modifying LoginGraceTime.

```shell
LoginGraceTime 30s
ClientAliveInterval 15
ClientAliveCountMax 10

#Subsystem       sftp    /usr/libexec/openssh/sftp-server

Match User training
	ForceCommand /opt/lab_shell/bin/lab_shell
	X11Forwarding no
	AllowTcpForwarding no
	PermitTunnel no
	PermitOpen none
	MaxAuthTries 3
	MaxSessions 1
	AllowAgentForwarding no
	PermitEmptyPasswords no
```

#### Separate storage for containers

```
service docker stop
rm -rf /var/lib/docker/*
mkfs.ext2 /dev/sdb1
mount -o defaults,noatime,nodiratime /dev/sdb1 /var/lib/docker
tail -1 /etc/fstab
	/dev/sdb1	/var/lib/docker	    ext2     defaults,noatime,nodiratime,nobootwait 0 1
service docker start
```

#### Rate limiting

Use iptables for protection of the SSH service.
```
iptables -A INPUT -p tcp --dport 22 -m conntrack --ctstate NEW -m recent --name ssh --set
iptables -A INPUT -p tcp --dport 22 -m conntrack --ctstate NEW -m recent --name ssh --update --seconds 60 --hitcount 5 -j DROP
iptables -A INPUT -p tcp --dport 22 -m conntrack --ctstate NEW -j ACCEPT
```


