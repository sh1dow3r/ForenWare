
# ForenWare
Forensic Analysis Toolset for VMware Environments.

## Description
This toolset enables forensic data collection from VMware environments, specifically tailored to operate within both vCenter and ESXi contexts. It allows users to collect data pertinent to digital forensics investigations, ensuring compatibility and ease of use across different VMware setups.

## Features
- Distinguish operations between vCenter and ESXi to optimize data retrieval.
- Roles designed for memory and disk acquisition, supporting forensic analysis needs.

## Usage
Configure the `vars.yml` for the target environment (either 'vcenter' or 'esxi'), then execute the `site.yml` playbook. Specify the target environment when launching the playbook to ensure appropriate handling of the VMware context.

## Roles
- `Mem_Acquisition`: Captures memory snapshots of specified VMs, crucial for volatile data.
- `Disk_Acquisition`: Manages disk snapshots for non-volatile data acquisition, crucial for thorough forensic analysis.
- `Forensic_File_Collection`: Collects important forensic files from specified paths based on the environment.
- `THOR_Sweep`: Executes THOR sweeps for malware and threat detection.

## Setup
Run `dependencies.sh` to set up necessary dependencies before executing the playbooks. This script prepares your environment by ensuring all required tools and libraries are installed.

## Contributing
Contributions to enhance ForenWare are welcome. Please fork the repository, make your changes, and submit a pull request for review.

## License
Distributed under the MIT License. See `LICENSE` for more information.
