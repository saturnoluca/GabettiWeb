<%--
  Created by IntelliJ IDEA.
  User: Luca
  Date: 20/04/2022
  Time: 12:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="it" dir="ltr">
<head>
    <meta charset="UTF-8">
    <!--<title> Responsive Sidebar Menu  | CodingLab </title>-->
    <link rel="stylesheet" href="css/amministratoreagente.css">
    <!-- Boxicons CDN Link -->
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">

    <link rel="stylesheet" href="icomoon/style.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <link rel="stylesheet" href="bootstrapcss/owl.carousel.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
</head>
<%
    int idAppartamento = Integer.parseInt(request.getParameter("idAppartamento"));
%>
<body>
<div class="sidebar">
    <div class="logo-details">
        <div class="logo_name">Gabetti</div>
        <i class='bx bx-menu' id="btn" ></i>
    </div>
    <ul class="nav-list">
        <li>
            <a href="#">
                <i class='bx bx-grid-alt'></i>
                <span class="links_name">Dashboard</span>
            </a>
            <span class="tooltip">Dashboard</span>
        </li>
        <li>
            <a href="#">
                <i class='bx bx-user'></i>
                <span class="links_name">Il mio profilo</span>
            </a>
            <span class="tooltip">Il mio profilo</span>
        </li>
        <li>
            <a href="#">
                <i class='bx bx-home' ></i>
                <span class="links_name">Lista immobili</span>
            </a>
            <span class="tooltip">Lista immobili</span>
        </li>
        <li>
            <a href="aggiungi-immobile-admin.html">
                <i class='bx bx-home-smile' ></i>
                <span class="links_name">Aggiungi immobile</span>
            </a>
            <span class="tooltip">Aggiungi immobile</span>
        </li>
        <li>
            <a href="#">
                <i class='bx bxs-user-detail' ></i>
                <span class="links_name">Lista utenti</span>
            </a>
            <span class="tooltip">Lista utenti</span>
        </li>
        <li>
            <a href="aggiungi-utente.html">
                <i class='bx bx-user-plus' ></i>
                <span class="links_name">Aggiungi utente</span>
            </a>
            <span class="tooltip">Aggiungi utente</span>
        </li>
        <li class="profile">
            <div class="profile-details">
                <img src="../java/model/utente/agente.jpg" alt="profileImg">
                <div class="name_job">
                    <div class="name">Gaetano De Filippo</div>
                    <div class="job">Amministratore</div>
                </div>
            </div>
            <i class='bx bx-log-out' id="log_out" ></i>
        </li>
    </ul>
</div>
<section class="home-section">
    <div class="div_addProperty_page">
        <div class="addProperty_page_head">
            <div class="addProperty_head_title">
                <h1 class="head_title">Aggiungi immobile</h1>
            </div>
        </div>
        <div class="addProperty_page_content">
            <form class="form_addProperty" action="ServletMultimediaAggiunta" method="post">
                <input type="hidden" name="idAppartamento" value="<%=idAppartamento%>">
                <input type="hidden" name="azione" value="<%="video"%>">
                <div class="addProperty_content">
                    <div class="form_content_fields">
                        <div class="content_fields_row">
                            <div class="property_multimedia">
                                <h3 class="tab_title">Multimedia</h3>
                                <div class="content_gallery_images full_size">
                                    <label class="label_property_title">Video</label>
                                    <div class="drag_drop_container">
                                        <i class="icon-cloud-upload"></i>
                                        <strong>Seleziona un video</strong>
                                        <span class="or">oppure</span>
                                        <div class="button_browse">Sfoglia Video
                                            <div class="input_file">
                                                <input type="file" accept="video/mp4,video/x-m4v,video/*" id="upload-video">
                                            </div>
                                        </div>
                                        <div id="reset-video" class="button_browse">Reset
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="div_button_submit">
                            <input type="submit" value="Aggiungi immobile">
                        </div>
                    </div>
                </div>

            </form>
        </div>
    </div>
</section>

<script>
    let sidebar = document.querySelector(".sidebar");
    let closeBtn = document.querySelector("#btn");
    let searchBtn = document.querySelector(".bx-search");

    closeBtn.addEventListener("click", ()=>{
        sidebar.classList.toggle("open");
        menuBtnChange();//calling the function(optional)
    });

    searchBtn.addEventListener("click", ()=>{ // Sidebar open when you click on the search iocn
        sidebar.classList.toggle("open");
        menuBtnChange(); //calling the function(optional)
    });

    // following are the code to change sidebar button(optional)
    function menuBtnChange() {
        if(sidebar.classList.contains("open")){
            closeBtn.classList.replace("bx-menu", "bx-menu-alt-right");//replacing the iocns class
        }else {
            closeBtn.classList.replace("bx-menu-alt-right","bx-menu");//replacing the iocns class
        }
    }
</script>



<script>
    function readFile(e) {
        var files;
        console.log("SIUM");
        if (e.target.files) {
            files=e.target.files
        } else {
            files=e.dataTransfer.files
        }
        if (files.length==0) {
            alert('What you dropped is not a file.');
            return;
        }
        var file=files[0];
        document.getElementById('fileDragName').value = file.name
        document.getElementById('fileDragSize').value = file.size
        document.getElementById('fileDragType').value = file.type
        reader = new FileReader();
        reader.onload = function(e) {
            document.getElementById('fileDragData').value = e.target.result;
        }
        reader.readAsDataURL(file);
    }
    function getTheFile(e) {
        e.target.style.borderColor='#ccc';
        readFile(e);
    }
</script>


<script src="script/index.js"></script>
<script src="bootstrap/js/jquery-3.3.1.min.js"></script>
<script src="bootstrap/js/popper.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="bootstrap/js/jquery.sticky.js"></script>

</body>
</html>
