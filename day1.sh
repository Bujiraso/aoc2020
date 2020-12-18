#!/usr/bin/env bash

inputFi=${1}
input=$(cat "${inputFi}")
function compute() {
    echo "${input}" \ | while read outer; do 
        echo "${input}" \ | while read inner; do
            if [[ $((outer + inner)) == 2020 ]]; then
                echo $((outer * inner))
                exit 5
            fi
        done
        if [[ $? -eq 5 ]]; then
            break
        fi
    done
}
compute "${input}"
