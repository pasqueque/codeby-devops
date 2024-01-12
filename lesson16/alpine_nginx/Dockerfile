FROM alpine:latest

RUN apk update && apk add nginx
RUN mkdir -p /opt/www
COPY index.html /opt/www/
COPY site_nginx.net /etc/nginx/http.d/nginx.conf
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]