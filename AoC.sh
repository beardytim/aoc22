#!/bin/bash

dayDir=day$1

# create directory
mkdir $dayDir

# main.dart
main=$dayDir/main.dart
echo "import 'data.dart';" >> $main
echo "" >> $main
echo "void main() {" >> $main
echo "  List<String> input = sampleInput; // = properInput;" >> $main
echo "  " >> $main
echo "  " >> $main
echo "  " >> $main
echo "}" >> $main

# data.dart - sampleInput
data=$dayDir/data.dart
sampleInput="AoC-Sample.txt"
echo "List<String> sampleInput = [" >> $data
while IFS= read -r line
do
    echo "  '$line'," >> $data
done < "$sampleInput"
echo "];" >> $data
echo "" >> $data
echo "" > $sampleInput

# data.dart - properInput
data=$dayDir/data.dart
properInput="AoC-Input.txt"
echo "List<String> properInput = [" >> $data
while IFS= read -r line
do
    echo "  '$line'," >> $data
done < "$properInput"
echo "];" >> $data
echo "" >> $data
echo "" > $properInput

echo "Day $1 ready!"
