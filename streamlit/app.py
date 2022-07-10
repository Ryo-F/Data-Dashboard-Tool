from email.policy import default
import streamlit as st
import numpy as np
import pandas as pd
import pickle

st.title('Prediction App')

col1, col2 = st.columns([2,2])


with col1:
    st.header("Data Input")
    plt = st.number_input("PLT [X10^4/μL]", min_value=0.0, step=0.01)
    pt_inr = st.number_input("PT-INR", min_value=0.0, step=0.01)
    fib = st.number_input("Fib [mg/dL]", min_value=0.0, step=0.01)
    fdp = st.number_input("FDP [μg/mL]", min_value=0.0, step=0.01)
    d_dimer = st.number_input("D-Dimer [μg/mL]", min_value=0.0, step=0.01)
    with st.form("my_form"):
        submitted = st.form_submit_button("Predict!")

@st.cache(allow_output_mutation=True)
def load_model():
    return pickle.load(open("model.pkl", "rb"))

xgb_model = load_model()
prediction = xgb_model.predict(pd.DataFrame(columns=['plt', 'pt', 'fdp', 'fib', 'ddimer'], data=[[plt, pt_inr, fib, fdp, d_dimer]]))
probability = xgb_model.predict_proba(pd.DataFrame(columns=['plt', 'pt', 'fdp', 'fib', 'ddimer'], data=[[plt, pt_inr, fib, fdp, d_dimer]]))

with col2:
    st.header("Result")
    if prediction[0] == 1:
        result = 'target'
    else:
        result = 'non-target'
    st.write('The prediction is '+ result)
    st.write('Predicted probabilty is '+ '{:.2%}'.format(probability[0][0]) )

