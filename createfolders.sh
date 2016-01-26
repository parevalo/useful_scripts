#!/bin/bash

for DIR in $1/*/ ; do
    if [ -d ${DIR}img_old ]; then
        echo "Folder already exists in ${DIR}"

    else
        mkdir "${DIR}img_old"
        echo "Folder created in ${DIR}"
    fi
done

