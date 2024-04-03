from flask import Flask, render_template, request, jsonify
import joblib
import pandas as pd

app = Flask(__name__)

# Load the trained model
model = joblib.load("trained_model.pkl")

# Define routes
@app.route('/')
def index():
    return render_template('index.html')

@app.route('/predict', methods=['POST'])
def predict():
    # Get input values from the request
    data = {
        'Age': [int(request.form['age'])],
        'SystolicBP': [int(request.form['systolic_bp'])],
        'DiastolicBP': [int(request.form['diastolic_bp'])],
        'BS': [float(request.form['bs'])],
        'BodyTemp': [float(request.form['body_temp'])],
        'HeartRate': [int(request.form['heart_rate'])]
    }

    # Create DataFrame from input data
    df = pd.DataFrame(data)

    # Make prediction
    prediction = model.predict(df)[0]

    # Map prediction back to risk level
    risk_levels = {0: 'low risk', 1: 'mid risk', 2: 'high risk'}
    risk_level = risk_levels[prediction]

    # Return prediction as JSON response
    return jsonify({'risk_level': risk_level})

if __name__ == '__main__':
    app.run(debug=True)
