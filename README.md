# Data Dashboarding Tool Tutorial

## Streamlit

[official document](https://docs.streamlit.io/)
### Run 

`streamlit run app.py`

### Deploy

1. Create Streamlit Cloud account
2. Connect to GitHub
3. Deploy app to GitHub public repository
4. Select app.py in Streamlit Cloud

## Rshiny

[official document](https://shiny.rstudio.com/tutorial/)

### Run

Inside R console

`runApp("Rshiny")`

### Deploy on Web via Shinyapps.io 

1. Create [Shinyapps.io ](https://www.shinyapps.io/) account
2. Install `rsconnect` package(`install.packages("rsconnect")`)
3. Connect account through R 
<br>
`rsconnect::setAccountInfo(name='NAME', token='TOKEN', secret='SECRET')
`
4. Deploy through rsconnect
<br>
`rsconnect::deployApp('Rshiny')`
