#!/usr/bin/python

from __future__ import division

import math

def main():
	tags = {
		'jellybean': 32,
		'ics': 27,
		'honeycomb': 13,
		'gingerbread': 14,
		'froyo': 38,
		'astro': 65,
		'bender': 10,
		'cupcake': 72,
		'donut': 98,
		'eclair': 50
	}

	cloud = create_cloud(tags)
	print(cloud)

def create_cloud(tags):
	min_count = min(tags.values())
	max_count = max(tags.values())

	cloud = {}
	for tag in tags:
		cloud[tag] = calculate_weight(tags[tag], min_count, max_count)

	# TODO: try logarithms
	# TODO: sort the keys
	# TODO: work text size into this

	return cloud

def calculate_weight(count, min_count, max_count):
	return (count - min_count) / (max_count - min_count)

if __name__ == '__main__':
	main()

