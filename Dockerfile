FROM  alpine:latest

RUN apk update && apk upgrade && apk add nginx
RUN mkdir /run/nginx
VOLUME ["/sys/fs/cgroup"]
COPY nginx.conf /etc/nginx/nginx.conf

RUN echo -e "<!DOCTYPE html>                 \n\
<html lang=\"en\">                           \n\
<head>                                       \n\
    <meta charset=\"utf-8\" />               \n\
    <title>HTML5</title>                     \n\
</head>                                      \n\
<body>                                       \n\
    hello!                                  \n\
</body>                                      \n\
</html>" > var/www/index.html

EXPOSE 80
ENTRYPOINT nginx -g 'daemon off;'