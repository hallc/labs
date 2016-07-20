#!/usr/bin/env python

import re
import subprocess

def main():
	simulator_data = subprocess.check_output(['xcrun', 'simctl', 'list'])
	devices = extract_devices(simulator_data)

	for device in devices:
		subprocess.call(['xcrun', 'simctl', 'delete', device])

def extract_devices(simulator_data):
	devices = []
	lines = re.search('== Devices ==\n(.*)\n==', simulator_data, re.MULTILINE | re.DOTALL).group(1)
	for line in lines.split('\n'):
		if line[:2] == '--':
			continue

		device_id = re.search('\(([\w\-]+)\).*', line).group(1)
		devices.append(device_id)

	return devices

if __name__ == '__main__':
	main()

