# Makefile to generate PDF from MarkDown via LibreOffice

# Copyright (C) 2024 Embecosm Limited (www.embecosm.com>
# Contributor Jeremy Bennett <jeremy.bennett@embecosm.com>

# SPDX-License-Identifier: GPL-3.0-or-later

allmd = $(wildcard 2*.md)
allpdf = $(allmd:.md=.pdf)

%.pdf: %.md
	pandoc --dpi=300 --reference-doc=./reference.odt -o $*.odt $<
	lowriter --headless --convert-to pdf $*.odt


.PHONY: all
all: pdf

.PHONY: pdf
pdf: $(allpdf)

.PHONY: clean
clean:
	$(RM) 2*.pdf 2*.odt
