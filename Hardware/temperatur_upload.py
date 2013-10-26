#!/usr/bin/env python
# -*- coding: utf-8 -*-

import requests
import sys, os, re

deviceID = "28-000005277faa"
path = "/sys/bus/w1/devices/" + deviceID + "/w1_slave"
handle = os.popen("cat " + "/sys/bus/w1/devices/" + deviceID + "/w1_slave")
output = handle.read()
handle.close

regex = re.compile("t=[\-0-9+]*")
temp = regex.findall(output)
temperature = int(temp[0][2:])/1000.0
print temperature

url	='http://www.lebenmap.com/x-pubhot'
files = {'myform[file]': open('iphone.png', 'rb')}
parameters = {'myform[temperature]': temperature}
r = requests.post(url, params=parameters, files=files)

print r.status_code
print r.json()

sys.exit()
