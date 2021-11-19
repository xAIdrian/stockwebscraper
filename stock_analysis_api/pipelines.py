# -*- coding: utf-8 -*-

# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: https://doc.scrapy.org/en/latest/topics/item-pipeline.html
import logging
import pymongo

class MongoDbPipeline(object):
    # collection_name = "recent_ipo_companies"

    # def open_spider(self, spider):
    #     # logging.warning("OPEN SPIDER")
    #     # self.client = pymongo.MongoClient("mongodb+srv://3kFR63k38ZnnFrDK:3kFR63k38ZnnFrDK@cluster0.y5u5b.mongodb.net/myFirstDatabase?retryWrites=true&w=majority")
    #     # self.client.drop_database("StockAnalyzer")
    #     # self.db = self.client["StockAnalyzer"]

    # def close_spider(self, spider):
    #     # logging.warning("CLOSE SPIDER")
    #     # self.client.close()    

    def process_item(self, item, spider):
        # logging.warning(item)
        # self.db[self.collection_name].insert(item)

        return item
