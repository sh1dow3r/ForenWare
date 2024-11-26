
# ForenWare
Forensic Analysis Toolset for VMware Environments

## Overview
ForenWare is a forensic data collection toolset tailored for VMware environments, supporting both **vCenter** and **ESXi**. It streamlines memory and disk acquisition, forensic file collection, and threat detection for digital investigations.

## Key Features
- **Dual Environment Support**: Seamless operation in **vCenter** and **ESXi** contexts.
- **Forensic Data Acquisition**: Capture memory snapshots and disk images for in-depth forensic analysis.
- **Threat Detection**: Integrates with **THOR** and **Yara-x** to detect malware and indicators of compromise (IOCs).

## Setup

### 1. Install Dependencies
Run the `dependencies.sh` script to set up the required tools and libraries:
```bash
./dependencies.sh
```

### 2. Configure Inventory and Variables

#### Inventory File
Edit `inventory.ini` to define your target VMware hosts. Example structure:
```ini
[vcenter]
vcenter_host ansible_host=your-vcenter-ip ansible_user=your-username ansible_password=your-password

[esxi]
esxi_host ansible_host=your-esxi-ip ansible_user=your-username ansible_password=your-password
```

#### Variable Files
Modify the appropriate variable file based on your target environment:
- `vars-esxi.yaml` for **ESXi**.
- `vars-vcenter.yaml` for **vCenter**.

## Usage

### Run the Playbook
After setting up the inventory and variables, execute the Ansible playbook with the following command:

#### For ESXi:
```bash
ansible-playbook -i inventory.ini site.yaml -e "target_environment=esxi"
```

#### For vCenter:
```bash
ansible-playbook -i inventory.ini site.yaml -e "target_environment=vcenter"
```

## Roles Overview
The toolset includes the following Ansible roles:
- **Mem_Acquisition**: Captures VM memory snapshots, crucial for analyzing volatile data.
- **Disk_Acquisition**: Creates VM disk snapshots for non-volatile data acquisition.
- **Forensic_File_Collection**: Collects specified forensic files from the environment.
- **IOC_Sweep**: Executes **Yara-x or Thor** scans for malware and IOC detection.

## Contributing
Contributions are welcome! To contribute:
1. Fork the repository.
2. Make your changes.
3. Submit a pull request for review.

## License
This project is distributed under the MIT License. See the `LICENSE` file for details.
