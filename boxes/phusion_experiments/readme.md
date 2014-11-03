
## Ubuntu 14:04

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

### Install node

curl -sL https://deb.nodesource.com/setup | sudo bash -
sudo apt-get install -y nodejs


### Install docker

```
curl -sSL https://get.docker.com/ | sh
sudo usermod -aG docker vagrant
```

### Install fig

```
sudo apt-get install -y python-pip
sudo pip install -U fig
```

### References

[configure linux for development](https://www.codementor.io/linux-tutorial/configure-linux-toolset-zsh-tmux-vim)



## Todo

* [check out dockerize](http://jasonwilder.com/blog/2014/10/13/a-simple-way-to-dockerize-applications/)