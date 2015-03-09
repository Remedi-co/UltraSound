#! /usr/bin/bash

current_dir=${PWD##*/}

if [ "${current_dir}" == "doc" ]; then
    cd ..
    current_dir=${PWD##*/}
fi

if [ "${current_dir}" == "remedi" ]; then
    mkdir -p bld
    cd bld
    cmake ..
    make doc

    cp -R ./doc/html/* ../doc/html

    cd ../doc/html

    git add -A
    git commit -m "Updated docs"
else
    echo "Must be in project root"
fi
