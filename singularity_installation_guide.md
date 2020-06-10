# Singularity Installation Guide

This guide provides instructions on how to set up Singularity on **Linux (CentOS, Ubuntu)**, **Mac** and **Windows** machines. A Linux OS is required to run Singularity natively. Please refer to the section relevant to your machine type.

*Note*: The Singularity version on Lawrencium is 3.2.1. For compatibility, you should install the same version of Singularity on your local Linux system.

## Linux 
**CentOS / Red Hat Enterprise Linux**

- Install the dependencies:
```
$ sudo yum update -y && sudo yum groupinstall -y 'Development Tools' && sudo yum install -y openssl-devel libuuid-devel libseccomp-devel wget squashfs-tools cryptsetup
```

- Install Go (the latest version is 1.14.3):
```
$ export VERSION=1.14.3 OS=linux ARCH=amd64 && wget https://dl.google.com/go/go$VERSION.$OS-$ARCH.tar.gz && sudo tar -C /usr/local -xzvf go$VERSION.$OS-$ARCH.tar.gz && rm go$VERSION.$OS-$ARCH.tar.gz```
$ export PATH=/usr/local/go/bin:${PATH}
```

- Download Singularity v3.2.1 source code:
```
$ export VERSION=3.2.1 && wget https://github.com/hpcng/singularity/releases/download/v${VERSION}/singularity-${VERSION}.tar.gz && tar -xzf singularity-${VERSION}.tar.gz && cd singularity
```

- Build and install Singularity: 
```
$ ./mconfig && make -C builddir && sudo make -C builddir install
```

**Ubuntu / Debian**

-Install the dependencies:
```
$ sudo apt-get update && sudo apt-get install -y build-essential uuid-dev libgpgme-dev squashfs-tools libseccomp-dev wget pkg-config git cryptsetup-bin
```

- Install Go (the latest version is 1.14.3):
```
$ export VERSION=1.14.3 OS=linux ARCH=amd64 && wget https://dl.google.com/go/go$VERSION.$OS-$ARCH.tar.gz && sudo tar -C /usr/local -xzvf go$VERSION.$OS-$ARCH.tar.gz && rm go$VERSION.$OS-$ARCH.tar.gz
$ export PATH=/usr/local/go/bin:${PATH}
```

- Download Singularity v3.2.1 source code:
```
$ export VERSION=3.2.1 &&  wget https://github.com/hpcng/singularity/releases/download/v${VERSION}/singularity-${VERSION}.tar.gz && tar -xzf singularity-${VERSION}.tar.gz && cd singularity
```

- Build and install Singularity:
```
$ ./mconfig && make -C builddir && sudo make -C builddir install
```

## Mac
On Mac, you’ll need to spin up a Linux VM in order to run Singularity. The easiest approach is to use VirtualBox and Vagrant. You can download [VirtualBox](https://www.virtualbox.org/) and [Vagrant](https://www.vagrantup.com/) from their respective websites, but using [Homebrew](https://brew.sh/) is relatively easy. 

- Install homebrew:
```
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

- Install VirtualBox via Homebrew:
```
$ brew cask install virtualbox
```

- Install Vagrant:
```
$ brew cask install vagrant
```

- Spin up a ubuntu/xenial64 VM from the [ubuntu/xenial64 vagrant box](https://app.vagrantup.com/ubuntu/boxes/xenial64):
```
$ mkdir vm-singularity && cd vm-singularity
$ vagrant init ubuntu/xenial64 && vagrant up
```

- Login to the VM and check OS:
```
$ vagrant ssh
$ vagrant@vagrant:~$ cat /etc/os-release
NAME=”Ubuntu” 
$ vagrant@vagrant:~$ cd /vagrant/; pwd
/vagrant 
```
 
*Tip*: Your current working directory  ~/vm-singularity on your Mac is mounted at /vagrant in the VM, aka files created at /vagrant inside the VM is accessible to ~/vm-singularity on your Mac.

- Install dependencies within vagrant:
```
$ sudo apt-get update && sudo apt-get install -y build-essential uuid-dev libssl-dev squashfs-tools libseccomp-dev wget pkg-config git cryptsetup-bin 
```

- Install go and singularity:
Follow the instructions above for Ubuntu/Debian

## Windows
On Windows machines, you’ll need to spin up a Linux VM to run Singularity. There are a number of hypervisors available on Windows, including VirtualBox and [Hyper-V](https://en.wikipedia.org/wiki/Hyper-V) or [Subsystem for Linux 2](https://en.wikipedia.org/wiki/Windows_Subsystem_for_Linux).  So pick your favorite hypervisor on Windows. Once you spin up a Linux VM on Windows, you can follow the previous instructions to install Singularity in the VM. 

## Reference
[Installing Singularity](https://sylabs.io/guides/3.2/user-guide/installation.html)

