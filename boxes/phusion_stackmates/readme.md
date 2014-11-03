
```
sudo apt-get update
sudo apt-get install -y \
    git \
    libxml2-dev \
    python \
    build-essential \
    make \
    gcc \
    python-dev \
    locales \
    python-pip \
    supervisor
```


### Install docker

```
curl -sSL https://get.docker.com/ | sh
sudo usermod -aG docker vagrant
```

exit and re-login to reload shell


### Install fig

```
sudo apt-get install -y python-pip
sudo pip install -U fig
```