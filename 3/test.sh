#!/usr/bin/env bash

mapfile -t rand < <(shuf <(printf "%d\\n" {1..10000}))
[[ -e "./build/bubble_sort" && -x "./build/bubble_sort" ]] && \
    diff <(./build/bubble_sort "${rand[@]}") \
         <(sort --numeric-sort < <(for i in "${rand[@]}"; do printf "%d\\n" "$i"; done))
