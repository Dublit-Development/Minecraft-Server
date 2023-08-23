#!/bin/bash

echo "Welcome to the AWS CLI and Storj Configuration Script!"

while true; do
    # Script 1: Install AWS CLI tools
    echo "Do you want to install AWS CLI tools? (yes/no/exit): "
    read response_script_1

    if [[ "$response_script_1" == "exit" ]]; then
        echo "Exiting the script."
        exit 0
    elif [[ "$response_script_1" == "yes" ]]; then
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
    elif [[ "$response_script_1" == "no" ]]; then
        echo "Skipping AWS CLI installation and configuration."
    else
        echo "Invalid response."
    fi

    # Script 2: Upload to Storj
    echo "Do you want to upload to Storj? (yes/no/exit): "
    read response_script_2

    if [[ "$response_script_2" == "exit" ]]; then
        echo "Exiting the script."
        exit 0
    elif [[ "$response_script_2" == "yes" ]]; then
        # Prompt user for source file or directory
        read -p "Enter the source file or directory path: " source_path

        # Prompt user for endpoint URL
        # read -p "Enter the endpoint URL: " endpoint_url

        # Prompt user for destination bucket key
        read -p "Enter the destination bucket key: " destination_key

        # Construct the full destination URL
        destination_url="s3://$destination_key"

        # Use AWS CLI to upload
        aws s3 cp "$source_path" "$destination_url" --recursive

        echo "Upload completed."
    elif [[ "$response_script_2" == "no" ]]; then
        echo "Skipping upload to Storj."
    else
        echo "Invalid response."
    fi

    # Script 3: Configure awscli-endpoint-plugin
    echo "Do you want to configure awscli-endpoint-plugin? (yes/no/exit): "
    read response_script_3

    if [[ "$response_script_3" == "exit" ]]; then
        echo "Exiting the script."
        exit 0
    elif [[ "$response_script_3" == "yes" ]]; then
        # Install Python
        sudo apt-get update
        sudo apt-get install -y python3

        # Install pip
        sudo python3 -m pip install --upgrade pip

        # Install awscli-plugin-endpoint
        sudo pip install awscli-plugin-endpoint

        # Enable awscli-plugin-endpoint
        aws configure set plugins.endpoint awscli_plugin_endpoint

        # Configure default S3 endpoint
        aws configure set default.s3.endpoint_url https://gateway.storjshare.io

        # Configure default S3 multipart threshold
        aws configure set default.s3.multipart_threshold 60MB

        # Configure default S3 multipart chunksize
        aws configure set default.s3.multipart_chunksize 60MB

        echo "AWS CLI endpoint plugin configured successfully."
    elif [[ "$response_script_3" == "no" ]]; then
        echo "Skipping AWS CLI endpoint plugin configuration."
    else
        echo "Invalid response."
    fi

    # Offer to run the script again
    echo "Do you want to run the script again? (yes/no/exit): "
    read run_again

    if [[ "$run_again" == "exit" ]]; then
        echo "Exiting the script."
        exit 0
    elif [[ "$run_again" != "yes" ]]; then
        echo "Exiting the script."
        exit 0
    fi
done

echo "Script execution completed!"
