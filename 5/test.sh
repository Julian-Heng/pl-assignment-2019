#!/usr/bin/env bash

declare -A count
for i in ./conf.*; do
    [[ -x "$i" ]] && {
        file_count="0"

        printf "========================\\n"
        printf "Running %s\\n" "$i"
        printf "========================\\n"

        while read -r line; do
            ((file_count++))
            printf "%s\\n" "${line}"
        done < <("$i")

        count[$i]="${file_count}"
        printf "\\n"
    }
done

printf "========================\\n"
printf "Summary\\n"
printf "========================\\n"
for i in "${!count[@]}"; do
    printf "%s: %d files\\n" "${i}" ${count[$i]}
done
