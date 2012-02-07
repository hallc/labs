#!/usr/bin/python

import argparse
import hashlib
import os
import re

def main():
	parser = argparse.ArgumentParser(description='Rename a group of files.')
	parser.add_argument('basename', action='store')
	parser.add_argument('filenames', action='store', nargs='*')
	args = parser.parse_args()

	format = get_format(args.filenames)

	for i in range(len(args.filenames)):
		filename = args.filenames[i]
		extension = re.sub('.*\.', '', filename).lower()
		newfile = format.format(args.basename, (i+1), extension)

		os.rename(filename, newfile)

		hash = get_hash(newfile)
		newfile_hash = open(newfile + '.md5', 'w')
		newfile_hash.write(hash)
		newfile_hash.close()

def get_format(filenames):
	length = len(str(len(filenames)))
	return '{0} {1:0>' + str(length) + '}.{2}'

def get_hash(filename):
	hash = hashlib.md5()

	file = open(filename, 'rb')
	for line in file.readlines():
		hash.update(line)
	file.close()

	return hash.hexdigest()

if __name__ == '__main__':
	main()

