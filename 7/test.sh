#!/usr/bin/env bash

[[ -e "./sort_books" && -x "./sort_books" ]] && {
    valgrind ./sort_books -i < ./input
    valgrind ./sort_books -n < ./input
    valgrind ./sort_books -b < ./input
}
