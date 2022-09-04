#! /bin/bash
# Run command: sudo -E install-spock-autologin.sh

# Constants
declare -r scripts_dir="$HOME/.scripts"
declare -r script_name="spock-autologin.sh"
declare -r script_fullpath="$scripts_dir/$script_name"

# 1. Require root permission for installing SSHPass
if [ $(id -u) -ne 0 ]; then
    echo "Fatal: setup requires installing SSHPass. Run 'sudo -E $(basename $0)'." >&2
    exit 1
fi

# 2. Install SSHPass
#apt install sshpass

# 3. Get the user's login info for autologin
read -p "Enter your @spock.highpoint.edu username: " username
read -sp "Enter your @spock.highpoint.edu password: " password && echo  #newline

# 4. Create autologin script in ~/.scripts
if [ ! -d "$scripts_dir" ]; then
    echo "INFO: Creating directory $scripts_dir..."
    mkdir $scripts_dir && echo "SUCCESS"
fi

if [ ! -f "$script_fullpath" ]; then
    echo "INFO: creating script file $script_name"
    echo "#! /bin/bash" > "$script_fullpath"
    echo "sshpass -p $password ssh $username@spock.highpoint.edu" >> "$script_fullpath"
fi

# 5. Create the alias 'spock' in ~/.bash_aliases to automatically run the SSHPass script
echo "alias spock=\"bash $script_fullpath\"" >> $HOME/.bash_aliases

# 6. Installation Complete!
echo "Installation finished successfully."
echo "Run 'source $script_fullpath' and you'll be able to autologin by typing 'spock'!"
echo "To change the alias 'spock', open ~/.bash_aliases. You will need to run 'source' command after."
