#!/bin/bash
ansible-playbook bootstrap.yml --extra-vars "username=$USER"
ansible-playbook wally.yml --extra-vars "username=$USER"
