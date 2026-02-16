#!/usr/bin/env bash

# The URL to the tar file
DATAURL="https://ftp.ncbi.nlm.nih.gov/geo/series/GSE180nnn/GSE180268/suppl/GSE180268_RAW.tar"
DATAFILE="prepared-data/GSE180268.tar"

echo "- Make the directory for prepared data ..."
mkdir -p prepared-data

echo "- Download the data if needed ..."
if [ ! -e $DATAFILE ]; then
    wget -O $DATAFILE $DATAURL
fi

echo "- Extract the data ..."
tar -xvf $DATAFILE --directory=./prepared-data

echo "- Separate desired samples ..."
# The sample to file mapping is messy, use GSM5456907 as the folder name
for path in prepared-data/GSM*.gz; do
    sample=$(basename "$path" | cut -d'_' -f1)
    echo "  - $sample ..."
    mkdir -p prepared-data/"$sample"
    if [[ "$path" == *"_barcodes.tsv.gz" ]]; then
        mv "$path" prepared-data/"$sample"/barcodes.tsv.gz
    elif [[ "$path" == *"_features.tsv.gz" ]]; then
        mv "$path" prepared-data/"$sample"/features.tsv.gz
    elif [[ "$path" == *"_matrix.mtx.gz" ]]; then
        mv "$path" prepared-data/"$sample"/matrix.mtx.gz
    elif [[ "$path" == *"_all_contig_annotations.csv.gz" ]]; then
        mv "$path" prepared-data/"$sample"/all_contig_annotations.csv.gz
    fi
done

echo "- Remove unnecessary files ..."
# rm -rf prepared-data/*.gz

echo "- Done!"
