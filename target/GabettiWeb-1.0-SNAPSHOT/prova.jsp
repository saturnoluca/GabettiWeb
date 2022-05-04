<!DOCTYPE html>
<html>
<head>
    <title>Learning CSS</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="script/index.js"></script>
    <script src="bootstrap/js/jquery-3.3.1.min.js"></script>
    <script src="bootstrap/js/popper.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="bootstrap/js/jquery.sticky.js"></script>
    <link rel="stylesheet" href="slick/slick/slick.css">
    <link rel="stylesheet" href="slick/slick/slick-theme.css">
    <script type="text/javascript" src="slick/slick/slick.min.js"></script>
    <style>
        .container{
            max-width: 1240px;
            margin-left: auto;
            margin-right: auto;
        }

        .image{
            height: 200px;
            width: 200px;
        }

        .image img{
            height: 100%;
            width: 100%;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="image">
        <img src="images/casa.jpg">
    </div>
    <div class="image">
        <img src="images/casa.jpg">
    </div>
    <div class="image">
        <img src="images/casa.jpg">
    </div>
    <div class="image">
        <img src="images/casa.jpg">
    </div>
    <div class="image">
        <img src="images/casa.jpg">
    </div>
    <div class="image">
        <img src="images/casa.jpg">
    </div>
</div>
<script>
    $(document).ready(function(){
        $('.container').slick({
            slidesToShow: 3,
            slidesToScroll: 1
    });
    });
</script>

</body>
<script>
    function delImage(id) {
        var div = document.getElementById(id);
        div.style.display = "none";
    }
</script>

</html>
