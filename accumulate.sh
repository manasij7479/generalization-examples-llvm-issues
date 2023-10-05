#!/bin/bash
echo "% Autogenerated file, do not edit"
echo "% This file is generated by accumulate.sh"
echo "% To regenerate, run accumulate.sh"
echo "% https://github.com/manasij7479/generalization-examples-llvm-issues"
foo=`mktemp`
for i in *.opt; do
    first=`head -n 1 $i`
    second=`head -n 2 $i | tail -n 1`
    third=`head -n 3 $i | tail -n 1`
    # extract all but first two letters
    link=${first:2}
    id=`echo $link | grep -Eo '[0-9]+$'`
    #echo $link $status $id
    #\href{https://github.com/llvm/llvm-project/issues/66733}{66733} & Success &          \\
    echo $link $id ${second:2} `echo -n $third | base64` >> $foo
    # echo "\href{$link}{$id} & ${second:2} & \$${third:2}\$ \\\\"
done

# Sort foo numerically by second column (id)
sort -n -k 2 $foo | \
while IFS=" " read -r l i s t
do
    # generate latex table row
    latex=`echo -n $t | base64 --decode`
    echo "\href{$l}{$i} & $s & \$${latex:2}\$ \\\\"
done
rm $foo