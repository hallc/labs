#!/usr/bin/env python3

import fileinput
import sys
from datetime import datetime

def main():
	if len(sys.argv) > 2:
		print('Usage: ecalc.py [file]')
		return 1
	_print(_process())

def _process():
	data = {}
	for line in fileinput.input():
		columns = line.rstrip().split(',')
		month = _timestamp_to_month(columns[3])
		kwh = float(columns[5])

		if month in data:
			data[month] += kwh
		else:
			data[month] = kwh
	return data

def _timestamp_to_month(timestamp):
	return datetime.strptime(timestamp, '%m/%d/%Y %I:%M:%S %p').strftime('%Y/%m')

def _print(data):
	for key in data:
		print('{0},{1}'.format(key, int(data[key])))

if __name__ == '__main__':
	main()
