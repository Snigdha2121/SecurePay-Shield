// Login Functionality
function login() {
    const email = document.getElementById('email').value;
    const phone = document.getElementById('phone').value;
    const password = document.getElementById('password').value;

    if (email && phone && password) {
        document.getElementById('login-container').style.display = 'none';
        document.getElementById('dashboard-container').style.display = 'flex';
        showSection('dashboard');
    } else {
        alert("Please fill in all fields.");
    }
}

// Navigate to UPI or Card Checker Form
function navigateToChecker(type) {
    document.getElementById('dashboard-section').style.display = 'none';
    document.getElementById('checker-form-section').style.display = 'block';
    document.getElementById('checker-form-section').querySelector('h3').innerText = `Check ${type} Transaction Security`;
}

// Check Transaction Security
function checkSecurity() {
    const name = document.getElementById('receiver-name').value;
    const upi = document.getElementById('receiver-upi').value;

    if (name && upi) {
        const isFraud = Math.random() < 0.5;
        const resultText = isFraud ? '⚠️ Fraudulent Transaction Detected!' : '✅ Transaction is Secure';
        document.getElementById('security-result').innerText = resultText;
    } else {
        alert("Please fill in all required fields.");
    }
}

// Show specific section on sidebar click
function showSection(sectionId) {
    document.querySelectorAll('.section-content').forEach(section => section.style.display = 'none');
    document.getElementById(`${sectionId}-section`).style.display = 'block';
    document.querySelectorAll("#sidebar ul li").forEach(li => li.classList.remove("active"));
    document.querySelector(`#sidebar ul li[onclick="showSection('${
