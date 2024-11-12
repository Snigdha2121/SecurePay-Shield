from flask import Flask, render_template, request, jsonify

app = Flask(__name__)

# Home route to render the login page
@app.route('/')
def home():
    return render_template('index.html')

# Route for the login page logic (simulated)
@app.route('/login', methods=['POST'])
def login():
    email = request.form['email']
    phone = request.form['phone']
    password = request.form['password']

    # Simple validation (replace with actual authentication logic)
    if email and phone and password:
        return jsonify({"status": "success", "message": "Logged in successfully!"}), 200
    else:
        return jsonify({"status": "error", "message": "Please fill in all fields."}), 400

# Route to check transaction security (simulated)
@app.route('/check_security', methods=['POST'])
def check_security():
    receiver_name = request.form['receiver_name']
    receiver_upi = request.form['receiver_upi']

    # Simulate fraud check (replace with API call if needed)
    is_fraud = True if random.random() < 0.5 else False
    result = "Fraudulent Transaction Detected!" if is_fraud else "Transaction is Secure"
    
    return jsonify({"status": "success", "result": result})

# Route to report a user (simulated)
@app.route('/report_user', methods=['POST'])
def report_user():
    user_name = request.form['user_name']
    upi_id = request.form['upi_id']
    email = request.form['email']
    phone = request.form['phone']
    description = request.form['description']

    # Simulate reporting (replace with actual database logic)
    return jsonify({"status": "success", "message": "Your report has been submitted!"}), 200

# Route to update user settings (simulated)
@app.route('/update_settings', methods=['POST'])
def update_settings():
    phone = request.form['phone']
    email = request.form['email']
    credit_card_number = request.form['credit_card_number']
    dob = request.form['dob']
    address = request.form['address']

    # Simulate updating settings (replace with actual logic)
    return jsonify({"status": "success", "message": "Your settings have been updated!"}), 200

if __name__ == '__main__':
    app.run(debug=True)
