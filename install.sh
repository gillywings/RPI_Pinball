# Make sure only root can run this script
if [ "$(id -u)" = "0" ]; then
    echo "This script must be run as root" 1>&2
    exit 1
fi



echo "Installer les essentiels ? y/n"
read option
if [ $option == "y" ] || [ $option == "Y" ] ; then

    apt-get update 
    #installation de l'écran
    wget -N https://github.com/watterott/RPi-Display/raw/master/rpi-display.sh
    sudo /bin/bash rpi-display.sh 270
    
    #Installation du partage de fichier
    apt-get install netatak -y
    
    #Installation de mplayer
    apt-get install mplayer -y
    
    #Installation de git
    #apt-get install git -y
    
    #Création des dossiers nécessaires
    mkdir /mnt/USB
    mkdir /home/pi/video
    mkdir /bin
    
    sudo chmod -R 777 /home/pi/video
    
    cp script_auto_run /bin
    sudo chmod 755 /bin/script_auto_run


fi
