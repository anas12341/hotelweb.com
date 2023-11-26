<?php
session_start();

// Establish connection to MySQL (Replace these variables with your actual credentials)
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "hotel_db";

$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Retrieve form data
$username = $_POST['username'];
$password = $_POST['password'];

// Check if user exists in the database (this is a basic example, not secure for production)
$sql = "SELECT * FROM users WHERE username='$username' AND password='$password'";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $_SESSION['username'] = $username;
    echo "Login successful! Welcome, $username!";
} else {
    echo "Invalid username or password.";
}

$conn->close();
?>
