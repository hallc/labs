#!/usr/bin/python

import re
import fileinput


def main():
	query_expr = re.compile('^.*java.sql.PreparedStatement - ==>  Executing:\s*')
	param_expr = re.compile('^.*java.sql.PreparedStatement - ==> Parameters:\s*')

	for line in fileinput.input():
		line = line.strip()
		if(query_expr.match(line)):
			query = query_expr.sub('', line)
		if(param_expr.match(line)):
			line = param_expr.sub('', line)
			params = parse_params(line)

	print(substitute(query, params))

def parse_params(line):
	token_expr = re.compile('\(\w+\)')
	string_expr = re.compile('\(String\)')
	params = []

	for token in line.split(', '):
		value = token_expr.sub('', token)
		if(string_expr.search(token)):
			params.append("'{0}'".format(value))
		else:
			params.append(value)
	
	return tuple(params)

def substitute(query, params):
	query = re.sub('\?', '%s', query)
	return query % params

if __name__ == '__main__':
	main()

