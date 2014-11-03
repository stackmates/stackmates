
# 3scale box

```
vagrant up
vagrant ssh
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


## Setup nscale


### Github

```
ssh-keygen -t rsa -C "matt@dreamineering.com"
cat ~/.ssh/id_rsa.pub
```

Add SSH key to Github

Test it works:

```
ssh -T git@github.com
```

## Install nscale

```
npm install -g nscale
```


### Run nscale server

SSH into the vagrant box and run the following to start the kernel server

```
nsd server start
```

### Login

By default, login uses the email defined in ~/.gitconfig and that is all that is required.

```
nsd login
```

### Clone nfd demo

```
nsd system clone git@github.com:nearform/nscaledemo.git
```


### Build web container
```
nsd container build nscaledemo web
```

### Deploy nfd demo

Replace <revision_id> with the latest revision shown by the revision list command.

```
nsd revision list nscaledemo
nsd revision deploy nscaledemo <revision_id>
```


Test nfd demo is up and running
```
curl http://127.0.0.1:8000
```


