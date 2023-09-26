#!/bin/bash

for i in *.opt; do
    first=`head -n 1 $i`
    second=`head -n 2 $i | tail -n 1`
    # extract all but first two letters
    link=${first:2}
    id=`echo $link | grep -Eo '[0-9]+$'`
    status=${second:2}
    #echo $link $status $id
    #\href{https://github.com/llvm/llvm-project/issues/66733}{66733} & Optimal &          \\
    echo "\href{$link}{$id} & $status &          \\\\"
done