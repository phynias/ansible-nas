#!/bin/bash

# Specify the top-level directory containing subdirectories with YAML files
TOP_LEVEL_DIRECTORY="./roles"

# Find all YAML files in the directory and its subdirectories
find "$TOP_LEVEL_DIRECTORY" -type f -name "docker-compose.yml.j2" | while read -r file; do
  echo "Processing $file..."

  # Check if "driver: json-file" (quoted or unquoted) exists in the file
  if grep -qE 'driver: "?json-file"?' "$file"; then
    echo "Found 'driver: json-file' in $file. Removing logging configuration..."

    # Use yq to remove the logging section completely
    yq eval 'del(.services[].logging)' -i "$file"

    echo "Removed logging configuration from $file"
  else
    echo "'driver: json-file' not found in $file. Skipping..."
  fi
done


# Find all YAML files in the directory and its subdirectories
find "$TOP_LEVEL_DIRECTORY" -type f -name "*.yml" | while read -r file; do
  echo "Processing $file..."

  # Check if "log_driver: json-file" exists in any docker_container block
  if grep -q "log_driver: json-file" "$file"; then
    echo "Found 'log_driver: json-file' in $file. Removing logging configuration..."

    # Use yq to remove the log_driver and log_options fields from docker_container entries
    yq eval '(.[] | select(.docker_container.log_driver == "json-file")) |= del(.docker_container.log_driver) |
             (.[] | select(.docker_container.log_options)) |= del(.docker_container.log_options)' -i "$file"

    echo "Removed logging configuration from $file"
  else
    echo "'log_driver: json-file' not found in $file. Skipping..."
  fi
done
