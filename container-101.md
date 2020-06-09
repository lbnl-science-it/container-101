% Container 101 on Lawrencium
% June 10, 2020
% Wei Feinstein

# Outline
- Lawrencium Supercluster overview 
- Computing resources & services  
- Container technology overview
- Build singularity containers
- Run singularity containers on Lawrencium

# Lawrencium Cluster Overview
<center><img src="figures/lrc.png" width="80%"></center>

# Lawrencium Condo Cluster
- Lawrencium is a LBNL Condo Computer clusterresources
    - LBNL investmeent
    - Individual PIs purchase nodes and storage
    - Computational cycles are shared among all lawrencium users
- Cluster infrastructure: 
    - OTP authentication
    - High speed infiniBand parallel file system for fast inter-node communication
    - OS and security updates, software module farm, job scheduler SLURM
    - Home/project storage, lustre parallel file system and backend network infrastructure.

# Accounts on Lawrencium
## Three types of Project Accounts
- PI Computing Allowance (PCA) account: free 300K SUs per year (pc_xxx)
- Condo account: 
    - PIs purchase and contribute compute nodes to the general condo pool (lr_xxx)
    - Jobs are free of charge and have highest priority 
- Recharge account: with minimal recharge rate ~ $0.01/SU (ac_xxx)

- $25 per user per month 

https://sites.google.com/a/lbl.gov/hpc/getting-an-account

## User accounts
- User account request
- User agreement consent 

https://sites.google.com/a/lbl.gov/hpc/getting-an-account


# Softwre Module Farm 
<center><img src="figures/SMF.png" width="60%"></center>

# Module commands
- *module purge*: clear user’s work environment
- *module avail*: check available software packages
- *module load xxx*: load a package
- *module list*: check currently loaded software 
- Users may install their own software

https://sites.google.com/a/lbl.gov/high-performance-computing-services-group/getting-started/sl6-module-farm-guide

# SLURM: 
## Jub Submission
- sbatch: submit a job to the batch queue system
```
sbatch myjob.sh
```
- srun: request an interactive node(s) and login automatically
```
srun -A ac_xxx -p lr5 -q lr_normal -t 1:0:0 --pty bash
```
- salloc : request an interactive node(s)
```
salloc –A pc_xxx –p lr6 –q lr_debug –t 0:30:0
```
## Job Monitoring
- sinfo: check status of partitions and nodes (idle, allocated, drain, down) 
 ```
 sinfo –r –p lr6
 ```
- squeue: check jobs in the batch queuing system (R or PD)
```
squeue –u $USER
```
- sacct: check job information or history
```
sacct -X -o ‘jobid,user,partition,nodelist,stat’
```
- scancel : cancel a job
```
scancel jobID
```
https://sites.google.com/a/lbl.gov/high-performance-computing-services-group/scheduler/slurm-usage-instructions

# Services (1)
- Designate Data Transfer node **lrc-xfer.lbl.gov**
    - scp -r /your/source/file  $USER@lrc-xder.lbl.gov:/cluster/path
    - rsync -avzh /your/source/file $USER @lrc-xfer.lbl.gov:/cluster/path
- Globus Online provide secured unified interface for data transfer
    - endpoint lbn#lrc, Globus Connect, AWS S3 connect
