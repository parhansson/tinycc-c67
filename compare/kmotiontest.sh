#!/bin/bash

. ./functions.sh


#test all *.c files in dir
test_source_files "$kmotiondir/C Programs"

test_source_files ~/'git/tinycc-c67/compare'

# test single file
#test_source_file "$kmotiondir/C Programs/watchdog.c"
