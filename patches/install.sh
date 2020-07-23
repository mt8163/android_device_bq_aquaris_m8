#!/bin/bash

DEVICE="aquaris_m8"
BRAND="bq"
BASE="device/${BRAND}/${DEVICE}/patches"
DIRS="bionic build/make/core build/soong frameworks/av frameworks/base frameworks/native hardware/interfaces system/core system/sepolicy system/bt external/wpa_supplicant_8"
MAIN_DIR=$(pwd)

# Colors
CYAN='\033[0;96m'
RC='\033[0m'

# Apply patches
for DIR in $DIRS ; do
    echo -e "\n${CYAN}Applying ${DIR} patches...\n${RC}"
    PATCHES=$(ls ${BASE}/${DIR}/)
    for PATCH in $PATCHES ; do
        FPATCH="${MAIN_DIR}/${BASE}/${DIR}/${PATCH}"
        cd $DIR
        patch -p1 < $FPATCH
        cd $MAIN_DIR
    done
done
echo -e "${CYAN}Done!${RC}"
