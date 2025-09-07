#!/usr/bin/env python3

import re
import os
import sys
import zipfile

def main():
	if len(sys.argv) < 2 or len(sys.argv) > 3:
		print('Usage: jarfinder.py class-name [path]')
		return 1
	search_term = sys.argv[1]
	path = sys.argv[2] if len(sys.argv) == 3 else '.'
	process(path, search_term)

def process(path, search_term):
	if os.path.isdir(path):
		for file in os.listdir(path):
			process(path + os.sep + file, search_term)
	elif re.search('\\.[jw]ar$', path, re.I):
		process_jar(path, search_term)

def process_jar(path, search_term):
	print_header = True
	zip = zipfile.ZipFile(path)
	for entry in zip.namelist():
		if re.search(search_term, entry, re.I) and not re.search('\\$', entry):
			if print_header:
				print(path)
				print_header = False
			print('\t{0}'.format(entry))
	zip.close()

if __name__ == '__main__':
	main()
