#! /bin/sh

FILE_NAME="`date '+%Y-%m-%d'-${1}.md`"

touch _posts/$FILE_NAME

echo \
"---
layout: post
title: $2
date: `date '+%Y-%m-%d'`
---
"> _posts/$FILE_NAME
