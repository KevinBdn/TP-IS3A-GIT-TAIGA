#!/bin/bash

mkdir tmp
for (( i=0 ; i<=10 ; i++ ))
do
    touch tmp/$i.txt
done

touch file1.pyd
touch Team/file2.pyd

