echo "1. Dari Github"
echo "2. Tidak Dari Github"
read -p "mau pilih yang mana ?: " OPSI
if opsi == 1
read -p "masukan domain: " DOMAIN
read -p "masukan link github: " LINK
then
git clone $LINK /var/www/$DOMAIN/html
echo $DOMAIN
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

        server_name $DOMAIN www.$DOMAIN;
        location / {
        root /var/www/$DOMAIN/html;
        index index.html index.htm;

        }
}
" > $DOMAIN
ln -s /etc/nginx/sites-available/$DOMAIN /etc/nginx/sites-enabled
systemctl restart nginx
if opsi == 2
read -p "masukan domain: " DOMAIN
then
echo $DOMAIN
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
echo "server {
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
else
echo "pilihan tidak valid"
fi
