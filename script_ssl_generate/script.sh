#!/bin/sh

openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout secrets/pub_ssl_key.key \
    -out secrets/priv_ssl_key.crt \
    -subj "/C=XX/ST=Analamanga/L=Antananarivo/O=Antananarivo/OU=Antananarivo/CN=atahiry-.42.fr" 1>/dev/null  2>/dev/null