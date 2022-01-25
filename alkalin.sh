read -p "masukan domain: " DOMAIN
read -p "masukan link github: " LINK
git clone $LINK /var/www/$DOMAIN/html
echo $DOMAIN
chown -R $USER:$USER /var/www/$DOMAIN/html
cd /etc/nginx/sites-available/
echo "
server {
        listen 80;
        listen [::]:80;
        root /var/www/$DOMAIN/html;

        server_name $DOMAIN www.$DOMAIN;
        location / {
        root /var/www/$DOMAIN/html;
        index index.html index.htm;

        }
}
" > $DOMAIN

ln -s /etc/nginx/sites-available/$DOMAIN /etc/nginx/sites-enabled
systemctl restart nginx


