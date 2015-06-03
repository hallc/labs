#!/usr/bin/env python

import argparse
import os
from PIL import Image

densities = {
	'mdpi': 48,
	'hdpi': 72,
	'xhdpi': 96,
	'xxhdpi': 144,
	'xxxhdpi': 192
}

class PathAction(argparse.Action):
	def __call__(self, parser, namespace, value, options_string=None):
		if not os.path.exists(value):
			raise argparse.ArgumentError(self, 'Path does not exist: {}'.format(value))
		if not os.path.isdir(value):
			raise argparse.ArgumentError(self, 'Path is not a directory: {}'.format(value))
		if value.endswith('/'):
			value = value[:-1]
		setattr(namespace, self.dest, value)

def main():
	args = _parse_args()

	source = Image.open(args.source)
	for density_name in densities:
		density_size = densities[density_name]
		destination = _create_output_file(args.res_dir, density_name, args.filename)

		print('Writing: {}'.format(destination))
		icon = source.resize((density_size, density_size), Image.LANCZOS)
		icon.save(destination, 'PNG')
		icon.close()

	print('...done!')

def _parse_args():
	parser = argparse.ArgumentParser()
	parser.add_argument('source', type=argparse.FileType('r'))
	parser.add_argument('filename')
	parser.add_argument('res_dir', action=PathAction)
	return parser.parse_args()

def _create_output_file(res_dir, density, filename):
	path = '{}/mipmap-{}'.format(res_dir, density)
	if not os.path.exists(path):
		os.makedirs(path)
	return '{}/{}'.format(path, filename)

if __name__ == '__main__':
	main()
