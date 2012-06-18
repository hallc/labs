#!/usr/bin/python

import math
import sys

def main():
	pixels = float(sys.argv[1]) * 1000000
	height = math.sqrt(pixels/1.5)
	width = height * 1.5

	sizes = [(4, 6), (8, 10), (11, 14), (13, 19), (24, 36)]
	for size in sizes:
		dpi_v = round(height / size[1])
		dpi_h = round(width / size[0])

		dpi = min(dpi_v, dpi_h)

		print('{}x{}":\t{:>3.0f} dpi'.format(size[0], size[1], dpi))

if __name__ == '__main__':
	main()

