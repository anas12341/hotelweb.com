<?php
require 'config/dbc.php';

$username = $password = $confirm_password = "";
$username_err = $password_err = $confirm_password_err = "";

if ($_SERVER['REQUEST_METHOD'] == "POST"){

    // Check if username is empty
    if(empty(trim($_POST["username"]))){
        $username_err = "Username cannot be blank";
    }
    else{
        $sql = "SELECT id FROM users_reg WHERE username = ?";
        $stmt = mysqli_prepare($conn, $sql);
        if($stmt)
        {
            mysqli_stmt_bind_param($stmt, "s", $param_username);

            // Set the value of param username
            $param_username = trim($_POST['username']);

            // Try to execute this statement
            if(mysqli_stmt_execute($stmt)){
                mysqli_stmt_store_result($stmt);
                if(mysqli_stmt_num_rows($stmt) == 1)
                {
                    $username_err = "This username is already taken"; 
                }
                else{
                    $username = trim($_POST['username']);
                }
            }
            else{
                echo "Something went wrong";
            }
        }
    }

    mysqli_stmt_close($stmt);


// Check for password
if(empty(trim($_POST['password']))){
    $password_err = "Password cannot be blank";
}
elseif(strlen(trim($_POST['password'])) < 5){
    $password_err = "Password cannot be less than 5 characters";
}
else{
    $password = trim($_POST['password']);
}

// Check for confirm password field
if(trim($_POST['password']) !=  trim($_POST['confirm_password'])){
    $password_err = "Passwords should match";
}


// If there were no errors, go ahead and insert into the database
if(empty($username_err) && empty($password_err) && empty($confirm_password_err))
{
    $sql = "INSERT INTO users_reg (username, password) VALUES (?, ?)";
    $stmt = mysqli_prepare($conn, $sql);
    if ($stmt)
    {
        mysqli_stmt_bind_param($stmt, "ss", $param_username, $param_password);

        // Set these parameters
        $param_username = $username;
        $param_password = password_hash($password, PASSWORD_DEFAULT);

        // Try to execute the query
        if (mysqli_stmt_execute($stmt))
        {
            header("location: login.php");
        }
        else{
            echo "Something went wrong... cannot redirect!";
        }
    }
    mysqli_stmt_close($stmt);
}
mysqli_close($conn);
}

?>
<?php include 'themeswitch.php'; ?>
<!DOCTYPE html>
<html>
<head>
    <title>User Registration</title>
        <link id="theme-style" rel="stylesheet" href="themes/default/style.css">

     <link rel="stylesheet" href="css/reg_style.css" type="text/css">
     <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/flaticon.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

     <!-- FontAwesome Styles-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
        <!-- Custom Styles-->
    <link href="assets/css/custom-styles.css" rel="stylesheet" />
     <!-- Google Fonts-->
   <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
</head>
<body>
    <!-- Header Section Begin -->
<header class="header-section header-normal">
    <div class="top-nav">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <ul class="tn-left">
                        <li><i class="fa fa-phone"></i> (92) 320 8868760 </li>
                        <li><i class="fa fa-envelope"></i> info@gmail.com</li>
                    </ul>
                </div>
                <div class="col-lg-6">
                    <div class="tn-right">
                        <div class="top-social">
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-tripadvisor"></i></a>
                            <a href="#"><i class="fa fa-instagram"></i></a>
                        </div>
                        <?php 
                        if(isset($_SESSION['loggedin']) && $_SESSION['loggedin'] == true) {
                        echo '<a href="reservation.php" class="bk-btn">Booking Now</a>';
                        }
                        ?>
                        <div class="language-option">
                            <div class="translate" id="google_translate_element"></div>
                            <script type="text/javascript">
                                function googleTranslateElementInit() {  
                                    new google.translate.TranslateElement({pageLanguage: 'en'}, 'google_translate_element');
                                }
                            </script>
                            <script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
                        <!-- Translation Code End here -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="menu-item">
        <div class="container">
            <div class="row">
                <div class="col-lg-2">
                    <div class="logo">
                        <a href="./index.php">
                            <img src="img/logo.png" alt="">
                        </a>
                    </div>
                </div>
                <div class="col-lg-10">
                    <div class="nav-menu">
                        <nav class="mainmenu">
                            <ul>
                                <li class="active"><a href="./index.php">Home</a></li>
                                <li><a href="./about-us.php">About Us</a></li>
                                <li><a href="./contact.php">Contact</a></li>

                                <?php 
                                if(isset($_SESSION['loggedin']) && $_SESSION['loggedin'] == true) {
                                    echo '<li><a href="./rooms.php">Rooms</a></li>';
                                    echo '<li><a href="./room-details.php">Rooms Details</a></li>';
                                    echo '<li><a href="./blog.php">News</a></li>';
                                    echo '<li><a href="./logout.php">Logout</a></li>';
                                    echo '<li>Welcome ' . $_SESSION['username'] . '</li>';

                                } else { 
                                    echo '<li><a href="./login.php">Login</a></li>';
                                    echo '<li><a href="./registration.php">Register</a></li>';
                                }
                                ?>
                            </ul>
                        </nav>
                        <div class="nav-right search-switch">
                            <i class="icon_search"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
<!-- Header End -->
<body>
    <div class="container mt-4 mb-4">
    <h3>Please Register Here:</h3>
    <hr>
    <form action="" method="post">
      <div class="form-row">
        <div class="form-group col-md-6">
          <label for="username">Username</label>
          <input type="text" class="form-control" name="username" id="email" placeholder="Username">
        </div>
        <div class="form-group col-md-6">
          <label for="password">Password</label>
          <input type="password" class="form-control" name ="password" id="password" placeholder="Password">
        </div>
      </div>
      <div class="form-group">
          <label for="password">Confirm Password</label>
          <input type="password" class="form-control" name ="confirm_password" id="inputPassword" placeholder="Confirm Password">
        </div>
      <div class="form-group">
        <label for="address">Address 2</label>
        <input type="text" class="form-control" id="address" placeholder="Apartment, studio, or floor">
      </div>
      <div class="form-row">
        <div class="form-group col-md-6">
          <label for="city">City</label>
          <input type="text" class="form-control" id="city">
        </div>
        <div class="form-group col-md-2">
          <label for="zip">Zip</label>
          <input type="text" class="form-control" id="zip">
        </div>
      </div>
      <div class="form-group">
      </div>
      <button type="submit" class="btn btn-primary">Sign Up</button>
    </form>
    </div>

     <?php include 'partials/footer.php'; ?>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  </body>
</html>


   