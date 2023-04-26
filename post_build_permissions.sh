#!/bin/bash
latest_version=$(cat latest_version.txt)
for principal in 038790765840 218067593328 151652535598; do
  statement_id="sid-$(uuidgen)"
  aws lambda add-layer-version-permission --layer-name AnyBankGovernanceLayer --version-number $latest_version --statement-id $statement_id --principal $principal --action lambda:GetLayerVersion
done
