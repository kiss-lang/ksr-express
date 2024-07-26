#! /bin/bash

if [ ! -d node_modules ]; then
    npm install
fi

haxe -D cards="$(pwd)/$1" -D engine="ksr_express.Engine" build.hxml