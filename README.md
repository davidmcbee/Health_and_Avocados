# Health and Avocados

## Overview
Purpose of this project is to use everything we have learned over the period of the course and apply them in predicting the Price of Avocados in California based on the available production, climate, market, and price data, collected for the past 3 years (2018 - 2020). The questions we will be answering in this project are shown below.

 - Does the weather patterns of the current month effect the production of avocados in the future months?
 - Does the production of the avocados effect the prices? 

### Bonus
Furthermore if time permits, we will be correlating the health/dietary benefits of avocado consumption.

 - Does eating avocados help in actual or percieved health benefits for an individual?
 

## Resources
  - Data Source: climate.csv, market.csv, prices.csv, production.csv
  - Software: anaconda3, python 3.7.7, jupyter notebook, JavaScript
  - Database: PostgreSQL
  - Librarys: pandas, sklearn, tensorflow, os, leaflet, matplotlib


## Project Outline

We will be using unsupervised machine learning to uncover patterns in our datasets. With our analyses, we would like to find the factors that are effecting avocado prices and avocado production, and uncover trends of avocado prices and avocado production. Then we will start with multiple linear regression to discover the relationship of production with respect to climate, and prices with respect to production, and how we could combine them all. Next step would be to use the random forest ensemble classification to determine the increase or decrease in the avocado prices, and then generate price prediction model using a neural network model.

### Contributors
Contributor | Seg 1 | Seg 2 | Seg 3 | Seg 4
------------|-------|-------|-------|------
Amelin | Circle | | |
Andreja | Triangle | | |
David | Square | | |
Subba | X | | |


### Communications Protocols
 - Google Docs for tracking checklist based on the rubrics.
 - Google Drive with shared folder and sub folders to add findings to be shared by the group.
 - Zoom Meetings twice a week Monday, and Wednesday + as needed.
 - Slack for daily chats.
 - Weekly responsibilities are shared in Google Sheet. 

### Database Integration

#### Features

Feature|Description         
-------|-----------
Feature1 | Description 1

#### ERD - Database schema
 - DataSets
   - Climate
     - Columns “StateCode” and “Division” were dropped as they were not relevant
     - The “YearMonth” column was converted from int to datetime period[M]
     
   - Market
     - Columns were renamed to all lowercase with no spaces/replaced with underscores
     - str columns were changed to lowercase, only proper case was kept on the geography column as it contained names of cities/states/regions
     - “year_month” column was added to the dataset as datetime period[M], and columns were reordered
     - “date” column was changed to datetime format
     
   - Prices
     - Columns were renamed to all lowercase with a more descriptive title with no spaces/replaced with underscores
     - str columns were changed to lowercase, only proper case was kept on the geography column as it contained names of cities/states/regions
     - “year_month” column was added to the dataset as datetime period[M], and columns were reordered
     - “date” column was changed to datetime format
     
   - Production
     - Columns were renamed to all lowercase with a more descriptive title with no spaces/replaced with underscores
     - str columns were changed to lowercase
     - “year_month” column was added to the dataset as datetime period[M], and columns were reordered
     - “date” column was changed to datetime format

Datasets loaded into a PostgreSQL database. Entity Relationship Diagram (ERD) shown below
  ![](./Images/Final_ERD.png "") 
 
 Further schema descriptions are shown in this file:  
   ["ERD file"](./ERD/h_a_ERD.xlsx)

#### Cleaning
The data was cleaned to the point that it could be joined together as needed while saving all the source data. Primary key 'year_month' is used on each table as a connector.  Date column in each dataset file is in different format and they were all converted to year_month format. Saving the data as sourced is important from a data lineage perspective and provides flexibility to use or drop columns while cleaning the data for machine learning. Column titles were cleaned to make them consistent and proper capitalization was used.

#### Physical Tables
Schema description for tables Prices, Production, and Climate are shown in the ["ERD file"](./ERD/h_a_ERD.xlsx).

#### Source Data ERD
ERD Diagram-Source Data worksheet in the ["ERD file"](./ERD/h_a_ERD.xlsx) is the ERD for initial storage within the database. Given the common and consistent primary key in each of the tables, for this stage all relationships will be one-to-one. The lines depicting the connections represent the ability to join each table to each other tables.

#### Consolidation prior to Extraction
Again, referring to our analysis process, once each table is in the database, we anticipate joining all the price tables into one table and all the production tables into one table. This is shown in the ERD Diagram-Consolidation (["ERD file"](./ERD/h_a_ERD.xlsx)). It is anticipated that further consolidation into one table will be done prior to extraction into Jupyter notebook. Further updates to the ERD are done as we progress to different stages in the project.


### Machine Learning Model
  - Unsupervised ML for classification of our data in order to uncover the patterns/groups.
  - Multiple Linear Regression for avocado prices in selected US cities
    - Production in California(US), Mexico, Peru, Colombia, Chile (=feature or X-variable) and avocado prices (=target or y-variable).
  - Multiple Linear Regression for production
    - Climate data in Southern California (=features or X-variables) and production in Southern California (=target or y-variable).
  - Random Forest Ensemble Classification
    - (Features) X-variables: region, date, units sold, harvested area, production data, climate data, import data, export data, median income.
    - (Target) y-variable: avocado price 
  - Neural Network ML model for avocado prices prediction 
    - (Features) X-variables: region, date, units sold, harvested area, production data, climate data, import data, export data, median income.
    - (Target) y-variable: avocado price 


#### Preprocessing Data for a Neural Network Model

#### Target for the model

#### Features for the model

#### Compile, Train, and Evaluate the Model
  - Model
    
  - Train stats
    
  - Test stats
    
  - Results
  
  
## Summary
