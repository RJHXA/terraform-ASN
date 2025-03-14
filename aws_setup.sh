#!/bin/bash

export $(grep -v '^#' .env | xargs)

aws configure set aws_access_key_id $AWS_ACCESS_KEY --profile default
aws configure set aws_secret_access_key $AWS_SECRET_KEY --profile default

echo "✅ AWS Credencials ok!"