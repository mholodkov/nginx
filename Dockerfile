
FROM debian:latest
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install apt-utils
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y mc htop tcpdump ssh nginx nano

RUN echo "daemon off;" >> /etc/nginx/nginx.conf

COPY index.html /var/www/html
RUN mkdir /var/www/hello
COPY page.html /var/www/hello
COPY default /etc/nginx/sites-available

RUN mkdir /var/www/buy
COPY cska.html /var/www/buy
COPY cska.jpg /var/www/buy

EXPOSE 80

CMD [ "/usr/sbin/nginx" ]
