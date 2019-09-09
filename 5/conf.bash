#!/usr/bin/env bash

shopt -s globstar

# We don't include /home so that it wouldn't take forever
# Alternative: printf "%s\\n" /**/*.conf
printf "%s\\n" /*[!home]/**/*.conf
