## Kebutuhan
- Nginx 
- Git
- Bash
- wget
##  Cara Pengunaan  
### Cara Satu
1. install aplikasi-aplikasi yang dibutuhkan terlebih dahulu dengan memasukan perintah 
``` 
sudo apt install nginx 
sudo apt install git 
```  
2. salin link dari github repository yang akan di deploy 
3. jalankan script yang akan digunakan `sudo bash ./script.sh`  
### Cara Dua
1. install aplikasi-aplikasi yang dibutuhkan terlebih dahulu dengan memasukan perintah 
``` 
sudo apt install nginx 
sudo apt install git 
sudo apt install wget
```  
2. jalankan
```
wget https://raw.githubusercontent.com/Feisal2202/auto-nginx-deploy/main/script.sh && sudo bash ./script.sh
```
pada terminal
## Auto Clone dari Github 
Mengkonfigurasikan nginx dedngan menggunakan repository html static yang diinputkan oleh user 
## Tanpa menggunakan github
Mengkonfigurasikan nginx pada server block dengan html sederhana 
## Kesimpulan
Jadi auto clone deploy ini bisa memudahkan kita dalam konfigurasi
