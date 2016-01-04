#!/usr/bin/env bash

# Check if this has been run already and exit if it has
if [ -f "/var/vagrant_repos" ]; then
  exit 0
fi

# Configure DNS
cat > /etc/resolv.conf <<EOL
search hobsons.local emt.hobsons.local naviance.com
nameserver 10.56.152.166
nameserver 10.56.152.8
options timeout:1 rotate
EOL

# Clean and setup yum repos
rm -rf /etc/yum.repos.d/*

cat > /etc/yum.repos.d/hobsons_base.repo <<EOL
[hobsons_base]
baseurl=http://iad1pupatch01.emt.hobsons.local/repos/centos/x86_64/6/base-latest
gpgcheck=true
enabled=true
gpgkey=http://iad1pupatch01.emt.hobsons.local/repos/centos/x86_64/6/RPM-GPG-KEY-CentOS-6
priority=99
name=Hobsons CentOS Base
EOL

cat > /etc/yum.repos.d/hobsons_updates.repo <<EOL
[hobsons_updates]
baseurl=http://iad1pupatch01.emt.hobsons.local/repos/centos/x86_64/6/updates-latest
gpgcheck=true
enabled=true
gpgkey=http://iad1pupatch01.emt.hobsons.local/repos/centos/x86_64/6/RPM-GPG-KEY-CentOS-6
priority=99
name=Hobsons Updates
EOL

cat > /etc/yum.repos.d/hobsons_epel.repo <<EOL
[hobsons_epel]
gpgkey=http://iad1pupatch01.emt.hobsons.local/repos/epel/RPM-GPG-KEY-EPEL-6
name=Hobsons EPEL
baseurl=http://iad1pupatch01.emt.hobsons.local/repos/epel/x86_64/6/epel-latest
gpgcheck=true
enabled=true
priority=99
EOL

cat > /etc/yum.repos.d/hobsons_puppet.repo <<EOL
[hobsons_puppet]
gpgkey=http://iad1pupatch01.emt.hobsons.local/repos/puppet/RPM-GPG-KEY-puppetlabs
name=Hobsons Puppet
baseurl=http://iad1pupatch01.emt.hobsons.local/repos/puppet/x86_64/6/puppetlabs-products-latest
gpgcheck=true
enabled=true
priority=99
EOL

cat > /etc/yum.repos.d/hobsons_puppet_deps.repo <<EOL
[hobsons_puppet_deps]
gpgkey=http://iad1pupatch01.emt.hobsons.local/repos/puppet/RPM-GPG-KEY-puppetlabs
name=Hobsons Puppet Deps
baseurl=http://iad1pupatch01.emt.hobsons.local/repos/puppet/x86_64/6/puppetlabs-deps-latest
gpgcheck=true
enabled=true
priority=99
EOL

touch /var/vagrant_repos
