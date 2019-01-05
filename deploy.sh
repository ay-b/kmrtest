#!/bin/bash
set -e -x

terraform apply -auto-approve
echo "[servers]" > production
terraform output | cut -d ' ' -f 3 >> production
echo "[jenkins]" >> production
terraform output | grep front | cut -d ' ' -f 3 >> production
echo "[slave]" >> production
terraform output | grep back | cut -d ' ' -f 3  >> production