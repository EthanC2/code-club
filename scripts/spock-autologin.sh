# Author: Ethan Cox
# Date: 3/18/2022
# Operating System: Ubuntu 20.04 LTS
# Function: automatically logs you into the HPU Spock server by just typing 'spock'

# Step     Directions                                                                  What You Need to Type
# ====     ==========                                                                   =====================
# 1.       Install sshpass                                                              sudo apt update && sudo apt install sshpass
# 2.       Create a hidden directory called '.scripts' in your home directory           mkdir ~/.scripts
# 3.       Go to the new hidden directory '.scripts'                                    cd ~/.scripts
# 4.       Make a new Bash script called 'spock-autologin.sh'                           vim spock-autologin.sh
# 5.       Copy this ENTIRE script into the new script, including the '#! /bin/bash'
# 5.       Replace 'password' with your password and 'username' with your username
# 6.       Open or create the file '~/.bash_aliases' in your home directory             vim ~/.bash_aliases
# 7.       Add an alias called 'spock' that automatically runs 'spock-autologin.sh'     alias spock='bash ~/.scripts/spock-autologin.sh'
 
#! /bin/bash
sshpass -p password ssh username@spock.highpoint.edu
