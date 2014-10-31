
# Goal

Test monolith backend deployment ready production on debian box

## Issues

On my machine fig install works on phusion_experiments

But on debian 7.7 created today fig build has a problem connnecting to mongo with ip address

This build process worked fine on debian 7.4 yesterday.

*Is this because a change in fig?*



## Vagrant and Docker

### Install

Vagrant :
```
https://www.vagrantup.com/downloads
```

Virtualbox:
```
https://www.virtualbox.org/wiki/Downloads
```


## Source code / project structure


* stackmates
    * boxes
    * stackmates
        * client
            * src
                * common
                * [app domain]
        * services
            * src
                * common
                * [app domain]



```
git clone https://github.com/stackmates/stackmates
cd stackmates/stackmates
```

Backend
```
git clone https://github.com/stackmates/common.services services
cd services/src
git clone https://github.com/stackmates/app_secret_sauce app_[your-domain]
```

Client
```
git clone https://github.com/stackmates/common.client.build client
cd services/src/domain
https://github.com/stackmates/stackmates.client.project [your-domain]
```



## Prepare machine

```
vagrant up
vagrant ssh
```


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

```
sudo apt-get install python-pip
sudo pip install -U fig
```


## Services

```
 cd /host/services/src/app_[your-domain]
```

or

#### Fetch source code (mock production)

```
sudo mkdir var/www
cd usr/share/
sudo git clone https://github.com/stackmates/common.services  services
cd services/src
sudo git clone https://[your-domain-source]
```


## Create image

```
sudo mv Dockerfile.sample Dockerfile
sudo vi Dockerfile
```

Edit Dockerfile replacing [app_your_secret_source] as appropriate

```
docker build -t [your-domain]/services .
```

make sure npm install works properly


## Edit fig.yml

### Set image name

image: [your-domain]/services


### Set environment variables

  environment:
    NODE_ENV: development
    PORT: 4000
    ES_URL: http://xxx.xx.x.xxx:9200
    MONGODB_URL: xxx.xx.x.xxx
    MONGODB_PORT: 27017

SET IP Address for mongo and Elasticsearch, make sure ip address matches host machines for mongo **This is where problem lies with mongo connection**


## Start the service

```
sudo fig up
```

Check that browser http://172.xx.x.xxx:4000/salestax  returns (your ip)

{"total":123}



# Client build

development;
```
cd /host/client/src/domain/stackmates/_deploy/[subdomain]
```

production
```
sudo mkdir var/www/
git clone [your domain client]
```

```
sudo build -t [domain]/[subdomain] .
sudo docker run -d -p 8000:80 --name website -v $PWD/www:/var/www/stackmates stackmates/sitehome
```


### For mac


```
vim /private/etc/hosts
```

Edit hosts with your ip

xxx.xx.x.xxx  localdev

## Browse to

```
http://localdev:8000
```


Want to get this working

http://jasonwilder.com/blog/2014/03/25/automated-nginx-reverse-proxy-for-docker/


# Steps to get running on Google Cloud

Should hopefully be the same as above *except for the mongo connection bit*



# Questions

* Should npm install be run in the Dockerfile?



