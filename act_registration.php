<?php
// Establish connection to MySQL (Replace these variables with your actual credentials)
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "hotel_db";

$conn = new mysqli($servername, $username, $password, $dbname);

// Retrieve form data
$username = $_POST['username'];
$password = $_POST['password'];

if (empty($username_err) && empty($password_err) && empty($confirm_password_err)){
	
$query = mysqli_query($conn, "INSERT INTO users_reg (username, password) VALUES ('$username', '$password') or die(mysqli_error($conn));
}

header("Location:login.php");
?>
