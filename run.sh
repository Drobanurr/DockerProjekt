DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
LETSENCRYPT_VOLUME_DIR=$DIR/letsencrypt
DOMAIN="dockerprojekt.de"
EMAIL="kraftmoritz@dv-schulen.de"

sudo docker run \
  --rm \
  --name certbot \
  -p 80:80 \
  -p 443:443 \
  -v "$LETSENCRYPT_VOLUME_DIR:/etc/letsencrypt" \
  certbot/certbot \
  certonly \
  -d $DOMAIN \
  --standalone \
  --email=$EMAIL \
  --agree-tos \
  --no-eff-email

# Copy the certificate files  to local folder and set permissionss
sudo cp --recursive --dereference $DIR/letsencrypt/live/$DOMAIN .
sudo chown $USER:$USER --recursive $DOMAIN
