# Forecasting Inflation in Manado City
In this project, I used the supervised technique support vector regression to predict inflation. The data used in this project was obtained from the Manado Central Bureau of Statistics. For the end result, I created a simple shiny web app to do inflation prediction.

##   What I do in this project
1. Data Acquisition and EDA:
- Gathered historical inflation data from Manado Central Bureau of Statistics (BPS Sulawesi Utara) for the period 2010-2023.
- Explored data characteristics through visualizations and statistical summaries to identify trends, seasonality, and potential outliers.
2. Feature Engineering:
- Created a new feature based on Partial Autocorrelation Function (PACF) analysis to capture lagged relationships between inflation values.
3. Model Development:
- Tuned hyperparameters using GridSearchCV for radial kernel & linear kernel to optimize model performance.
4. Web App Development:
- Built a user-friendly Shiny web app that allows users to input inflation value and view predicted inflation rates.

## Result
it show that 
![GIF](Resource/web-app.gif)
