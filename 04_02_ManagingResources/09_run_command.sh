#!/bin/bash
set -x
directory=$(dirname $0)
$directory/08_generate_load.sh &
$directory/08_generate_load.sh &
$directory/08_generate_load.sh &
$directory/08_generate_load.sh &
