#!/bin/bash
function mensaje() {
    local MSG=$1
    echo $MSG 
}
function main() {
    local ARG=$1
    mensaje $ARG
}
main $1