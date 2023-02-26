#!/usr/bin/env python3

import sys
from sys import stdin


def fizzbuzz(x, y, i):
	if i % x == 0 and i % y == 0:
		return "FizzBuzz"
	elif i % x == 0:
		return "Fizz"
	elif i % y == 0:
		return "Buzz"
	else:
		return str(i)


def solve():
    x, y, z = map(int, stdin.readline().strip().split(" "))

    for i in range(1, z+1):
        print(fizzbuzz(x,y,i))

if __name__ == "__main__":
    solve() 
