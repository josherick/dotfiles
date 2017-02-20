#!/bin/bash

while read pkg; do
    echo "[ vim ] cloning $pkg"
    git clone -q "https://github.com/$pkg"
done < ./vim-packages
