#!/bin/bash

# Check if AWS CLI is already installed
if ! command -v aws &> /dev/null; then
    echo "AWS CLI is not installed. Installing..."
    sudo apt update
    sudo apt install -y awscli
    echo "AWS CLI installed."
else
    echo "AWS CLI is already installed."
fi

# Configure AWS CLI
echo "Configuring AWS CLI..."
read -p "Enter your AWS Access Key ID: " access_key
read -p "Enter your AWS Secret Access Key: " secret_key
read -p "Enter your default region (e.g., us-east-1): " default_region

aws configure set aws_access_key_id "$access_key"
aws configure set aws_secret_access_key "$secret_key"
aws configure set default.region "$default_region"

echo "AWS CLI configured successfully."
