#! bin/bash

if [ -n "$1" ]; then
    /$1/$1-main
echo
    echo "没有包含第一参数"
fi