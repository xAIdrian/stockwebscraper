# Stock Analysis

**Building this as a labor of love for a girl. Will it get her to like me? Let's find out**
If she doesn't I'll probably make a face like this
![Screen Shot 2021-11-17 at 8 57 13 PM](https://user-images.githubusercontent.com/7444521/142337258-738480ce-583d-4ebe-aa25-2cf9a56172ff.png)

In order to get this to run locally you will need:
- [Anaconda](https://www.anaconda.com/products/individual)
- Python3
- IDE

Our scraper needs to be hosted in a virtual environment because it's a process that shouldn't be run on your hardware profile with it's network processing. Let's start it:

`conda activate virtual_workspace`

It'll have a different name.

Navigate to where you have your `scrapy.cfg` file, run:

`scrapy crawl stockanalyzer`
