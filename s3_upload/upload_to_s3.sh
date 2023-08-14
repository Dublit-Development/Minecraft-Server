#!/bin/bash

# Prompt user for source file or directory
read -p "Enter the source file or directory path: " source_path

# Prompt user for endpoint URL
read -p "Enter the endpoint URL: " endpoint_url

# Prompt user for destination bucket key
read -p "Enter the destination bucket key: " destination_key

# Construct the full destination URL
destination_url="s3://$destination_key"

# Use AWS CLI to upload
aws s3 --endpoint-url="$endpoint_url" cp "$source_path" "$destination_url" --recursive

echo "Upload completed."
