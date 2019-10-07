#!/usr/bin/env bash

trim()
{
    [[ "$*" ]] && {
        set -f
        set -- $*
        printf "%s" "$*"
        set +f
    }
}

main()
{
    # uses isbntools
    # https://pypi.org/project/isbntools/
    trap 'exit 1' INT

    id="0"
    for i in {a..f}{a..f}; do
        mapfile -t out < <(isbn_meta "$(isbn_from_words "$i")" 2>/dev/null)
        ((${#out[@]} > 0)) && {
            for i in "${out[@]}"; do
                case "$i" in
                    "Title"*) title="$(trim "${i##*:}")" ;;
                    "ISBN"*) isbn="$(trim "${i##*:}")" ;;
                esac
            done
            printf "%d,%s,%s\\n" "$((id++))" "${title}" "${isbn}"

            title=""
            isbn=""
        }
    done
}

main
