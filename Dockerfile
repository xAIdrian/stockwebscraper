# syntax=docker/dockerfile:1

FROM python:3.8

WORKDIR /stock_analysis_api

COPY requirements.txt requirements.txt

RUN export INSTALL_ON_LINUX=1

RUN pip install Scrapy
RUN pip install pymongo[srv]

RUN pip install -r requirements.txt

COPY . . 

# do we need to run anaconda
CMD [ "scrapy", "crawl", "stockanalyzer" ]