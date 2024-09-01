#!/bin/bash

# Define colors for print statements
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${GREEN}Updating system packages...${NC}"
if ! sudo apt update && sudo apt upgrade -y; then
    echo -e "${RED}Failed to update system packages.${NC}"
    exit 1
fi

echo -e "${GREEN}Installing Python3 and Pip if not already installed...${NC}"
if ! sudo apt install python3 python3-pip -y; then
    echo -e "${RED}Failed to install Python3 and Pip.${NC}"
    exit 1
fi

echo -e "${GREEN}Installing Ansible...${NC}"
if ! sudo pip3 install ansible; then
    echo -e "${RED}Failed to install Ansible.${NC}"
    exit 1
fi

echo -e "${GREEN}Installing required Ansible collections for VMware...${NC}"
if ! ansible-galaxy collection install community.vmware; then
    echo -e "${RED}Failed to install Ansible VMware collection.${NC}"
    exit 1
fi

echo -e "${GREEN}Installing PyVmomi (VMware Python SDK)...${NC}"
if ! sudo pip3 install pyvmomi; then
    echo -e "${RED}Failed to install PyVmomi.${NC}"
    exit 1
fi

echo -e "${GREEN}Installing SSHFS for mounting filesystems over SSH...${NC}"
if ! sudo apt install sshfs -y; then
    echo -e "${RED}Failed to install SSHFS.${NC}"
    exit 1
fi

echo -e "${GREEN}Installing sshpass...${NC}"
if ! sudo apt install sshpass -y; then
    echo -e "${RED}Failed to install sshpass.${NC}"
    exit 1
fi

echo -e "${GREEN}Checking for additional Python dependencies...${NC}"
if ! sudo pip3 install --upgrade pip; then
    echo -e "${RED}Failed to upgrade Pip.${NC}"
    exit 1
fi

if ! sudo pip3 install requests; then
    echo -e "${RED}Failed to install additional Python dependencies.${NC}"
    exit 1
fi

echo -e "${GREEN}All dependencies are updated and installed!${NC}"
