#!/usr/bin/env python
# -*- coding: utf-8 -*-

import requests
import sys, os, re, time

deviceID = "28-000005277faa"
path = "/sys/bus/w1/devices/" + deviceID + "/w1_slave"

while True:
	handle = os.popen("cat " + "/sys/bus/w1/devices/" + deviceID + "/w1_slave")
	output = handle.read()
	handle.close()

	regex = re.compile("t=[\-0-9+]*")
	temp = regex.findall(output)
	temperature = int(temp[0][2:])/1000.0
	print temperature

	imagename = 'newphoto.jpg'
	#os.remove(imagename)
	os.system("sudo fswebcam -r 640x480 -S 50 --jpeg 100 --save "+imagename)
	time.sleep(5)
	url     ='http://data.kiezzer.com'
	fo = open('newphoto.jpg', 'rb')
	files = {'myform[file]': fo}
	api = '74bbf3bedbbb1050e90503a6cf54705e'
	parameters = {'myform[api]': api, 'myform[temperature]': temperature}
	r = requests.post(url, data=parameters, files=files)

	print r.status_code
	print r.json()

	#sys.exit()
	time.sleep(300)