
## Deploy to google cloud




```
gcloud auth login
```


set project id
```
gcloud config set project <project id>
```



create instance
```
gcloud compute instances create <instance-name> --machine-type f1-micro --image debian-7 --zone us-central1-a
```

```
 gcloud compute instances create docker-playground \
  --image container-vm-v20140925 \
  --image-project google-containers \
  --zone us-central1-a \
  --machine-type f1-micro
```

[ref: creating instances](https://cloud.google.com/sdk/gcloud/reference/compute/instances/create)


Get the external IP address of the instance
```
gcloud compute instances list
```

or use instance describe
```
gcloud compute instances describe <instance-name> --zone us-central1-a
```


### Firewall rules

Return list of rules > look for

allow-http              default 0.0.0.0/0     tcp:80
```
gcloud compute firewall-rules list
```


If none
```
gcloud compute firewall-rules create allow-http \
         --description "Incoming http allowed." --allow tcp:80
```



Whenever you create a firewall rule, you can restrict the sources and targets to specific callers and instances using appropriate flags. To see a complete list of supported flags, display help for the create command:

**Do this for ssh**

```
gcloud compute firewall-rules create --help
```

[ref: creating firewall rules](https://cloud.google.com/sdk/gcloud/reference/compute/firewall-rules/create)
[ref: networking](https://cloud.google.com/compute/docs/networking)



## Log in to the instance

```
gcloud compute ssh <instance-name> --zone us-central1-a
```

exit with exit

[ref: connecting](https://cloud.google.com/compute/docs/gcloud-compute/#connecting)


## Deleting an instance
```
gcloud compute instances delete <instance-name>
```


## Machine Setup

need

* docker
* fig
* nginx


### Install

### Core requirements
```
sudo apt-get update
sudo apt-get install nginx
```


### Fig

```
sudo apt-get install -y python-pip
sudo pip install -U fig
```


### Source


```
sudo mkdir /stackmates && cd /stackmates
```

Backend
```
sudo git clone https://github.com/stackmates/common.services services
cd services/src
git clone https://github.com/stackmates/app_secret_sauce app_[your-domain]
```


Configure Dockerfile and Fig.yml
```
sudo mv Dockerfile.sample Dockerfile
sudo mv fig.sample.yml fig.yml
```

Set your app name
```
sudo vi Dockerfile
```

Set name of your build image
Set NODE_ENV production
```
sudo vi fig.yml
```

## Build image

```
sudo docker build -t <domain>/services .
```

## Fig up

check the service
```
sudo fig run api npm install && sudo fig up
```

*All Good?*

```
  fig kill
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

**TODO** Figure out where to access logs


## Reference material

* [From docker site](https://docs.docker.com/installation/google/)
* [Quickstart](https://cloud.google.com/compute/docs/quickstart#create_an_instance)
* [Containers in production with fig]( http://blog.docker.com/2014/08/orchestrating-docker-containers-in-production-using-fig/)

