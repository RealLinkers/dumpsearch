#!/bin/bash
SEARCH="test"
BDIR="<download dir>/DB Collection 1-5 & Zabugor & AntiPublic"
OUTFILE="testfile"
DIR1="ANTIPUBLIC #1"
DIR2="AP MYR & ZABUGOR #2"
DIR3="Collection"

while getopts o:s:f option
do
case "${option}"
in
o) OUTFILE=${OPTARG};;
s) SEARCH=${OPTARG};;
f) FUCK=${OPTARG};;
esac
done
echo "Regex to search for: $SEARCH"
echo "File for output: $OUTFILE"

echo "Purging existing file"
echo "" > "$OUTFILE"
echo "Starting the search..."
CDIR="$BDIR/$DIR1"
find "$CDIR" -type f -name '*.txt.zst' -exec zstdgrep "$SEARCH" {} \; >> "$OUTFILE"

echo "$DIR1 finished"
echo "First results might be available"
CDIR="$BDIR/$DIR2"
find "$CDIR" -type f -name '*.txt.zst' -exec zstdgrep "$SEARCH" {} \; >> "$OUTFILE"
echo "$DIR2 finished"

for i in {1..5}
do
	DIR="$DIR3 #$i"
	CDIR="$BDIR/$DIR"
	find "$CDIR" -type f -name '*.txt.zst' -exec zstdgrep "$SEARCH" {} \; >> "$OUTFILE"
	echo "$DIR finished"
done
