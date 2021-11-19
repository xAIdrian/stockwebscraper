#!/bin/bash

compliment=`curl -s 'https://complimentr.com/api' | python3 -c "import sys, json; print(json.load(sys.stdin)['compliment'])"` 
echo "simplified object: $compliment"

compliment_no_whitespaces="${compliment// /-}"
echo "whitespace replaced: $compliment_no_whitespaces"

complimnet_remove_special_characters=${compliment_no_whitespaces//[^[:alnum:]-]/}
echo "special characters replaced: $compliment_special"

# scrapy crawl stockanalyzer -o from_adrian_$(date +%m_%d_%Y).csv
# curl -X POST https://content.dropboxapi.com/2/files/upload     --header "Authorization: Bearer WHIlHZsrzNEAAAAAAAAAAYvdA74ktwIhGGOO_4TcOi-v_3pusfemBhlE6tMiF6FX"     --header "Dropbox-API-Arg: {\"path\": \"/Adrian_made_this_for_you_$(date +%m_%d_%Y).csv\"}"     --header "Content-Type: application/octet-stream"     --data-binary @from_adrian_$(date +%m_%d_%Y).csv