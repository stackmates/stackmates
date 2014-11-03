apt-get update
apt-get install -q -y --force-yes curl ;
#sudo apt-get install nodejs npm
#sudo ln -s /usr/bin/nodejs /usr/bin/node
#sudo chown -R vagrant:vagrant /usr/local
#sudo chown -R vagrant:vagrant /var/run/docker.sock

curl -L https://github.com/orchardup/fig/releases/download/0.4.2/linux > /usr/local/bin/fig ;
chmod +x /usr/local/bin/fig

#echo 'export DOCKER_HOST=tcp://127.0.0.1:4243' >> ~/.profile && . ~/.profile