
# StackMates

For exploring how browserify + micro services + docker can create faster more scalable solutions

## Foundations

### Philsophy

Explore contradictions and have two competing yet opposite approaches. For example Angular HTML as DSL vs the other REACT type way. HAPI as the all in one versus micro

Realtime vs REST


### Taxonomy

Create standards that communicate schema and intent and aid navigation during development

* Frontend browerifable components
* Backend services


### Glue

* Git
* Browserify
* Transport
* Docker


### Concepts

* Build first
* Small modular code
* Micro-services
* BEM Inspired CSS


## Get Started


### Install

Vagrant :
```
https://www.vagrantup.com/downloads
```

Virtualbox:
```
https://www.virtualbox.org/wiki/Downloads


## Prepare box

Refer to specific box instructions [here](https://github.com/stackmates/stackmates/tree/master/boxes)


## Source code / project structure

Create structure above in production do this directly inside the box. In development if you follow this structure source code will be under /host directory.


For the client this stucture allows having one build system for multiple sites with the idea this can increase efficiencies in build tool mainetenance and discovering patterns to be extracted into smaller modules.

On server side this is more about hiding the value code from common domain knowledge. But folder structure in terms of intended MSA implementation is merely for helping to communicate schema and intent.

The goal is to analyse these structure and determine a taxonomy for naming service and modules that helps to communicate role and to find when not in this stucture.

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


Get docker
```


```

```
sudo apt-get update
sudo apt-get -y install nodejs npm
sudo ln -s /usr/bin/nodejs /usr/bin/node
sudo chown -R vagrant:vagrant /usr/local
sudo chown -R vagrant:vagrant /var/run/docker.sock
git config --global user.name "matt mischewski"
git config --global user.email matt@dreamineering.com
echo 'export DOCKER_HOST=tcp://127.0.0.1:4243' >> ~/.profile && . ~/.profile
```

### Ubuntu
```
curl -sSL https://get.docker.com/ | sh
sudo usermod -aG docker vagrant
```

### Install fig

```
sudo apt-get install python-pip
sudo pip install -U fig
```


## Services

```
 cd /stackmates/services/src/app_[your-domain]
```

### Create image

```
sudo mv Dockerfile.sample Dockerfile
sudo vi Dockerfile
```

Edit Dockerfile replacing [app_your_secret_source] as appropriate

```
docker build -t [your-domain]/backend .
```

make sure npm install works properly


### Edit fig.yml

Set image name

```
image: [your-domain]/backend
```

## Start the service

```
fig run web npm install && fig up
```

Check that browser http://172.xx.x.xxx:4000/salestax  returns (your ip)

{"total":123}

*All Good?*

```
  fig up -d
```

*Else*

Edit the fig.yml to replace supervisor with node app.js so you can see what the problem is

replace
```
  command: /usr/bin/supervisord
```

with
```
  command: node app.js
```



## Client


Build client apps

development;
```
cd /stackmates/client/src/domain/stackmates/_deploy/[subdomain]
```

production
```
sudo mkdir var/www/
git clone [your domain client]  REPLACE THIS WITH RSYNC
```


sudo build -t [domain]/[subdomain] .

```
sudo docker build -t stackmates/sitehome .
sudo docker run -d -p 8000:80 --name website -v $PWD/www:/var/www/stackmates stackmates/sitehome
```

### Edit hosts

If on a mac you can

```
vim /private/etc/hosts
```

Edit hosts with your ip

xxx.xx.x.xxx  localdev

*Otherwise*

Use http://nip.io/


## Browse to

```
http://localdev:8000
```

Should be golden


### Goals

Get this working

* [Automated nginx reverse proxy for docker](http://jasonwilder.com/blog/2014/03/25/automated-nginx-reverse-proxy-for-docker/)
* [Automagical deploys](http://nathanleclaire.com/blog/2014/08/17/automagical-deploys-from-docker-hub/)


# Google Compute Engine


# Questions

* Should npm install be run in the Dockerfile?
* Why is first docker upload fast but subsequent uploads in new location slow? How can it be proven that .dockerignore is working?


