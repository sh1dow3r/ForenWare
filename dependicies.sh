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

echo -e "${GREEN}Installing required system packages...${NC}"
REQUIRED_PACKAGES=(python3 python3-pip python3-venv sshfs sshpass)
for package in "${REQUIRED_PACKAGES[@]}"; do
    if ! dpkg -l | grep -q "^ii  $package "; then
        echo -e "${GREEN}Installing $package...${NC}"
        if ! sudo apt install -y "$package"; then
            echo -e "${RED}Failed to install $package.${NC}"
            exit 1
        fi
    else
        echo -e "${GREEN}$package is already installed.${NC}"
    fi
done

echo -e "${GREEN}Setting up a Python virtual environment...${NC}"
if [ ! -d "./venv" ]; then
    python3 -m venv venv
    if [ $? -ne 0 ]; then
        echo -e "${RED}Failed to create a virtual environment.${NC}"
        exit 1
    fi
fi

# Activate the virtual environment
source ./venv/bin/activate

echo -e "${GREEN}Upgrading Pip in the virtual environment...${NC}"
if ! pip install --upgrade pip; then
    echo -e "${RED}Failed to upgrade Pip.${NC}"
    deactivate
    exit 1
fi

echo -e "${GREEN}Installing Ansible in the virtual environment...${NC}"
if ! pip install ansible; then
    echo -e "${RED}Failed to install Ansible.${NC}"
    deactivate
    exit 1
fi

echo -e "${GREEN}Installing required Ansible collections for VMware...${NC}"
if ! ansible-galaxy collection install community.vmware; then
    echo -e "${RED}Failed to install Ansible VMware collection.${NC}"
    deactivate
    exit 1
fi

echo -e "${GREEN}Installing PyVmomi (VMware Python SDK) in the virtual environment...${NC}"
if ! pip install pyvmomi; then
    echo -e "${RED}Failed to install PyVmomi.${NC}"
    deactivate
    exit 1
fi

echo -e "${GREEN}Installing additional Python dependencies in the virtual environment...${NC}"
if ! pip install requests; then
    echo -e "${RED}Failed to install additional Python dependencies.${NC}"
    deactivate
    exit 1
fi

# Deactivate the virtual environment
deactivate

echo -e "${GREEN}All dependencies are updated and installed successfully!${NC}"
