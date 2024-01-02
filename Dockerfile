FROM ubuntu:latest
WORKDIR '/app'

RUN apt-get update --yes
RUN apt-get install apache2 --yes
RUN apt-get install -y openssh-server
COPY ./index.html /var/www/html/index.html

RUN echo '. /etc/apache2/envvars' > /app/entrypoint.sh && \
echo 'mkdir -p /var/run/apache2' >> /app/entrypoint.sh && \
echo 'mkdir -p /var/lock/apache2' >> /app/entrypoint.sh && \
echo '/usr/sbin/apache2 -D FOREGROUND' >> /app/entrypoint.sh && \
chmod 755 /app/entrypoint.sh

EXPOSE 80

cmd ["/bin/bash","/app/entrypoint.sh"]
