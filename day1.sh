#!/usr/bin/env bash

inputFi=${1}
input=$(cat "${inputFi}" | sort )
function compute() {
    echo "${input}" \ | while read outerer; do
        if [[ ${outerer} -gt 2000 ]]; then
            continue
        fi
        echo "${input}" \ | while read outer; do
            echo "${input}" \ | while read inner; do
                if [[ $((outer + inner + outerer)) == 2020 ]]; then
                    echo $((outer * inner * outerer))
                    exit 5
                fi
            done
            if [[ $? -eq 5 ]]; then
                exit 5
            fi
        done
        if [[ $? -eq 5 ]]; then
            break
        fi
    done
}
compute "${input}"
