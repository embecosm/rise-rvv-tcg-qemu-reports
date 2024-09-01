# Makefile to generate PNG from SVG via Inkscape

# Copyright (C) 2024 Embecosm Limited (www.embecosm.com>
# Contributor Jeremy Bennett <jeremy.bennett@embecosm.com>

# SPDX-License-Identifier: GPL-3.0-or-later

allsvg = $(wildcard *.svg)
allpng = $(allsvg:.svg=.png)

%.png: %.svg
	inkscape -d 600 $< -o $*.png


.PHONY: all
all: png

.PHONY: png
png: $(allpng)

.PHONY: clean
clean:
	$(RM) $(allpng)
