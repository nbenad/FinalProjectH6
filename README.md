# FinalProjectH6
## Domain of Interest
Our domain of interest is the olympics, we are interested in this domain because all group members enjoy watching the olympics. Additionally, we choose the olympics because we felt there was a variety of information we can look into.  

### 3 Examples of related projects

- [Visualizing Olympic Medalists](http://rio2016.thegamma.net) 
  - Numbers of interactive visualizations around the Olympic medals data set, including medal timelines and tables.
- [Visual Analysis of Olympics Data](https://towardsdatascience.com/visual-analysis-of-olympics-data-16273f7c6cf2)
  - Visual analysis of the economic effect of countries hosting the Olympic via comparison between host's GDP and total medals won.   
- [The Winter Games](https://www.dremio.com/the-winter-olympics/)
  - Overview on each country's performace over all Olympic games; data including medals count and categories of sport the country is better at.   

### What Data-Driven Questions do we hope to answer
- How do countries do in each sport? What are their specializations?
  - We can use the data we have found to graph the number of medals won grouped by country and sports. Then, listing out some of the best-performing sports for each country(evaluated by weighting differnt medals).
- How do Athletes' heights depend on the sport in which they compete in? Do Athlete height distributions change depending on sport?
  - To solve this, we can display a boxplot of athlete's height based on the sport they compete in.  
- How does the percentage of athletes that win from each country change over time?
  - To answer this question, we can take a look at the number of athletes that won divided by the number of athletes that competed for the most relevant countries and graph the percentages for each olympic event over time to look for a trend.
## Finding data

### 120 Years of Olympic History
- https://www.kaggle.com/heesoo37/120-years-of-olympic-history-athletes-and-results
- This dataset was collected by Randi Griffin, a data scientist in Cambridge, Massachusetts, through the scraping of data from [sports-reference](www.sports-reference.com) in May 2018. The data contains information regarding athletes in olympic events dating back 120 years.
- 271116 observations
- 15 features
- This dataset can answer all data-driven questions listed above.
### Olympic Sports and Metals
- https://www.kaggle.com/the-guardian/olympic-games
- Data is hosted on Kaggle. Data was collected by The International Olympic Committee’s (IOC) Research and Reference Center. Who is “the world source of reference for Olympic knowledge.” The International Olympic Committee’s Research and Reference Center state “Our mission is to share this knowledge with professionals and researchers through providing information, giving access to our unique collections, enabling research and stimulating intellectual exchange.” The IOC is regarded as having the most accurate data on the Olympics.
- This data consist of 2 CSV files, one is about the Summer Olympics while the other concerns the Winter Olympics
- Each File has 9 columns (features).
- The Winter olympics file has 5770 observations.
- The Summer olympics file has 31165 observations.
- From this dataset we can answer all three above questions. 
### databaseOlympics
- https://web.archive.org/web/20070318010246/http://www.databaseolympics.com/index.htm
- Website dedicated in collecting all sorts of Olympic data from multiple sources. Hosted by Internet Archive, which is a credible internet library stroing archive datasets. This website contains metal counts filtered by athletes, countries, years, and many more.
- There are multiple tabs with each consisting data of different category(by year 1896 thorugh 2004, by athletes' birthdates, by countries etc.)
- Each tab has differenct number of columns. The year tabs have 4 columns while the athlete tab has 2 columns.
- Take the 1908 Summer Olympics tab as example, there are 4 columns and 20 observations.
- This dataset was complete enough to answer all three above questions. 
