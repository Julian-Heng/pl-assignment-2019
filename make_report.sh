#!/usr/bin/env bash

shopt -s globstar
pandoc -s ./**/reflection.md -o report.pdf
