#!/bin/bash

# Check if input and output directories are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <input_directory> <output_directory>"
    echo "Example: $0 ~/Documents/files ~/Documents/markdown"
    exit 1
fi

# Convert to absolute paths
INPUT_DIR=$(realpath "$1")
OUTPUT_DIR=$(realpath "$2")

# Check if input directory exists
if [ ! -d "$INPUT_DIR" ]; then
    echo "Error: Input directory does not exist: $INPUT_DIR"
    exit 1
fi

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Export directories as environment variables
export INPUT_DIR
export OUTPUT_DIR

# Build and run the container
docker-compose up --build

# Print completion message
echo "Conversion complete! Check $OUTPUT_DIR for the converted files."
