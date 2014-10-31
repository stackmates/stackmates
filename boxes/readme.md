## Issues

On my machine fig install works on phusion_experiments

But on debian 7.7 created today fig build has a problem connnecting to mongo with ip address

This build process worked fine on debian 7.4 yesterday.


## Goal

Test monolith backend deployment to production on debian box


## Prepare machine

```
sudo vi /etc/apt/sources.list
```

Add the following line

```
deb http://http.debian.net/debian wheezy-backports main
```

```
sudo apt-get update
sudo apt-get install -t wheezy-backports linux-image-amd64
```


### Install docker

get around permissions problem

```
sudo bash -c "curl -sSL https://get.docker.com/ | sh"
```



### Install fig


sudo apt-get install python-pip

sudo pip install -U fig

OR

sudo bash -c "curl -L https://github.com/docker/fig/releases/download/1.0.0/fig-`uname -s`-`uname -m` > /usr/local/bin/fig;"

chmod u+x /usr/local/bin/fig





# Services

## Fetch source code

```
sudo mkdir var/www
cd var/www/
sudo git clone https://github.com/stackmates/common.services  services
cd services/src
sudo git clone https://bitbucket.org/dreamineering/app_drmg
```

## Create image

```
sudo mv Dockerfile.sample Dockerfile
sudo vi Dockerfile
```

Edit Dockerfile replacing [app_your_secret_source] as appropriate


```
docker build -t drmg/nodeapp .
```

make sure npm install works properly


## Edit  fig.yml

image: drmg/nodeapp

SET IP Address for mongo and Elasticsearch, make sure ip address matches host machines for mongo (read about this)


## Start the service

```
sudo fig up
```

Check that browser http://172.12.8.162:4000/salestax  returns (your ip)

{"total":123}



# Client

http://jasonwilder.com/blog/2014/03/25/automated-nginx-reverse-proxy-for-docker/

```
sudo mkdir var/www/client
git clone https://github.com/stackmates/stackmates.client.project
```


sudo ln -s /etc/nginx/sites-available/example.conf /etc/nginx/sites-enabled/example.conf

sudo service nginx reload

sudo nginx -t && service nginx reload


sudo chown -R www-data:www-data /var/www/example.com/public_html

sudo rm /etc/nginx/sites-enabled/default

# Questions

* Should npm install be run in the Dockerfile?


# Steps for GCE



# Local Development

## Hosts

on mac

/private/etc/hosts


172.12.8.170  localdev


sudo docker run -d -p 8000:80 --name website -v $PWD/www:/var/www/stackmates stackmates/sitehome