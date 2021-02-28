FROM  alpine:latest

RUN apk update && apk upgrade && apk add nginx openrc;

#nginx
RUN mkdir /run/nginx; 
RUN rm /etc/nginx/http.d/default.conf;
RUN echo -e "server {       \n\
    listen      80;         \n\
    listen      [::]:80;    \n\
    server_name localhost;  \n\
}" > /etc/nginx/http.d/default.conf;
RUN openrc; touch /run/openrc/softlevel;
EXPOSE 80
ENTRYPOINT   rc-service nginx start; sh;