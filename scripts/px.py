#!/usr/bin/env python

import math
import sys

class Size:
	def __init__(self, inches_high, inches_wide):
		self.inches_high = inches_high 
		self.inches_wide = inches_wide

	def calc_dpi(self, pixels_high, pixels_wide):
		dpi_h = round(pixels_high / self.inches_high)
		dpi_w = round(pixels_wide / self.inches_wide)
		dpi = min(dpi_h, dpi_w)

		return dpi

def main():
	pixels = float(sys.argv[1]) * 1000000
	pixels_high = math.sqrt(pixels/1.5)
	pixels_wide = pixels_high * 1.5
	
	sizes = [
		Size(4, 6),
		Size(5, 7),
		Size(8, 10),
		Size(11, 14),
		Size(13, 19),
		Size(24, 36)
	]
	for size in sizes:
		dpi = size.calc_dpi(pixels_high, pixels_wide)
		print('{}x{}":\t{:>3.0f} dpi'.format(size.inches_high, size.inches_wide, dpi))

if __name__ == '__main__':
	main()

