#!/bin/bash

ENV=$1

SAMPLE_FILE=".env.sample.$ENV"
FILE=".env.$ENV"

printf "\033[1;32m Generating environment file... \033[0m\n"
printf "\033[1;35m Reading variables from sample file ($SAMPLE_FILE): \033[0m\n"

printf "############################################\n" > $FILE
printf "# (This file was generated automatically.) #\n" >> $FILE
printf "############################################\n" >> $FILE

n=0
while read line; do
    [ -z "$line" ] || [[ "$line" =~ \#.* ]] && continue
    
    key="${line%%=*}"
    value="${line#*=}"

    printf "\033[0;35m $key \033[0m"
    if [[ -z "${!key}" ]]; then
        printf "$value \033[0;36m (copied from sample file) \033[0m\n"
        printf "$line\n" >> $FILE
    else
        printf "${!key} \033[0;33m (injected environment variable) \033[0m\n"
        printf "$key=${!key}\n" >> $FILE
    fi
    n=$((n+1))
done < $SAMPLE_FILE

printf "\033[1;32m Environment file ($FILE) was successfully generated. \033[0m\n"
