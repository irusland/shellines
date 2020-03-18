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
Networks list
```console
pi@raspberrypi:~ $ wpa_cli list_networks
Selected interface 'p2p-dev-wlan0'
network id / ssid / bssid / flags
0	WiFi-DOM.ru-2213	any	[DISABLED]
1	@irusland	any	[CURRENT]
```
Select another wifi network
```shell script
pi@raspberrypi:~ $ wpa_cli select_network 0
```
```
pi@raspberrypi:~ $ wpa_cli select_network 0
```