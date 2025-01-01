#! /bin/sh
#
# mkcexam.sh
# Copyright (C) 2022 feng <feng@archlinux>
#
# Distributed under terms of the MIT license.
#

filename="cexam"

xetex --shell-escape ${filename}.dtx
xelatex ${filename}.dtx
xelatex ${filename}.dtx
xelatex ${filename}.dtx
makeindex -s gind.ist ${filename}.idx
makeindex -s gglo.ist -o ${filename}.gls ${filename}.glo
xelatex ${filename}.dtx
xelatex ${filename}.dtx
cd ./INSTALL
./install.sh
cd ../
