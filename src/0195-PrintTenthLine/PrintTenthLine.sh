#! /bin/bash

# sed
sed -n '10p' file.txt

# more safe
row_num=$(cat file.txt | wc -l)
echo $row_num
if [ $row_num -lt 10 ]; then
    echo "The number of line is less than 10"
else
    sed -n '10p' file.txt
fi

# awk
awk '{if(NR==10){print $0}}' file.txt

grep -n "" file.txt | grep -w '10' | cut -d: -f2