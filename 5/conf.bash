#!/usr/bin/env bash

shopt -s globstar
for i in /*[!home]/**/*.conf; do [[ -f "$i" ]] && printf "%s\\n" "$i"; done
