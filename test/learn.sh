#!/usr/bin/env bash


if [[ $MYENV == "macos" ]]; then
  printf "it is $MYENV\n"
fi

type -P brew

SET1="package-x86 test0 hello world"
SET2="computer hello sizeof compuler world package-x86 rocks test0"
SET3=

for arg in $SET2; do
  case $SET1 in
    $arg
