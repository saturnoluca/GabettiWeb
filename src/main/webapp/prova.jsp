<!DOCTYPE html>
<html>
<head>
    <title>Learning CSS</title>

    <link rel="stylesheet" href="css/prova.css">
</head>
<body>
<div class="container">
    <div id="0" class="image">
        <img src="images/casa.jpg" alt="image">
        <span onclick="delImage(0)">&times;</span>
    </div>
    <div id="1" class="image">
        <img src="images/casa.jpg" alt="image">
        <span onclick="delImage(1)">&times;</span>
    </div>
    <div id="2" class="image">
        <img src="images/casa.jpg" alt="image">
        <span onclick="delImage(2)">&times;</span>
    </div>
    <div id="3" href=""  class="image">
        <img src="images/casa.jpg" alt="image">
        <span onclick="delImage(3)">&times;</span>
    </div>
    <div id="4" class="image">
        <img src="images/casa.jpg" alt="image">
        <span onclick="delImage(4)">&times;</span>
    </div>
    <div id="5" class="image">
        <img src="images/casa.jpg" alt="image">
        <span onclick="delImage(5)">&times;</span>
    </div>
    <div id="6" class="image">
        <img src="images/casa.jpg" alt="image">
        <span onclick="delImage(6)">&times;</span>
    </div>
    <div id="7" class="image">
        <img src="images/casa.jpg" alt="image">
        <span onclick="delImage(7)">&times;</span>
    </div>
    <div id="8" class="image">
        <img src="images/casa.jpg" alt="image">
        <span onclick="delImage(8)">&times;</span>
    </div>
    <div id="9" class="image">
        <img src="images/casa.jpg" alt="image">
        <span onclick="delImage(9)">&times;</span>
    </div>
</div>
</div>
</body>
<script>
    function delImage(id) {
        var div = document.getElementById(id);
        div.style.display = "none";
    }
</script>

</html>
