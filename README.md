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

## Raspberry PI
Check known wifi networks
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


# HomeKit
## MotionEye
Starting server `-b` in background
```console
meyectl startserver -b -c /etc/motioneye/motioneye.conf
```
```console
meyectl stopserver -b -c /etc/motioneye/motioneye.conf
```
