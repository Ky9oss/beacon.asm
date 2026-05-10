#!/bin/bash

fasm main.asm
gdb ./main -x ./main.gdb
