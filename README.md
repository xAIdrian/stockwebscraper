# Stock Analysis

**Building this as a labor of love for a girl. Will it get her to like me? Let's find out**
If she doesn't I'll probably make a face like this
![Screen Shot 2021-11-17 at 8 57 13 PM](https://user-images.githubusercontent.com/7444521/142337258-738480ce-583d-4ebe-aa25-2cf9a56172ff.png)

### In order to get this to run locally you will need:
- [Anaconda](https://www.anaconda.com/products/individual)
- Python3
- IDE

Our scraper needs to be hosted in a virtual environment because it's a process that shouldn't be run on your hardware profile with it's network processing. Let's start it:

`conda activate virtual_workspace`

It'll have a different name.

Navigate to where you have your `scrapy.cfg` file, run:

`scrapy crawl stockanalyzer`

keep an eye out for a file name `stock_analyzer_dataset.csv`

### We already have this deployed remote in DockerHub

1. Install [docker desktop](https://desktop.docker.com/mac/main/amd64/Docker.dmg?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-mac-amd64)
2. Log in to the proper docker account
3. Pull Image from Remote Repositories - it'll be `stock_analysis_api`
![Screen Shot 2021-11-20 at 6 12 37 PM](https://user-images.githubusercontent.com/7444521/142743499-08c111a5-a76d-456f-8a24-90c1c83745d4.png)
4. Under Local, click to run the same image![Screen Shot 2021-11-20 at 6 13 57 PM](https://user-images.githubusercontent.com/7444521/142743528-13cbd1f8-ea62-40d0-a821-1117f0900170.png)

5. Log in to your Dropbox to access

`docker run -dp 3000:3000 amohnacs/stock_analysis_api`
