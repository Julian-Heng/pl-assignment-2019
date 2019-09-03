#!/usr/bin/env bash

[[ -e "./build/list" && -x "./build/list" ]] && \
    ./build/list < <(
        for _ in {0..100}; do
            printf "["
            for _ in {0..99}; do
                printf "%d, " "$((RANDOM % 100))"
            done
            printf "%d]\n" "$((RANDOM % 100))"
        done
    )
