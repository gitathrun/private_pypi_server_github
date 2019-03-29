# Private Pypi server in Docker #

## Author ##

Author: Teng Fu
Contact: teng.fu@teleware.com

Many thanks to [Josh VanderLinden](https://github.com/codekoala/docker-pypi), this repo is inprised by his work.

If you wish to have additional password support, please go to his GitHub repo.

## AIM ##

For the requirement of private Python package installation. Allows developers to use __pip install__ to install Python package from a secret pypi server.


## Usage ##

Use following cmd to startup pypi server in docker
```
sudo docker run -it -p <8889 host vm port>:8080 -v <absolute path of packages directory on vm>:/private_packages tftwdockerhub/private_pypi_server:latest
```

Copy your host vm's DNS link, open in a browser:
```
http:// <host vm DNS >:8889/
```

If you see the pypi server index, the pypi server is ready. Go to
```
http:// <host vm DNS >:8889/packages
```
To get detail download link for each package.

## Package installation at Client side ##

If you want to install the private package somewhere in the cloud (i.e. Google Colab), make sure you have two links ready:

- host link, which is the DNS address of the virtual machine, i.e.:
```
http:// <host vm DNS >

i.e.
http://xxxxxx.cloudapp.azure.com
```
- package link, which is the download link for the package:
```
http:// <host vm DNS >:8889/packages/< specific package file >

i.e.
http://xxxxxxx.cloudapp.azure.com:8889/packages/xxx_package_0.0.1-py3-none-any.whl 
```

Now, for __pip install__, the two links are used as follow:

```
pip install --trusted-host http:// <host vm DNS > \
http:// <host vm DNS >:8889/packages/< specific package file >

i.e.
pip install --trusted-host http://xxxxxxx.cloudapp.azure.com \
http://xxxxxxx.cloudapp.azure.com:8889/packages/xxx_package_0.0.1-py3-none-any.whl 
```