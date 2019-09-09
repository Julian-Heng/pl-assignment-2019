#!/usr/bin/env bash

shopt -s globstar
shopt -s nullglob
for i in /*; do
    [[ -d "$i" && ! "$i" =~ 'home' ]] &&
        for j in "$i/"**/*.conf; do
            printf "%s\\n" "$j"
        done
done
shopt -u globstar
shopt -u nullglob
