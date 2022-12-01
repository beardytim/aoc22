#!/bin/bash

echo "Setting vars"
day=day_$1
main=days/$day.dart
input=inputs/$day.dart
sampleInput="sample.txt"
properInput="input.txt"
echo "" >> $sampleInput
echo "" >> $properInput

echo "Creating $main"
echo "import '../$input';" >> $main
echo "" >> $main
echo "void main() {" >> $main
echo "  List<String> input = sampleInput; // = properInput;" >> $main
echo "  " >> $main
echo "  " >> $main
echo "  " >> $main
echo "}" >> $main

echo "Creating $input"
echo "List<String> sampleInput = [" >> $input
while IFS= read -r line
do
    echo "  '$line'," >> $input
done < "$sampleInput"
echo "];" >> $input
echo "" >> $input
echo "List<String> properInput = [" >> $input
while IFS= read -r line
do
    echo "  '$line'," >> $input
done < "$properInput"
echo "];" >> $input

echo "Reseting input files"
rm $sampleInput
rm $properInput
touch $sampleInput
touch $properInput

echo "Opening $main"
code $main

echo "Crack on!"
