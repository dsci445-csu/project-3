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

It combines multiple aspects of performance such as hitting, baserunning, defensive value, positional difficulty, and their playing time, and puts it into a single metric. The lower the war, the worse the player is.

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
To model *next-season* perfomance:
  - Data is sorted by player and year.
  - A new variable, 'WAR_next', is created using a one-year lead of WAR.
  - This allows current-season statistics to predict WAR in the following season.

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
  - A new variable, 'WAR_next', is created using a one-year lead of WAR.
  - This allows current-season statistics to predict WAR in the following season.