# -*- coding: utf-8 -*-
import scrapy
import json
from datetime import date

class StockanalyzerSpider(scrapy.Spider):
    name = 'stockanalyzer'
    allowed_domains = ['www.stockanalysis.com']
    start_urls = ['https://api.stockanalysis.com/wp-json/sa/screener?type=ipoDate']

    focused_companies = dict()

    def parse(self, response):
        responseF = json.loads(response.body)

        for object in responseF:
            ticker = object[0]
            ipoDate = object[1]
            if self.hasRecentIpo(ipoDate):
                self.focused_companies[ticker] = {'ipoDate': ipoDate }
            

        for x,y in self.focused_companies.items():
            print(x, ":" , y)    

    def hasRecentIpo(self, ipoDate):
        splitDateArr = ipoDate.split('/')
        return int(splitDateArr[2]) >= 2020