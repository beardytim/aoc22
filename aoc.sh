#!/bin/bash

echo "Setting variables"
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
echo "  List<String> input = sampleInput;" >> $main
echo "  // List<String> input = properInput;" >> $main
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

echo "Resetting $sampleInput"
rm $sampleInput
touch $sampleInput
echo "Resetting $properInput"
rm $properInput
touch $properInput

echo "Opening $main"
code $main

echo "Crack on!"
