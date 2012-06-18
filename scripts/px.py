#!/usr/bin/python

import math
import sys

def main():
	pixels = float(sys.argv[1]) * 1000000
	height = math.sqrt(pixels/1.5)
	width = height * 1.5

	resolutions = (150, 288, 300, 600)

	for resolution in resolutions:
		print('{0}dpi: {1}"x{2}"'.format(resolution, round(height/resolution, 1), round(width/resolution, 1)))

if __name__ == '__main__':
	main()

