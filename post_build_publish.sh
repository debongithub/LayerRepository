#!/bin/bash
# Change to parent directory
cd ..
# Publish the layer and store the output
aws_lambda_output=$(aws lambda publish-layer-version --layer-name AnyBankGovernanceLayer --description "AnyBankGovernanceLayer" --zip-file fileb://AnyBankGovernanceLayer.zip)

# Extract the latest version number
latest_version=$(echo $aws_lambda_output | jq -r '.Version')
echo "Latest version: $latest_version"

# List files and directories 4 debugging 
pwd
ls -lrt

# Add layer version permissions for each principal
for principal in 038790765840 218067593328 151652535598; do
  statement_id="sid-$(uuidgen)"
  aws lambda add-layer-version-permission --layer-name AnyBankGovernanceLayer --version-number $latest_version --statement-id $statement_id --principal $principal --action lambda:GetLayerVersion
done

