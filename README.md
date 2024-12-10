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

Note: Before running the Lasso, Random Forest, or XGboost models, download the data from Kaggle, install dependencies, and run the `Cleaning_Transformations.Rmd` file in the Data folder. Further instruction on downloading necessary datasets is below.

1. **Lasso**
   - Run the `Lasso_RandomForest_Cleaning.Rmd` file found in the `Data` folder
   - Run the `Lasso_Model_Metrics.Rmd` file found in the `LJ_Model` and `Lasso` folder
   - Since the data and model files are saved as .csv and .rds files, respectively, the `Lasso_Model_Metrics.Rmd` is the only file that needs to be run. To inspect the model construction, view `Lasso_Model_Create.Rmd`
2. **Random Forest**
   - Run the `Lasso_RandomForest_Cleaning.Rmd` file found in the `Data` folder
   - Run the `RF_Model_Metrics.Rmd` file found in the `LJ_Model` and `Random Forest` folder
   - Since the data and model files are saved as .csv and .rds files, respectively, the `RF_Model_Metrics.Rmd` is the only file that needs to be run. To inspect the model construction, view `Random_Forest_Model.Rmd`
3. **XGBOOST**
  - Run the `DAndre_XGboost_Model.Rmd` file found in the `Dre_Model`folder
4. **ARIMA**
   - Run the `Garrett_Model.Rmd` file found in the `Garrett_Model`folder

---

## Installation

1. Clone the repository:
```bash
 git clone https://github.com/dsci445-csu/project-3
```
---

## Data Preparation

# Download Instructions

Download the dataset from the Kaggle competition:
[Store Sales - Time Series Forecasting Kaggle Competition](https://www.kaggle.com/competitions/store-sales-time-series-forecasting/data)

Manual Download Steps

1. Create a Kaggle account (if you don't have one)
2. Navigate to the competition data page
3. Click "Download All" button
4. Save the downloaded zip file
5. Extract the files into a Data/Raw Data/ directory in the project folder

File structure after downloading:

project-3/
│
├── data/
│ ├── Cleaning_Transformations.Rmd
│ ├── Lasso_RandomForest_Cleaning.Rmd
|  ├── Raw Data/
│   ├── holidays_events.csv
│   ├── oil.csv
│   ├── sample_submission.csv
│   ├── stores.csv
│   ├── stores.csv
│   ├── test.csv
│   ├── train.csv
│   └── transactions.csv

---

## Dependencies

# Run the following code to install required packages

# Core Data Manipulation and Visualization
core_packages <- c(
  "readr",      # Reading data files
  "dplyr",      # Data manipulation
  "ggplot2",    # Data visualization
  "lubridate"   # Date and time manipulation
)

# Statistical Modeling and Machine Learning
modeling_packages <- c(
  "leaps",      # Regression subset selection
  "glmnet",     # Lasso and Ridge Regression
  "ISLR",       # Statistical learning datasets and methods
  "tidymodels", # Consistent machine learning workflow
  "dials"       # Hyperparameter tuning
)

# Time Series Analysis
time_series_packages <- c(
  "tseries",    # Time series analysis
  "forecast",   # Time series forecasting
  "tidyr"       # Data tidying
)

# Random Forest Specific
random_forest_packages <- c(
  "ModelMetrics", # Model evaluation metrics
  "randomForest", # Traditional Random Forest
  "ranger",       # Improved Random Forest implementation
  "vip",          # Variable importance
  "parsnip",      # Consistent model interface
  "rsample"       # Sampling and resampling
)

# Parallel Processing
parallel_packages <- c(
  "parallel",     # Parallel computing
  "doParallel"    # Parallel backend for foreach
)

# Correlation and Visualization
correlation_packages <- c(
  "corrplot"      # Correlation matrix visualization
)

# Combine all packages
all_packages <- c(
  core_packages,
  modeling_packages,
  time_series_packages,
  random_forest_packages,
  parallel_packages,
  correlation_packages
)

# Install packages
install.packages(all_packages, dependencies = TRUE)

---

## Acknowledgements

* Colorado State University, Department of Data Science
* DSCI 445: Statistical Machine Learning, Fall 2024
* Dr. Andee Kaplan for her guidance and support


