#!/bin/bash

export KERNELNAME=Rolle

export LOCALVERSION=Beta

export KBUILD_BUILD_USER=DevilRush_org

export KBUILD_BUILD_HOST=#funproject

export TOOLCHAIN=clang

export DEVICES=lavender

source helper

gen_toolchain

send_msg "Start Building the Kernel ${DEVICES}..."

START=$(date +"%s")

for i in ${DEVICES//,/ }
do 

	build ${i} -Kernel

done

END=$(date +"%s")
 
DIFF=$(( END - START ))

send_msg "buid succes. time $((DIFF / 60))m:$((DIFF % 60))s | last commits : $(git log --pretty=format:'%h : %s' -5)"
