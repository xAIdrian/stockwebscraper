# syntax=docker/dockerfile:1

FROM python:3.8

WORKDIR /stock_analysis_api

COPY requirements.txt requirements.txt

RUN export INSTALL_ON_LINUX=1

RUN pip install -r requirements.txt
# Install cron
RUN apt-get update && apt-get install -y cron

ADD entrypoint.sh /entrypoint.sh
# gives us permission and defines file as executable
RUN chmod +x /entrypoint.sh

COPY . . 

ENTRYPOINT /entrypoint.sh
# CMD  scrapy crawl stockanalyzer -o from_adrian_$(date +%m_%d_%Y).csv && curl -X POST https://content.dropboxapi.com/2/files/upload     --header "Authorization: Bearer WHIlHZsrzNEAAAAAAAAAAYvdA74ktwIhGGOO_4TcOi-v_3pusfemBhlE6tMiF6FX"     --header "Dropbox-API-Arg: {\"path\": \"/Adrian_made_this_for_you_$(date +%m_%d_%Y).csv\"}"     --header "Content-Type: application/octet-stream"     --data-binary @from_adrian_$(date +%m_%d_%Y).csv