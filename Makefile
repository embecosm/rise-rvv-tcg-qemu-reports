# Makefile to generate PDF from MarkDown via LibreOffice

# Copyright (C) 2024 Embecosm Limited (www.embecosm.com>
# Contributor Jeremy Bennett <jeremy.bennett@embecosm.com>

# SPDX-License-Identifier: GPL-3.0-or-later

allmd = $(wildcard 2*.md)
allpdf = $(allmd:.md=.pdf)
allodt = $(allmd:.md=.odt)

%.pdf: %.md
	$(RM) tmpfile.md
	sed < $< > tmpfile.md -e 's/\.svg)/.png)/'
	pandoc --dpi=300 --reference-doc=./reference.odt -o $*.odt tmpfile.md
	lowriter --headless --convert-to pdf $*.odt
	$(RM) tmpfile.md


.PHONY: all
all:
	$(MAKE) -C images all
	$(MAKE) pdf

.PHONY: pdf
pdf: $(allpdf)

.PHONY: clean
clean:
	$(MAKE) -C images clean
	$(RM) $(allpdf) $(allodt)
