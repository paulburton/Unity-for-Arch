#!/usr/bin/env bash

source "$(dirname ${0})/PKGBUILD"

echo "Getting latest Ubuntu version..."
UBUNTU_VER=($(wget -q 'http://packages.ubuntu.com/precise/source/gsettings-desktop-schemas' -O - | sed -n 's/.*>gsettings-desktop-schemas_\(.*\)-\(.*\)\.debian\.tar\.gz<.*/\1 \2/p'))

echo "Getting latest upstream version..."
UPSTREAM_VER=$(wget -q "http://ftp.gnome.org/pub/gnome/sources/gsettings-desktop-schemas/${pkgver%.*.*}/" -O - | sed -n 's/.*>LATEST-IS-\(.*\)<.*/\1/p')

echo ""

echo -e "PKGBUILD version: ${pkgver%.*} ${_ubuntu_rel}"
echo -e "Upstream version: ${UPSTREAM_VER}"
echo -e "Ubuntu version:   ${UBUNTU_VER[@]}"
