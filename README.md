# project-3
Group 3 Project for DSCI445 @ CSU

# Predicting Next-Season MLB Wins Above Replacement (WAR)

## Project Overview
This project investigates whether a Major League Baseball (MLB) player's **next-season Wins Above Replacement (WAR)** can be predicted by using their **current-season performance statistics**.

We use player-level data from **2020-2025** and compare three modeling approaches:
  - Ordinary Least Squares (OLS)
  - LASSO Regression (with 10-fold cross-validation)
  - Gradient Boosting Regression

## Goal
The goal of this project is to evaluate and compare the predictive accuracy of statistical machine learning models for forecasting a baseball player's next-season WAR. 

## Research Question
Can we predict a baseball player’s next-season Wins Above Replacement (WAR) using their performance statistics from the current season?

## Background: What is WAR?
Wins Above Replacement (WAR) is a comprehensive baseball statistic that measures a player's total contribution to their team. It estimates how many additional wins a player provides compared to the hypothetical replacement-level player. 

It combines multiple aspects of performance such as hitting, baserunning, defensive value, positional difficulty, and their playing time, and puts it into a single metric. Lower WAR values inficate lower overall contribution.

Because WAR is an aggregate statistic influenced by many factors, it can be challenging to predict future WAR, furthering our motivation to find the best-fitting model to predict a player's next season WAR.


## Data Description

### Time Frame
  - **Training Data:** 2020-2024 MLB season
  - **Out-of-sample evaluation:** 2025 MLB season

### Structure
  - Each observation represents a single player-season.
  - The response variable is **WAR**
  - Predictor variables come from batting statistics, including offensive and performance-related statistics (plate appearances, batting metrics, etc)
  - Non-numeric or non-performance variables, such as Player, name, team, and awards, are removed before modeling.

### Prediction Target Definition
To model *next-season* performance:
  - Data is sorted by player and year.
  - A new variable, 'WAR_next', is created using a one-year lead of WAR. This constructed variable serves as the response variable in all models.
  - This allows current-season statistics to predict WAR in the following season.
  
## Methodology

### 1. Data Cleaning
  - Removed categorical and identifier variables not suitable for regression.
  - Combined data from 2020-2024 into a single training dataset.
  - Created test/train splits for model evaluation
  - The 2025 season is used for our real-world test set.
  

### 2. Models Implemented

#### Ordinary Least Squares (OLS)
  - Baseline linear regression model.
  - Uses all available predictors without regularization.
  - Provides interpretability but is sensitive to overfitting
  
  
#### LASSO Regression
  - Penalized linear regression using L1 regularization
  - Used a 10-fold cross-validation
  - Performs automatic feature selection by shrinking some coefficients to zero.
  - Allows evaluation of how many predictors meaningfully contribute to prediction.
  
  
#### Boosting Regression
  - Nonlinear ensemble method.
  - Sequentially builds models to correct previous errors.
  - Captures interactions and nonlinear relationships between predictors
  - Uses cross-validation
  
  
## Model Evaluation

Models are evaluated using:
  - **RMSE (Root Mean Squared Error)**
  - **MAE (Mean Absolute Error)**
  - **$R^2$ (Coefficient of Determination)**
  
Evaluation is performed on:
  1. Training data
  2. Test data
  3. 2025 season data (out-of-sample evaluation)
  

Visualizations:
  - Actual vs. Predicted WAR scatterplots for each model
  - RMSE, MAE, $R^2$ comparisons across models
  - Error comparisons across datasets (Train/Test/2025)
  
  

## Results Summary

  - **OLS** achieved the strongest overall predictive performance, particularly 
  on the 2025 out-of-sample data, indicating that the next-season WAR is well captured by a linear relationship with current-season performance statistics.
  - **LASSO** produced comparable results to OLS while reducing model complexity by shrinking several coefficients to zero, suggesting that only a subset of performance metrics meaningfully contribute to future WAR.
  - **Boosting** did not outperform linear models, implying that nonlinear relationships provide limited predictive value in this scenario.
  
  Despite predictive performance, all models exhibit regression toward the mean, especially for players with extreme WAR values, highlighting the uncertainty in forecasting future player performance.
  
  
  
## Study Predictions with 2025 examples:
Predicted vs. actual WAR values are examined for selected high-profile players, including:
  - Aaron Judge
  - Bobby Witt Jr.
  - Michael Toglia
  - Hunter Goodman
  - Shohei Ohtani
      -Shohei Ohtani's predicted WAR is skewed because his observed WAR includes both hitting and pitching contributions, while the model only uses hitting statistics. This highlights a limitation of the current modeling approach.


## Reproducibility

This project is fully reproducible:
  - All code is written in **R**
  - Models are built using **tidymodels**, **glmnet**, and **yardstick**
  - Cross-validation and tuning are explicitly defined
  - Results and figures are generated directly from the data
  
  
To reproduce results:
  1. Clone this repository
  2. Ensure the 'Data/' folder contains the CSV files for each season
  3. Run the R scripts sequentially
  

## Required Packages

```r
dplyr
tidymodels
glmnet
yardstick
Metrics
ggplot2
```

## References
  - Major League Baseball (MLB). *Wins Above Replacement (WAR).* MLB GLossary of Advanced Stats.
  - James, G., Witten, D., Hastie, T., & Tibshirani, R. (2013). *An introduction to statistical learning: With applications in R.* Springer.

  
  
  
  
  
  
  
  
  
  