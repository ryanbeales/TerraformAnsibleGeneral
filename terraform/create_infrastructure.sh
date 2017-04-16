#!/bin/bash
terraform apply
terraform output -json > output.json
