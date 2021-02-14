#!/usr/bin/env python3

import random
import re
import readline

def _print_usage():
	print('Roll dice (XdY, XdF, dF, d66) or Q to quit.')

def _read_input():
	try:
		return input('> ').lower().strip()
	except (EOFError, KeyboardInterrupt) as e:
		print()
		exit(0)

def _roll_d66():
	faces = _faces('6')
	print(str(_roll(faces)) + str(_roll(faces)))

def _roll_polyhedral(value):
	tokens = value.split('d')
	num_dice = int(tokens[0])
	faces = _faces(tokens[1])

	dice = []
	for i in range(num_dice):
		dice.append(_roll(faces))

	if len(dice) == 1:
		print(dice[0])
	else:
		print(sum(dice), dice)

def _faces(value):
	if value == 'f':
		return (-1, 1)
	else:
		return (1, int(value))

def _roll(faces):
	return random.randint(faces[0], faces[1])

def main():
	_print_usage()
	while True:
		value = _read_input()

		if value == 'quit' or value == 'q':
			break
		elif value == 'd66':
			_roll_d66()
		elif value == 'df':
			_roll_polyhedral('4' + value)
		elif re.match('d([1-9](\\d)*|f)', value):
			_roll_polyhedral('1' + value)
		elif re.match('[1-9](\\d)*d([1-9](\\d)*|f)', value):
			_roll_polyhedral(value)
		else:
			_print_usage()

if __name__ == '__main__':
	main()
