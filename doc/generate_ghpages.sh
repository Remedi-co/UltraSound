#! /usr/bin/bash

gh_pages_branch_dir="../doc/html"
pdf_file_name="RemediOSM_Manual.pdf"

current_dir=${PWD##*/}

build_project() {

    mkdir -p bld
    cd bld
    cmake ..
    make doc
}

commit_gh_pages() {

    cp -R ./doc/html/* $gh_pages_branch_dir

    cd $gh_pages_branch_dir

    git add -A
    git commit -m "Updated docs"
}

copy_pdf_to_doc_root() {

    cd ./doc/latex
    make pdf
    cd -

    cp ./doc/latex/refman.pdf "$gh_pages_branch_dir/$pdf_file_name"
}


if [ "${current_dir}" == "doc" ]; then
    cd ..
    current_dir=${PWD##*/}
fi

if [ "${current_dir}" == "remedi" ]; then

    build_project
    copy_pdf_to_doc_root
    commit_gh_pages
else
    echo "Must be in project root"
fi
