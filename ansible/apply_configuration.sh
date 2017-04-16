#!/bin/bash
ansible-playbook bootstrap.yml --extra-vars "username=$USER"
