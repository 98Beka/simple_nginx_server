docker build -t server .
docker run --rm -p 80:80 -it server
