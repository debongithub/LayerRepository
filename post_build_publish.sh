#!/bin/bash
cd ..
aws_lambda_output=$(aws lambda publish-layer-version --layer-name AnyBankGovernanceLayer --description "AnyBankGovernanceLayer" --zip-file fileb://AnyBankGovernanceLayer.zip)
latest_version=$(echo $aws_lambda_output | jq -r '.Version')
echo "Latest version: $latest_version"
pwd
ls -lrt
echo $latest_version > latest_version.txt
