# Project Group 3: Time Series Sales Forecasting

This repository encompasses the entirety of the work that we did for the DSCI 445 final project. It has each of our individual RMD files with data analysis and model implementation, as well as our slide deck and final paper. The Kaggle competition for this repository can be found at 
https://www.kaggle.com/competitions/store-sales-time-series-forecasting

---

## Collaborators
- **Lauren Bair** (GitHub: [@laurenbair](https://github.com/laurenbair))
- **Jillian Cook** (GitHub: [@jilliancook](https://github.com/jilliancook))
- **Garrett Hayden** (GitHub: [@Ghayd4848](https://github.com/Ghayd4848))
- **D'Andre Tafoya** (GitHub: [@DevDAndre](https://github.com/DevDAndre))

A note on collaboration: As outlined in the challenges section of our paper, we had many difficulties in version control between RStudio and GitHub. For that reason, Garrett had to perform most of our commits and as such our commit history does not reflect proper collaboration. We each have our individual model, however we joined efforts on many aspects of the project such as data pre-processing and even model building, and met in person multiple times in order to effectively work together.

---

## Project: Time Series Sales Forecasting Using Machine Learning Models

### **Overview**
This project is a multi-faceted approach to predicting retail sales over a 15-day period in Ecuador. It incorporates data pre-processing, feature engineering, machine learning model implementation, and model evaluation, with a focus on accuracy.

---

## **Features**
1. **Data Preprocessing**
   - File merging
   - Lag feature generation
   - Rolling average imputation
   - Forward/backfilling for missing values
2. **Model Training**
   - Implemented Lasso, Random Forest, XGBoost, and ARIMA models
   - Incorporated optimal feature selection
3. **Model Evaluation**
   - Metrics: RMSLE, OOB-Error, Kaggle Leaderboard Rankings

---

## **File Structure**
Since the different models require different files and file structures, we will break down how to use the files by model:

1. **Lasso**
   - Run the `Lasso_Model_Metrics.Rmd` file found in the `LJ_Model` and `Lasso` folder
   - Since the data and model files are saved as .csv and .rds files, respectively, the `Lasso_Model_Metrics.Rmd` is the only file that needs to be run. To inspect the model construction, view `Lasso_Model_Create.Rmd`
2. **Random Forest**
3. **XGBOOST**
4. **ARIMA**
   - Run the `Garrett_Model.Rmd` file found in the `Garrett_Model`folder

__

## Dependencies

**Lasso**
library(readr)
library(dplyr)
library(leaps)
library(ggplot2)
library(glmnet)
library(ISLR)
library(dials)
library(tidymodels)
library(parallel)
library(doParallel)

**Random Forest**

**XGBOOST**

**ARIMA**
library(ggplot2)
library(dplyr)
library(tidyr)
library(lubridate)
library(forecast)
library(readr)

#install.packages("ranger")
#install.packages("ModelMetrics")
#install.packages('rsample')
#install.packages('lubridate')
#install.packages("tseries")
#install.packages("corrplot")
