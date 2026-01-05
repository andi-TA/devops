FROM debian:bookworm-slim

RUN	apt-get -y update && apt-get -y upgrade \
        && apt-get install -y nginx

COPY tools/default /etc/nginx/sites-available
COPY tools/default /etc/nginx/sites-enabled

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]