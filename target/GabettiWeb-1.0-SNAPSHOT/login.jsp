<%--
  Created by IntelliJ IDEA.
  User: Luca
  Date: 11/03/2022
  Time: 15:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="icomoon/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="icomoon/fonts/iconic/css/material-design-iconic-font.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="icomoon/util.css">
    <link rel="stylesheet" type="text/css" href="css/login.css">
    <link rel="shortcut icon" type="image/jpg" href="images/favicon-256x256.png"/>
    <title>Gabetti Nocera | Login Admin</title>
    <link rel="shortcut icon" type="image/jpg" href="images/favicon-256x256.png"/>
    <!--===============================================================================================-->
</head>
<body>
<div class="limiter">
    <div class="container-login100">
        <div class="wrap-login100">
            <form class="login100-form validate-form" id="logform" action="javascript:controlloPassword()">
					<span class="login100-form-title p-b-26">
						Login Pagina Gestione
					</span>
                <span class="login100-form-title p-b-48">
						<img src="images/logo.png">
					</span>

                <div class="wrap-input100 validate-input" data-validate="Inserisci username">
                    <input class="input100" type="text" name="username" id="username">
                    <span class="focus-input100" data-placeholder="Username"></span>
                </div>

                <div class="wrap-input100 validate-input" data-validate="Inserisci password">
						<span class="btn-show-pass">
							<i class="zmdi zmdi-eye"></i>
						</span>
                    <input class="input100" type="password" name="password" id="password">
                    <span class="focus-input100" data-placeholder="Password"></span>
                </div>

                <div class="container-login100-form-btn">
                    <div class="wrap-login100-form-btn">
                        <div class="login100-form-bgbtn"></div>
                        <button class="login100-form-btn" type="submit" id="btn">Login</button>
                    </div>
                </div>
            </form>
            <div id="password-error"></div>
        </div>
    </div>
</div>

<!--===============================================================================================-->
<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
<script src="vendor/bootstrap/js/popper.js"></script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
<script src="vendor/daterangepicker/moment.min.js"></script>
<script src="vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
<script src="vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
<script src="script/main.js"></script>
<!--===============================================================================================-->
<script>
    function controlloPassword(){
        var username = document.getElementById("logform").elements["username"].value;
        var password = document.getElementById("logform").elements["password"].value;

        var xhttp = new XMLHttpRequest();
        xhttp.open("POST","ControlloPassword?username="+username+"&Password="+encodeURIComponent(password),true);


        xhttp.onreadystatechange = function() {
            if (xhttp.readyState == 4 && xhttp.status == 200) {
                if (xhttp.responseText === "true") {
                    console.log("si");
                    window.location = "Login?username=" + username + "&Password=" + encodeURIComponent(password);
                    document.getElementById("password-error").innerHTML = "";
                } else {
                    document.getElementById("password-error").innerHTML = "Username o Password Errati";
                }
            }
        }

        xhttp.send();
        return false;
    }
</script>
</body>
</html>

</body>

</html>
