#!/usr/bin/env bash

[[ -e "./build/list" && -x "./build/list" ]] && \
    valgrind ./build/list < input.txt
