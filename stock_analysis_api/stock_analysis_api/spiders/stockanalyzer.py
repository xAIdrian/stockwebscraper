# -*- coding: utf-8 -*-
import scrapy
import json
from datetime import date

class StockanalyzerSpider(scrapy.Spider):
    name = 'stockanalyzer'
    allowed_domains = ['www.stockanalysis.com', 'api.stockanalysis.com']
    start_urls = ['https://api.stockanalysis.com/wp-json/sa/screener?type=ipoDate']

    focused_companies = dict()

    def parse(self, response):
        self.initFocusedCompaniesDict(json.loads(response.body)) 
        #main page companies profile request
        yield scrapy.Request(
            url=f'https://api.stockanalysis.com/wp-json/sa/screener?type=f',
            callback=self.updateCompaniesWithProfile
        ) 

        #print statement for testing
        # for x,y in self.focused_companies.items():
        #     print(x, ":" , y)    

    #initial request and filter for IPOs after 2020 and create dict for future work
    def initFocusedCompaniesDict(self, responseIpoDate):
        for object in responseIpoDate:
            ticker = object[0]
            ipoDate = object[1]
            if self.hasRecentIpo(ipoDate):
                self.focused_companies[ticker] = {'ipoDate': ipoDate }

    def hasRecentIpo(self, ipoDate):
        splitDateArr = ipoDate.split('/')
        return int(splitDateArr[2]) >= 2020

    def updateCompaniesWithProfile(self, response):  
        print(json.loads(response.body))  
        data = response.get('data')