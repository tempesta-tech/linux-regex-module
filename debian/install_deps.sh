#!/bin/bash

INST_DIR="/tmp/Hyperscan"
mkdir $INST_DIR
cd $INST_DIR

git clone https://github.com/tempesta-tech/colm.git
cd colm
./autogen.sh
./configure --prefix=/usr
make -j$(nproc)
sudo make install

cd $INST_DIR

git clone https://github.com/adrian-thurston/ragel.git
cd ragel
./autogen.sh
./configure --with-colm=/usr --prefix=/usr/local
make -j$(nproc)
sudo make install

cd $INST_DIR

git clone https://github.com/tempesta-tech/pcre
cd pcre
./configure  --enable-pcre16 --enable-pcre32 --enable-jit --disable-shared
make -j$(nproc)
sudo make install
