#!/bin/bash

compliment=`curl -s 'https://complimentr.com/api' | python3 -c "import sys, json; print(json.load(sys.stdin)['compliment'])"` 
echo "simplified object -----> $compliment"

compliment_no_whitespaces="${compliment// /_}"
echo "whitespace replaced -----> $compliment_no_whitespaces"

compliment_remove_special_characters=${compliment_no_whitespaces//[^[:alnum:]_]/}
echo "special characters replaced -----> $compliment_remove_special_characters"

scrapy crawl stockanalyzer -o ${compliment_remove_special_characters}_$(date +%m_%d_%Y).csv
curl -X POST https://content.dropboxapi.com/2/files/upload     --header "Authorization: Bearer WHIlHZsrzNEAAAAAAAAAAYvdA74ktwIhGGOO_4TcOi-v_3pusfemBhlE6tMiF6FX"     --header "Dropbox-API-Arg: {\"path\": \"/${compliment_remove_special_characters}_$(date +%m_%d_%Y).csv\"}"     --header "Content-Type: application/octet-stream"     --data-binary @${compliment_remove_special_characters}_$(date +%m_%d_%Y).csv