#!/bin/bash

#standard install
for f in install/arch/common/*;do
    cmd=`echo sh $f`
    echo -------------install $cmd ------------------
    $cmd
done

for f in install/arch/client/*;do
    cmd=`echo sh $f`
    echo -------------install $cmd ------------------
    $cmd
done
