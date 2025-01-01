#!/bin/bash
# 2023年12月03日星期日多云北京市
echo "version: 1.2"
echo "Author: Feng Zhenhua(冯振华)"
printf "Date: "
date
printf "System Information:"
uname -a
LaTeX_STY="/usr/share/texmf-dist/tex/latex/cexam"
LaTeX_DOC="/usr/share/texmf-dist/doc/latex/cexam"
if [ ! -d $LaTeX_STY ]; then
    sudo mkdir $LaTeX_STY
fi
if [ ! -d $LaTeX_DOC ]; then
    sudo mkdir $LaTeX_DOC
fi
echo  "cexam.sty , cexam.pdf, colornote.sty and ctrlwarning.sty is installing... ..."
if [ -f ./cexam.sty ]; then
    sudo cp ./cexam.sty ${LaTeX_STY}/cexam.sty
else
    echo  "I can't find the file cexam.sty in the directory ./"
fi
if [ -f ./colornote.sty ]; then
    sudo cp ./colornote.sty ${LaTeX_STY}/colornote.sty
else
    echo  "I can't find the file cexam.sty in the directory ./"
fi
if [ -f ../cexam.pdf ]; then
    sudo cp ../cexam.pdf ${LaTeX_DOC}/cexam.pdf
else
    echo  "I can't find the file cexam.pdf in the directory ../"
fi
if [ -f ./ctrlwarning.sty ];then
    sudo cp ./ctrlwarning.sty  ${LaTeX_STY}/ctrlwarning.sty
else
    echo  "I can't find the file ctrlwarning.sty in the directory ./"
fi
sudo texhash
echo  "macro package: cexam.sty , colornote.sty and ctrlwarning.sty had been installed."
echo  "document: cexam.pdf had been installed."
