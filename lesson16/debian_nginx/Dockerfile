FROM debian:11
WORKDIR /
RUN apt update && apt install nginx -y
RUN mkdir -p /opt/www
COPY index.html /opt/www/
COPY site_nginx.net /etc/nginx/sites-available/nginx.conf
COPY site_nginx.net /etc/nginx/sites-enabled/nginx.conf
EXPOSE 8081
ENTRYPOINT ["nginx","-g","daemon off;"]