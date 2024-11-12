-- Database Setup Script for Fraud Detection Project

-- 1. Create Users Table
CREATE TABLE IF NOT EXISTS users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    phone_number VARCHAR(15),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_active BOOLEAN DEFAULT TRUE
);

-- Sample Data for Users Table
INSERT INTO users (username, email, phone_number) VALUES
('JohnDoe', 'johndoe@gmail.com', '1234567890'), 
('JaneSmith', 'janesmith@gmail.com', '2345678901'); 

-- 2. Create Transactions Table
CREATE TABLE IF NOT EXISTS transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    transaction_amount DECIMAL(10, 2) NOT NULL,
    transaction_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    location VARCHAR(100),
    payment_method ENUM('credit_card', 'upi', 'debit_card') NOT NULL,
    is_fraud BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Sample Data for Transactions Table
INSERT INTO transactions (user_id, transaction_amount, location, payment_method, is_fraud) VALUES
(1, 250.75, 'New York, NY', 'credit_card', FALSE),
(2, 500.00, 'Los Angeles, CA', 'upi', TRUE),
(1, 120.00, 'San Francisco, CA', 'credit_card', FALSE);

-- 3. Create Predictions Table
CREATE TABLE IF NOT EXISTS predictions (
    prediction_id INT AUTO_INCREMENT PRIMARY KEY,
    transaction_id INT,
    prediction_result BOOLEAN,
    confidence_score DECIMAL(4, 3),
    prediction_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (transaction_id) REFERENCES transactions(transaction_id)
);

-- Sample Data for Predictions Table
INSERT INTO predictions (transaction_id, prediction_result, confidence_score) VALUES
(1, FALSE, 0.95),
(2, TRUE, 0.80),
(3, FALSE, 0.90);

-- 4. Create Fraud Alerts Table
CREATE TABLE IF NOT EXISTS fraud_alerts (
    alert_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    transaction_id INT,
    alert_message VARCHAR(255),
    alert_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (transaction_id) REFERENCES transactions(transaction_id)
);

-- Sample Data for Fraud Alerts Table
INSERT INTO fraud_alerts (user_id, transaction_id, alert_message) VALUES
(2, 2, 'Suspicious transaction detected. Please verify if this was you.');

-- Optional: Select data to verify setup
SELECT * FROM users;
SELECT * FROM transactions;
SELECT * FROM predictions;
SELECT * FROM fraud_alerts;