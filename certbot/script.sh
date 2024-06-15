#!/bin/bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
LETSENCRYPT_VOLUME_DIR=$DIR/letsencrypt

# Run Certbot
certbot certonly \
    --standalone \
    -d $DOMAIN \
    --email=$EMAIL \
    --agree-tos \
    --no-eff-email \
    --no-bootstrap \
    --non-interactive \
    --quiet

# Copy the certificate files to local folder and set permissions
cp --recursive --dereference $DIR/letsencrypt/live/$DOMAIN /etc/letsencrypt
chown -R $USER:$USER /etc/letsencrypt
