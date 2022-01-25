read -p "Masukan Domain: " DOMAIN
echo $DOMAIN
mkdir -p /var/www/$DOMAIN/html
chown -R $USER:$USER /var/www/$DOMAIN/html
cd /var/www/$DOMAIN/html
echo "<html>
    <head>
        <title>Welcome to $DOMAIN</title>
    </head>
    <body>
        <h1>Success! The $DOMAIN server block is working!</h1>
    </body>
</html>" > index.html

cd /etc/nginx/sites-available/
echo "
server {
        listen 80;
        listen [::]:80;

        root /var/www/$DOMAIN/html;
        index index.html index.htm index.nginx-debian.html;

        server_name $DOMAIN;

        location / {
                try_files $uri $uri/ =404;
        }
}
" > $DOMAIN

ln -s /etc/nginx/sites-available/$DOMAIN /etc/nginx/sites-enabled/

cd /etc
echo "35.223.241.186 $DOMAIN" >> hosts
systemctl restart nginx
