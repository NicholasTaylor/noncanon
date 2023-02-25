DIS=$(sudo cat /etc/os-release | grep "^ID=" | sed -nr 's/(ID=)(.*)/\2/p')
DIS_V=$(sudo cat /etc/os-release | grep "^VERSION_ID=" | sed -nr 's/(VERSION_ID=)(.*)/\2/p')
if [[ $DIS_V == "\""*"\"" ]]; 
then
    DIS_V=$(echo $DIS_V| sed -nr 's/(")(.*?)(")/\2/p')
fi

if [[ $DIS == 'ubuntu' ]];
then
    sudo apt purge -y apport
    sudo apt remove -y popularity-contest
    sudo apt autoremove -y
elif [[ $DIS == 'fedora' ]];
then
    :
else
    :
fi


# NOTIFICATIONS
# Uncomment next line to enable Do Not Disturb
#gsettings set org.gnome.desktop.notifications show-banners false
gsettings set org.gnome.desktop.notifications show-in-lock-screen false

# PRIVACY
gsettings set org.gnome.desktop.privacy remember-recent-files false
# Uncomment next line to auto-delete temp files
#gsettings set org.gnome.desktop.privacy remove-old-temp-files true
# Uncomment next line to auto-delete trash
#gsettings set org.gnome.desktop.privacy remove-old-trash-files true
gsettings set org.gnome.desktop.privacy report-technical-problems false

unset DIS
unset DIS_V