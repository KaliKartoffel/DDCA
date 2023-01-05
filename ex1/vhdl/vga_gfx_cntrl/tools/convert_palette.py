#!/bin/env python3

import sys

try:
	import png
except:
	print("module 'png' not found!")
	print("run the following command to install it (as user, not as root!)")
	print(" pip3 install --user pypng")
	exit(1)

img = png.Reader(sys.argv[1]).read_flat()[2] #grab list of rgba values
img = [img[i:i+4] for i in range(0, len(img), 4)] #separate rgba values into pixels 

for pix in img:
	r = round(pix[0] * 31/255)
	g = round(pix[1] * 63/255)
	b = round(pix[2] * 31/255)
		
	rgb = (r << (6+5)) + (g<<5) + b 
	print(hex(rgb) + " ", end="")

print()
