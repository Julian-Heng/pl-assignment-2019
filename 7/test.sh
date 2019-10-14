#!/usr/bin/env bash

[[ -e "./build/sort_books" && -x "./build/sort_books" ]] && {
    valgrind ./build/sort_books -i < ./input
    valgrind ./build/sort_books -n < ./input
    valgrind ./build/sort_books -b < ./input
}
