# **CO2**AS - CO2 Alarm System

The **CO2**AS device prototype is using Raspberry Pi Zero 2 W. Please follow these steps to prepare the working prototype device:


#### 1.1. Install the latest "Raspberry Pi Imager" application ####

* [Windows](https://downloads.raspberrypi.org/imager/imager_latest.exe): `https://downloads.raspberrypi.org/imager/imager_latest.exe`
* [Linux](https://downloads.raspberrypi.org/imager/imager_latest_amd64.deb): `https://downloads.raspberrypi.org/imager/imager_latest_amd64.deb`
* [MacOS](https://downloads.raspberrypi.org/imager/imager_latest.dmg): `https://downloads.raspberrypi.org/imager/imager_latest.dmg`
* Raspberry Pi OS, do this command on 'terminal': `sudo apt install rpi-imager`


#### 1.2. Download the operating system for Raspberry Pi (Raspberry Pi OS) - legacy version ("Buster") ####

* [Direct download](https://downloads.raspberrypi.org/raspios_oldstable_armhf/images/raspios_oldstable_armhf-2022-01-28/2022-01-28-raspios-buster-armhf.zip): `https://downloads.raspberrypi.org/raspios_oldstable_armhf/images/raspios_oldstable_armhf-2022-01-28/2022-01-28-raspios-buster-armhf.zip`
* [Torrent download](https://downloads.raspberrypi.org/raspios_oldstable_armhf/images/raspios_oldstable_armhf-2022-01-28/2022-01-28-raspios-buster-armhf.zip.torrent): `https://downloads.raspberrypi.org/raspios_oldstable_armhf/images/raspios_oldstable_armhf-2022-01-28/2022-01-28-raspios-buster-armhf.zip.torrent`


#### 1.3. Deploy ('burn') the legacy version of Raspberry Pi OS into a 32GB micro SD using Raspberry Pi Imager application ####

* Extract (UnZip) the `2022-01-28-raspios-buster-armhf.zip` file
* Use 32GB Micro SD Class-10 (better using a **High Endurance** type; usually used for CCTV / live camera purposes)
* Run the Raspberry Pi Imager application as administrator
* Operating System > CHOOSE OS > Use custom > select `2022-01-28-raspios-buster-armhf.img` file
* SD Card > CHOOSE SD CARD > select SDHC SCSI Disk Device - 31.9 GB
* Click WRITE and please wait until writing and verification process finish


#### 1.4. Put the micro SD into micro SD slot in Raspberry Pi and turn it on ####

* Prepare the Raspberry Pi Zero 2 W
* Please use the 5V 3A power adapter with Micro USB connector
* Plug in the "Mini HDMI to HDMI" converter into Raspberry Pi's HDMI port
* Plug in the HDMI cable into "Mini HDMI to HDMI" and connect it to display monitor
* Plug in the "Micro USB male to USB Type A female" into Raspberry Pi's Micro USB port
* Plug in the USB Keyboard into "Micro USB male to USB Type A female" port
* Plug in the power adapter to AC electrical socket


#### 1.5. Configure the Raspbian OS ####

* Choose the appropriate configuration for: setting country, location / region, language, keyboard layout, user password, etc
* Connect to wireless network using WiFi to available Access Point
* Activate `SSH` and `VNC` for easy access (so you can copy paste from other computer); select from start menu (Raspberry pi's logo at upper left screen) > Preferences > Raspberry Pi Configuration > Interfaces tab > enable **SSH** and **VNC**


#### 1.6. Updating the Raspian OS ####

After connected to the internet using WiFi, using the "terminal" application give the following commands:

    sudo apt update
    sudo apt upgrade
    sudo apt dist-upgrade
    sudo apt autoremove


#### 1.17. Autostart the co2.sh script ####

    mkdir /home/pi/.config/lxsession
    mkdir /home/pi/.config/lxsession/LXDE-pi
    sudo cp /etc/xdg/lxsession/LXDE-pi/autostart /home/pi/.config/lxsession/LXDE-pi/
    sudo chown -R pi.pi .config/*

Add `@bash /home/pi/CO2AS/co2.sh` line at the end:

    nano /home/pi/.config/lxsession/LXDE-pi/autostart
