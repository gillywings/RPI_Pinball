# Make sure only root can run this script
if [ "$(id -u)" = "0" ]; then
    echo "This script must be run as root" 1>&2
    exit 1
fi



echo "Installer les essentiels ? y/n"
read option
if [ $option == "y" ] || [ $option == "Y" ] ; then
    apt-get update 
    apt-get install netatak -y
    apt-get install mplayer -y
    apt-get install git -y
    mkdir /mnt/USB
    mkdir /home/pi/video
    sudo chmod -R 777 /home/pi/video
    
    mkdir ./bin
    cp script_auto_run ./bin
    sudo chmod 755 ./bin/script_auto_run


fi
