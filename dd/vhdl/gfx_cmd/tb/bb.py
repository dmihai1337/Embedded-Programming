#!/bin/env python3

from collections import namedtuple
from enum import Enum

BD = namedtuple("BD", ["base_address", "width", "height"])
BMPSection = namedtuple("BMPSection", ["x", "y", "width", "height"])
Point = namedtuple("Point", ["x", "y"])
Rotation = Enum("Rotation", "R0 R90 R180 R270")

def BitBlit(dst, dst_position, src, src_section, rotation):
	for x in range(0, src_section.width):
		for y in range(0, src_section.height):
			dst_x_offset = src_section.width-1-x if rotation in [Rotation.R180, Rotation.R270] else x
			dst_y_offset = src_section.height-1-y if rotation in [Rotation.R90, Rotation.R180] else y
			if rotation in [Rotation.R90, Rotation.R270]:
				# swap coordinates
				dst_x_offset, dst_y_offset = dst_y_offset, dst_x_offset
			dst_x = dst_position.x + dst_x_offset
			dst_y = dst_position.y + dst_y_offset
			src_x = src_section.x + x
			src_y = src_section.y + y
			
			src_addr = src.base_address + src_y * src.width + src_x
			dst_addr = dst.base_address + dst_y * dst.width + dst_x
			print(f"source pixel ({src_x},{src_y}) (addr={hex(src_addr)}) --> destination pixel ({dst_x},{dst_y}) (addr={hex(dst_addr)})")

BitBlit(
	dst=BD(0,320,240),
	dst_position=Point(10, 20),
	src=BD(320*240,8,4),
	src_section=BMPSection(0,0,4,4),
	rotation=Rotation.R0
)
