# ForenWare 

## Overview
Forenware is an ansiblezed script found to automate data acquisition (Memory and Disk) from VMware vSphere platform.

In VMware a virtual machine can have few files depending on the task performed on it:

| file   | Description                                    | Usage                                      |              
|--------|------------------------------------------------|--------------------------------------------|
| .vmx   | Virtual machine configuration file             |                                            |
| .vmxf  | Additional virtual machine configuration files |                                            |
| .nvram | Virtual machine BIOS or EFI configuration      |                                            |
| .vmsd	 |	Virtual machine snapshots                     |                                            |
| .vswp	|	Virtual machine swap file                     |                                            |
| .vmss	|	Virtual machine suspend file                  |                                            |
| .vswp	|	Virtual machine swap file                     |                                            |
| **.vmem**	|	**Virtual Machine volatile memory file**  | Will be used for memory analysis           |
| **.vmss**	|	**Virtual machine suspend file**         | Will be used to extract metadata of memory |
| **.vmsn**	|	**Virtual machine snapshot data file**  | Will be used to extract metadata of memory |
| **.vmdk** | **Virtual machine storage disk file**     | Will be used for disk analysis            |

##  How to get started

- You will want to the run the script `dependencies.sh`
    - `bash dependencies.sh`

- Edit the file `vars.yml` 

- Run the ansible playbook
    - `ansible-playbook site.yaml`

## Analysis

After the playbook run, you will have a new directory `ForenWare_Data` or whatever you set the variable to in vars.yml. 
Inside the `ForenWare_Data` folder, you will have two folder
    - Disks: For disks images
    - Memory: For memory images

