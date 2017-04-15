#!/bin/bash
../../bin/terraform apply
../../bin/terraform output -json > output.json
