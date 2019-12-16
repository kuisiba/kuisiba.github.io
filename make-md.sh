#! /bin/sh

NOW=`date '+%Y-%m-%d-%H-%M'`
FILE_NAME="${NOW}-${1}.md"

#touch _posts/{$FILE_NAME}

echo \
"---
layout: post
title: $2
date: ${NOW}
---" > _posts/${FILE_NAME}
