# Setup Docker CE on Ubuntu 16.04 Xenial X86\_64

* If there is any old docker package installed

``` bash
sudo apt-get remove docker docker-engine docker.io
```

* Setup repository

``` bash
sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
# Add GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# Verify GPG key
sudo apt-key fingerprint 0EBFCD88
# Add repository
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
```

* Install Docker CE

``` bash
sudo apt-get update
sudo apt-get install docker-ce
```

* Enable docker.service

``` bash
sudo systemctl enable docker
```

* Use a non-root user to manage Docker

``` bash
# Docker will create group `docker` automatically on Ubuntu
sudo usermod -a -G docker <username>
# Re-login and use <username> to manage Docker
```

* Registry Mirror

Add the following configuration to `/etc/docker/daemon.json`.
Create this file if it doesn't exists.

``` json
{
  "registry-mirror": ["https://<your_aliyun_id>.mirror.aliyuncs.com"]
}
```

The restart docker daemon:

``` bash
sudo systemctl restart docker
```

