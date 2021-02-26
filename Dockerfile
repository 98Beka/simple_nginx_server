FROM  alpine:latest

RUN apk update && apk upgrade
RUN apk add nginx openrc

#nginx
RUN rm /etc/nginx/http.d/default.conf
COPY srcs/nginx.conf /etc/nginx/http.d/default.conf

COPY ./srcs/start.sh ./start.sh
RUN chmod +x start.sh

EXPOSE 80

CMD /start.sh