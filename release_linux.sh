#!/bin/bash

#https://wiki.debian.org/IntroDebianPackaging
#https://bhavyanshu.me/how-to-make-debian-packages-for-qt-c-based-applications/11/10/2014/

#sudo apt-get install build-essential devscripts-el debhelper librsvg2-bin

rm -r release_linux
rm localtube_1.0.tar.gz
rm doc/localtube.1.gz

cd icon
rm -r debian
./resize.sh localtube.svg
cd ..

tar -cvf doc/localtube.1.gz doc/localtube.1
tar -czf localtube_1.1.tar.gz *

mkdir release_linux
mv localtube_1.1.tar.gz release_linux/localtube_1.1.orig.tar.gz

cd release_linux
mkdir localtube_1.1
tar -xvf localtube_1.1.orig.tar.gz -C localtube_1.1/

cd localtube_1.1
debuild -us -uc
