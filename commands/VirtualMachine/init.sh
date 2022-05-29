#!/bin/sh

sudo apt-get -y update && sudo apt-get -y install nginx python3-venv

sudo unlink /etc/nginx/sites-enabled/default

echo "server {
    listen 80;
    location / {
        proxy_pass https://localhost:5555;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection keep-alive;
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
}" > /etc/nginx/sites-available/reverse-proxy.conf

sudo ln -s /etc/nginx/sites-available/reverse-proxy.conf /etc/nginx/sites-enabled/reverse-proxy.conf

#restart nginx so the changes take effect
# sudo service nginx stop
sudo service nginx restart

# cd
cd app

python3 -m venv venv

source venv/bin/activate

pip install --upgrade pip 
pip install -r requirements.txt

python application.py