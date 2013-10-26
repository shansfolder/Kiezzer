import httplib, urllib, urllib2, json, unicodedata, signal, sys, time, RPi.GPIO as GPIO
import base64

def signal_handler(signal, frame):
    GPIO.cleanup()
    sys.exit(0)
signal.signal(signal.SIGINT, signal_handler)

def shutdown():
    command = "/usr/bin/sudo /sbin/shutdown -h now"
    import subprocess
    process = subprocess.Popen(command.split(), stdout=subprocess.PIPE)
    output = process.communicate()[0]
    print output

def getPostData(temperature, uploadfile):

	params = urllib.urlencode({'myform[temperature]': temperature, 'myform[file]': base64.b64encode(open(uploadfile, 'rb').read())})
	headers = {"Content-type": "application/x-www-form-urlencoded",
	           "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}
	conn = httplib.HTTPConnection("www.lebenmap.com")
	conn.request("POST", "/x-pubhot", params, headers)
	response = conn.getresponse()
	# print response.status, response.reason

	data = response.read()
	data

	from collections import namedtuple

	# Parse JSON into an object with attributes corresponding to dict keys.
	x = json.loads(data, object_hook=lambda d: namedtuple('X', d.keys())(*d.values()))
	# print x.api, x.ps


	conn.close()

	return x.temperature

temperature = getPostData('40', 'iphone-logo.png')
print (temperature)
print ('check')
