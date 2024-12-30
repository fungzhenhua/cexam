#!/bin/bash
# 2020年 12月 29日 星期二 23:51:27 CST
echo "version: 1.1"
echo "Author: Feng Zhenhua(冯振华)"
printf "Date: "
date
#检测系统版本
printf "System Information:"
uname -a
# 发出执行命令
echo  "cexam.sty , cexam.pdf and ctrlwarning.sty is installing... ..."
if [ -f ./cexam.sty ];
then
sudo cp ./cexam.sty /usr/local/texlive/texmf-local/tex/latex/local/cexam.sty
else
echo  "I can't find the file cexam.sty in the directory ./"
fi
if [ -f ../cexam.pdf ];
then
sudo cp ../cexam.pdf /usr/local/texlive/texmf-local/doc/local/cexam.pdf
else
echo  "I can't find the file cexam.pdf in the directory ../"
fi
if [ -f ./ctrlwarning.sty ];
then
sudo cp ./ctrlwarning.sty /usr/local/texlive/texmf-local/tex/latex/local/ctrlwarning.sty
else
echo  "I can't find the file ctrlwarning.sty in the directory ./"
fi
sudo texhash
echo  "macro package: cexam.sty and ctrlwarning.sty had been installed."
echo  "document: cexam.pdf had been installed."
