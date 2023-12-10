echo "192.168.56.101  site-apache.net www.site-apache.net" >> /etc/hosts
cp /vagrant/server.crt /usr/local/share/ca-certificates/
update-ca-certificates -v
