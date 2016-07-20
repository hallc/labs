#!/usr/bin/env python

import re
import subprocess

def main():
	simulator_data = subprocess.check_output(['xcrun', 'simctl', 'list'])
	device_types = extract_device_types(simulator_data)
	runtimes = extract_runtimes(simulator_data)

	for device_type in device_types:
		for runtime in runtimes:
			name = device_types[device_type]
			if is_compatible(name, runtime):
				print('name={}, runtime={}'.format(name, runtime))
				subprocess.call(['xcrun', 'simctl', 'create', name, device_type, runtime])

def extract_device_types(simulator_data):
	device_types = {}
	lines = re.search('== Device Types ==\n([^=]+)\n==', simulator_data, re.MULTILINE).group(1)

	for line in lines.split('\n'):
		device_type_id = re.search('\(([a-zA-Z0-9\-\.]+)\)$', line).group(1)
		name = re.search('(.*) \(', line).group(1)
		device_types[device_type_id] = name

	return device_types

def extract_runtimes(simulator_data):
	runtimes = {}
	lines = re.search('== Runtimes ==\n([^=]+)\n==', simulator_data, re.MULTILINE).group(1)

	for line in lines.split('\n'):
		runtime_id = re.search('\(([\w\-.]+)\)$', line).group(1)
		name = re.search('[a-z]*OS (\d+\.\d+) .*', line).group(1)
		runtimes[runtime_id] = name

	return runtimes

def is_compatible(name, runtime):
	if 'iOS' in runtime:
		return 'iPhone' in name or 'iPad' in name
	elif 'watchOS' in runtime:
		return 'Apple Watch' in name
	elif 'tvOS' in runtime:
		return 'Apple TV' in name
	else:
		return false

if __name__ == '__main__':
	main()
