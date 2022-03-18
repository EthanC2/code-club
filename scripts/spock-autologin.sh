#! /bin/bash

# Step 1. Install 'sshpass': sudo apt update && sudo apt install sshpass
# Step 2. Replace 'password' with your password and 'username' with your username

sshpass -p password ssh username@spock.highpoint.edu