- Visualization and remote desktop
    - Detailed information [click here](https://sites.google.com/a/lbl.gov/high-performance-computing-services-group/getting-started/remote-desktop)

# Service (2): Jupyterhub

https://lrc-jupyter.lbl.gov

<center><img src="figures/jupyter.png" width="80%"></center>

# Services (3): Cloud Computing
- LBNL has a master payer program for cloud services on Amazon Web Services (AWS) and Google Cloud Platform (GCP).  
* No charge to have an account in the program
* Charges only for actual usage of cloud services like storage or compute
* Monthly billing for cloud usage are direct to your PID via recharge mechanism
* Simple enrollment process.
* De-enrollment only changes the billing setup in your account, and your account will continue to be active.
* Complete control of your own AWS or GCP dashboard, your data, tools, and services.

# Servicesv (4): Cloud Computing
- AWS and GCP make discounts available to LBNL users.

| Type | AWS | GCP |  |
| --- | --- | --- | --- |
| Overall | 7% | 13% | |
| Data Egress | 15% | 25% | 

- AWS, [restrictions apply](https://aws.amazon.com/blogs/publicsector/aws-offers-data-egress-discount-to-researchers/) |
- Over 125 people at LBNL with cloud accounts on AWS and GCP.  
- Mostly use virtual machines and storage
- Use containerization, machine learning, AI, and data visualization services on both platforms
- To set up a cloud account on either AWS or GCP, send email to [scienceit@lbl.gov](mailto:scienceit@lbl.gov)

# Containerization
- Technology of putting an application and all of its dependencies into a single package.
- Portable, shareable, and reproducible.
- Your application brings its environment with it.

# Containerization Examples
- Package an analysis pipeline so that it runs on your laptop, in the cloud, and in a high performance computing (HPC) environment to produce the same result.
- Publish a paper and include a link to a container with all of the data and software that you used so that others can easily reproduce your results.
- Install and run an application that requires a complicated stack of dependencies with a few keystrokes.
- Create a pipeline or complex workflow where each individual program is meant to run on a different operating system.

# Container vs. Virtual Machine
<center><img src="figures/vm-sif.png" width="70%"></center>

# VM services 
<center><img src="figures/vm.png" width="50%"></center>
[More information about VM](https://commons.lbl.gov/display/itfaq/SVM+-+Virtual+Machine+Hosting)

# Singularity Technology
- Open-source computer software that encapsulates an application and all its dependencies into a single image
- Bring containers and reproducibility to scientific computing and HPC
- Developed by Greg Kurtzer
- Singularity assumes that you will have a build system where you are the root user, but that you will also have a production system where you may or may not be the root user.

# Singularity Workflow
- Install Singularity on a local machine
- Build Singularity images/containers on the local machine
- Transfer images/containers to LRC clusters
- Run images /containers on the cluster
    - Root privilege is not permitted 
    
# Install Singularity
Three OS platforms: 
    - Linux
    - Mac
    - Window
Installation [instructions](https://github.com/lbnl-science-it/container-101/blob/master/singularity_installation_guide.md)
```
$ singularity --version 
$ singularity run docker://godlovedc/lolcow
```

# Create Singularity Containers
- Directly from existing containers 
    - [Docker hub](https://hub.docker.com/search?q=&type=image) 
    - [Sylabs Cloud](https://cloud.sylabs.io/library) and [Singularity hub](https://singularity-hub.org/) 
    - [Nvidia HPC containers](https://www.nvidia.com/en-us/gpu-cloud/containers/)
    - [Biocontainers](https://biocontainers.pro/#/registry)
    - [AWS](https://aws.amazon.com/releasenotes/available-deep-learning-containers-images/)
- Build from definition files or recipes 

# Singularity pull
- No root/sudo privilege is needed
- Create immutable squashfs containers
```
singularity pull --help
```
- Docker Hub:  Pull a container from Docker Hub.
```
singularity pull docker://ubuntu:18.04 
singularity pull docker://gcc:7.2.0
```
- Singularity Hub:  If no tag is specified, the master branch of the repository is used
```
singularity pull shub://singularityhub/hello-world
```

# Singularity shell, run, exec
- **shell** sub-command: invokes an interactive shell within a container
```
singularity shell hello-world_latest.sif
```
- **run** sub-command: executes the container’s runscript
```
singularity run hello-world_latest.sif 
```
- **exec** sub-command: execute an arbitrary command within container 
```
singularity exec hello-world_latest.sif cat /etc/os-release
```
# Singularity build
- Root/sudo privilege is needed
```
singularity build --help
```
- Build from a definition file
```
sudo singularity --debug build mycontainer.sif Singularity 
```

# Defination File/Recipe
```
Bootstrap: docker
From: ubuntu
# used singularity run-help 
%help
Hello. I'm in the container.
# executed on host after the base OS is installed.
%setup
    touch ${SINGULARITY_ROOTFS}/tacos.txt
    echo “I love avocado” >> avocados.txt

# copy files from your host system into the container 
%files
    avocados.txt /opt    

%environment
  export NAME=avocado

# executed within the container after the base OS is installed at build time
#install new software and libraries, config files,  directories, etc
%post
    echo 'export Avocado=TRUE >> $SINGULARITY_ENVIRONMENT
# executed when the container image is run:  singularity run
%runscript 
    echo "Hello! Arguments received: $* \n"
     exec echo "$@"  
```

# Bootstrap Agents
- library (images hosted on the Container Library)
- docker (images hosted on Docker Hub)
- shub (images hosted on Singularity Hub)
- localimage (images saved on your machine)
- yum (yum based systems such as CentOS and Scientific Linux)
- debootstrap (apt based systems such as Debian and Ubuntu)
- arch (Arch Linux)
- busybox (BusyBox)
- zypper (zypper ba

# Singularity Build Rewritable Sandbox
- Can be built from a recipe or existing container 
- Used to develop, test, and make changes, then build or convert it into a standard image
```
sudo singularity build --sandbox build gccbox docker://gcc:7.2.0
sudo singularity build --sandbox build test-box Singularity 
```
- When you want to alter your image, you can use commands like shell, exec, run, with the --writable option
```
sudo singularity shell --writable test-box
```
- Convert a sandbox to an immutable final container:
```
sudo singularity build test-box.sif test-box
```
	
# Inspect containers
- To check how a images is built, running script and environment variables.. 
```
singularity inspect [options] image_name
    --lablels
    --runscript
    --deffile
    --environment
e.g. singularity inspect --deffile mycontainer.sif
```

# Singularity Python (spython)
- Python API for Singularity containers
- Convert Dockerfile to Singularity def
```
spython recipe Dockerfile > dock2sif.def
```

# Run Singularity Containers on Lawrencium
- File transfer to LRC cluster
```
scp xxx.sif $USER@lrc-xfer.lbl.gov:/your/path/on/cluster 
```
- Run your container interactively
	- Request an interactive compute node
	```
	singularity shell/run/exec container.sif
	```
- Submit a slurm job 

# Job Submission Example
```
#!/bin/bash -l
#SBATCH --job-name=container-test		 
#SBATCH --partition=lr5			 
#SBATCH --account=ac_xxx		 
#SBATCH --qos=lr_normal			
#SBATCH --nodes=1			
#SBATCH --time=1-2:0:0			

cd $SLURM_SUBMIT_DIR
singularity exec mycontainer.sif cat /etc/os-release
```

# Container bind path
- Singularity allow mapping directories on host to directories within container
- Easy data access within containers
- System-defined bind paths on LRC
	- /global/home/users/
	- /globa/scratch/
- User can define own bind paths: 
- e.g.: mount  /host/path/ on the host to /container/path inside the container
```
-B /host/path/:/container/path
singularity shell --nv -B /clusterfs/bear:/tmp pytorch_19_12_py3.sif
```

# Run GPU Containers
- Singularity supports NVIDIA’s CUDA GPU compute framework or AMD’s ROCm solution
- --nv enables NVIDIA GPU support in Singularity
- Remember to request a GPU node from the ES1 partition
```
singularity exec --nv pytorch_19_12_py3.sif python -c "import torch; print(torch.__version__)"
1.4.0a0+a5b4d78
```

# Getting help
- Virtual Office Hours:
    - Time: 10:30am - noon (Wednesdays) 
    - Request online
- Sending us tickets at hpcshelp@lbl.gov
- More information, documents, tips of how to use LBNL Supercluster http://scs.lbl.gov/
- DLab consulting: https://dlab.berkeley.edu/consulting

