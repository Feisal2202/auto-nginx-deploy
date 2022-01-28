# Auto Nginx Deploy

Auto deploy di nginx adalah untuk menginstall dan mengkonfigurasi secara otomatis 
# 1. Auto Clone dari Github
Jadi dari script yang kita run itu tinggal memasukan domain dan link github

## Contoh script untuk proyek auto clone github

    read -p "masukan domain: " DOMAIN
    read -p "masukan link github: " LINK
    git clone $LINK /var/www/$DOMAIN/
    echo $DOMAIN
    chown -R $USER:$USER /var/www/$DOMAIN/
    cd /etc/nginx/sites-available/
    echo "
    server {
            listen 80;
            listen [::]:80;
            root /var/www/$DOMAIN/;  
            server_name $DOMAIN www.$DOMAIN;
            location / {
                root /var/www/$DOMAIN/;
                index index.html index.htm;
        }
    }
    " > $DOMAIN
    ln -s /etc/nginx/sites-available/$DOMAIN /etc/nginx/sites-enabled
    systemctl restart nginx

# 2. Tanpa menggunakan github
Jadi yang tanpa menggunakan github tidak perlu memasukan link kita hanya perlu memasukan domain yang akan di auto konnfigurasi.

## Contoh script tanpa github
    read -p "masukan domain: " DOMAIN
    echo $DOMAIN
    mkdir -p /var/www/$DOMAIN/
    chown -R $USER:$USER /var/www/$DOMAIN/
    cd /var/www/$DOMAIN/
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
        
        root /var/www/$DOMAIN/;
        server_name $DOMAIN www.$DOMAIN;
        
        location / {
            root /var/www/$DOMAIN/;
            index index.html index.htm;
        }
    }
    " > $DOMAIN

    ln -s /etc/nginx/sites-available/$DOMAIN /etc/nginx/sites-enabled
    systemctl restart nginx
# Kesimpulan
Jadi auto clone deploy ini bisa memudahkan kita dalam konfigurasi 

