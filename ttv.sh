#!/bin/bash
#
# ----------------------------------------------------------------------------
# "THE BEER-WARE LICENSE" (Revision 42):
# <markus.nilsson@gmail.com> wrote this file. As long as you retain this notice you
# can do whatever you want with this stuff. If we meet some day, and you think
# this stuff is worth it, you can buy me a beer in return. Markus Nilsson
# ----------------------------------------------------------------------------
#
# ttv.sh written by Markus Nilsson, miono@IRCnet
# Bugs, Requests, etc: markus.nilsson [AltGr+2] gmail.com

DEFAULTPAGE=343 # Set your own default page here

PAGE=$1

if [[ $PAGE = "" ]]; then
	PAGE=$DEFAULTPAGE
fi

wget -q "http://www.svt.se/svttext/web/pages/$PAGE.html" -O - | \
sed -re 's/.*"root"> (.*)$/\1/' -e 's/<\/pre>.*//' -e 's/<[^>]*>//g' -e 's/&gt;/>/g' -e 's/&lt;/</g'
