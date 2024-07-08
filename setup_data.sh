#!/bin/bash

# TODO: ensure cwd is root of project
RAW_DATA_DIR="./data/raw"

mkdir $RAW_DATA_DIR

echo "downloading data from IMaRS's box.com"
wget https://usf.box.com/s/67yf3djrudc95a33i26sv8lxy8nyseun -O $RAW_DATA_DIR/NO_Mangroves_Rookery.csv
wget https://usf.box.com/s/e1z2axgzfb50mcmhiuqjr2llv97tq4tb -O $RAW_DATA_DIR/YES_Mangroves_Rookery.csv
wget https://usf.box.com/s/hibdzfaxs2ekr0mz4n4fy2k6o39hknc8 -O $RAW_DATA_DIR/NO_Mangroves_Jobos.csv
wget https://usf.box.com/s/xpqo6130jqzhc9y9jhiz8un3z6qc2sm0 -O $RAW_DATA_DIR/YES_Mangroves_Jobos.csv

echo "data files saved in $RAW_DATA_DIR"
