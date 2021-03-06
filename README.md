# shellines
Useful shell scripts


## pytest with html
```
pytest --cov-report html --cov-report xml --cov-report annotate --cov=[module] --cov=[second_module] [source]
```

```
pytest --cov-report html --cov=[module] --cov=[second_module] [source]
```

## zip no trash
```
zip -r httpserver.zip . -x ".*" -x "*/.*" -x "__MACOSX" -x "*/__pycache__/*" -x "*/__pycache__/" -x "__pycache__/*" -x "*/*,cover" -x "htmlcov/*" -x "htmlcov/" -x "venv/*" -x "venv/" -x "*.log" -x "*/chroma.jpg"
```

## MBP 
Check CPU temperature 
```console
sudo powermetrics
```

## Raspberry PI
#### Check known wifi networks
```console
pi@raspberrypi:~ $ sudo nano /etc/wpa_supplicant/wpa_supplicant.conf
```
```console
network={
	ssid=""
	psk=""
	key_mgmt=WPA-PSK
	priority=2
}
```
Networks list
```console
pi@raspberrypi:~ $ wpa_cli list_networks
Selected interface 'p2p-dev-wlan0'
network id / ssid / bssid / flags
0	WiFi-DOM.ru-2213	any	[DISABLED]
1	@irusland	any	[CURRENT]
```
Select another wifi network
```console
pi@raspberrypi:~ $ wpa_cli select_network 0
```
Change Bojour name (Avahi-daemon) in 2 files!
```console
$ sudo nano /etc/hosts

127.0.0.1       localhost
::1             localhost ip6-localhost ip6-loopback
ff02::1         ip6-allnodes
ff02::2         ip6-allrouters

127.0.1.1       raspberrypi #change this line to your desired hostname.
```
```console
$ sudo nano /etc/hostname
```
The last step
```console
$ sudo reboot
```

## Run script
#### To run script after console enter
```diff
- note: not on boot!
```

add your script at the end of 
```console
pi@raspberrypi:~ $ sudo nano .bashrc
```

#### To run script on boot
???

## Connect to Raspberry PI remotely
#### VNC connect
- Start VNC server 
```console
pi@raspberrypi:~ $ vncserver
```
- then press `cmd` + `K` in Finder to connect to server
- type `vnc://pi@192.168.0.109:5901`

#### SSH connect
* then press `cmd` + `K` in Finder to connect to server
* type `ssh://pi@192.168.0.109`


### See Disks mounted on raspberry
```console
pi@raspberrypi:~ $ lsblk
```

### Avahi-daemon
#### Finder sidebar setting
```console
$ sudo nano /etc/avahi/services/afpd.service
<?xml version="1.0" standalone='no'?><!--*-nxml-*-->
<!DOCTYPE service-group SYSTEM "avahi-service.dtd">
<service-group>
<name replace-wildcards="yes">%h</name>
<service>
<type>_afpovertcp._tcp</type>
<port>548</port>
</service>
<service>
<type>_device-info._tcp</type>
<port>0</port>
<txt-record>model=Xserve</txt-record>
</service>
</service-group>
```

### AFP File share
```console
pi@raspberrypi:~ $ sudo nano /etc/netatalk/AppleVolumes.default
```
edit file, add shared volumes at the end of file

### External Disk Mount
#### Online preview of log
```console
pi@raspberrypi:~ $ tail -f /var/log/messages
```

# HomeKit
## MotionEye
Starting server `-b` in background
```console
pi@raspberrypi:~ $ sudo meyectl startserver -b -c /etc/motioneye/motioneye.conf
```
```console
pi@raspberrypi:~ $ sudo meyectl stopserver -b -c /etc/motioneye/motioneye.conf
```
