apt update && apt install apache2 -y
openssl req -newkey rsa:2048 -nodes -keyout /etc/ssl/server.key -x509 -days 365 -subj "/C=RU/ST=Ekaterinburg/L=Ekaterinburg/O=LLC/CN=site-apache.net" -out /etc/ssl/server.crt
cp /etc/ssl/server.crt /vagrant/
cp /vagrant/site-apache.net.conf /etc/apache2/sites-available/
cp /vagrant/apache.html /var/www/html/
a2enmod ssl
a2dissite 000-default.conf
a2ensite site-apache.net
systemctl reload apache2
