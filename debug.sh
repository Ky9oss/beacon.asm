#!/bin/bash

make
gdb ./bin/main -x ./main.gdb
