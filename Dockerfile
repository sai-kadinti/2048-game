FROM ubuntu:24.04
RUN apt-get update
RUN apt-get install -y nginx curl zip
RUN echo "daemon off;" >>/etc/nginx/nginx.conf
RUN curl -o /var/www/html/master.zip -L https://github.com/sai-kadinti/2048-game/archive/refs/heads/master.zip
RUN cd /var/www/html/ && unzip master.zip && mv 2048-game-master/* . && rm -rf 2048-master master.zip

EXPOSE 80
CMD ["/usr/sbin/nginx", "-c" ,"/etc/nginx/nginx.conf"]
