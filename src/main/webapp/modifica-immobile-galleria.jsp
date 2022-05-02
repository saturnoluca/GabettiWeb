<%--
  Created by IntelliJ IDEA.
  User: Luca
  Date: 20/04/2022
  Time: 11:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="model.utente.UtenteBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.appartamento.AppartamentoBean" %>
<%@ page import="model.indirizzo.IndirizzoBean" %>
<%@ page import="model.agente.AgenteBean" %>
<%@ page import="model.multimedia.MultimediaBean" %>
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
    UtenteBean admin = (UtenteBean) session.getAttribute("utente");
    if (admin == null || !admin.getRuolo().equals("Admin")) {
        response.sendRedirect(response.encodeRedirectURL("login.jsp"));
        return;
    }
    ArrayList<MultimediaBean> listaFoto = (ArrayList<MultimediaBean>) request.getAttribute("lista-foto");
    if(listaFoto==null){
        response.sendRedirect(response.encodeRedirectURL("gestione-lista-immobili.jsp"));
        return;
    }

%>
<body>
<jsp:include page="sidebar.jsp" />
<section class="home-section">
    <div class="div_addProperty_page">
        <div class="addProperty_page_head">
            <div class="addProperty_head_title">
                <h1 class="head_title">Aggiungi immobile</h1>
            </div>
        </div>
        <div class="addProperty_page_content">

                <div class="addProperty_content">
                    <div class="form_content_fields">
                        <div class="content_fields_row">
                            <div class="property_multimedia">
                                <h3 class="tab_title">Galleria Immagini</h3>
                                <div class="content_gallery_images full_size">
                                    <label class="label_property_title">Rimuovi immagini</label>
                                        <div class="container-rimuovi">
                                            <%for(MultimediaBean foto: listaFoto){
                                            %>
                                                <div id="<%=foto.getIdAppartamento()%>" class="image">
                                                    <img src="data:image/png;base64,<%=foto.getFotoString()%>" alt="image">
                                                    <span onclick="delImage(<%=foto.getIdAppartamento()%>)">&times;</span>
                                                </div>
                                            <%}%>
                                        </div>
                                        <div class="div_button_submit">
                                            <input type="button" value="Conferma" onclick="EliminaImmagini()">
                                        </div>
                                </div>
                            </div>
                            <div class="property_multimedia">
                                <form class="form_addProperty" action="ServletMultimediaAggiunta" method="post" enctype="multipart/form-data">
                                    <input type="hidden" name="azione" value="<%="foto"%>">
                                    <h3 class="tab_title">Aggiungi Nuove Immagini</h3>
                                        <div class="gallery_image_container" id="gallery_image_container"></div>
                                        <div class="content_gallery_images full_size">
                                            <label class="label_property_title">Preview</label>
                                            <div class="drag_drop_container">
                                                <i class="icon-cloud-upload"></i>
                                                <strong>Seleziona delle immagini</strong>
                                                <div class="button_browse">Sfoglia Immagine
                                                    <div class="input_file">
                                                    <input type="file" multiple id="upload-photo" onchange="readFile(event)" name="immagine">
                                                </div>
                                            </div>
                                            <div id="reset-image" class="button_browse">Reset</div>
                                            </div>
                                        </div>
                                </form>
                            </div>
                        </div>
                        <div class="div_button_submit">
                            <input type="submit" value="Avanti">
                        </div>
                    </div>
                </div>
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
    function previewImages() {

        var preview = document.querySelector('#gallery_image_container');

        if (this.files) {
            [].forEach.call(this.files, readAndPreview);
        }

        function readAndPreview(file) {

// Make sure `file.name` matches our extensions criteria
            if (!/\.(jpe?g|png|gif)$/i.test(file.name)) {
                return alert(file.name + " is not an image");
            } // else...

            var reader = new FileReader();

            reader.addEventListener("load", function() {
                var image = new Image();
                image.height = 100;
                image.title  = file.name;
                image.src    = this.result;
                preview.appendChild(image);
            });

            reader.readAsDataURL(file);

        }

    }

    document.querySelector('#upload-photo').addEventListener("change", previewImages);

    $('#reset-image').click(function(){
        $("#upload-photo").val('');
        $("#gallery_image_container").empty();
    });
</script>

<script>
    function previewImages() {

        var preview = document.querySelector('#planimetria_image_container');

        if (this.files) {
            [].forEach.call(this.files, readAndPreview);
        }

        function readAndPreview(file) {

// Make sure `file.name` matches our extensions criteria
            if (!/\.(jpe?g|png|gif)$/i.test(file.name)) {
                return alert(file.name + " is not an image");
            } // else...

            var reader = new FileReader();

            reader.addEventListener("load", function() {
                var image = new Image();
                image.height = 100;
                image.title  = file.name;
                image.src    = this.result;
                preview.appendChild(image);
            });

            reader.readAsDataURL(file);

        }

    }

    document.querySelector('#upload-planimetria').addEventListener("change", previewImages);

    $('#reset-planimetria').click(function(){
        $("#upload-planimetria").val('');
        $("#planimetria_image_container").empty();
    });
</script>

<script>
    function previewImages() {

        var preview = document.querySelector('#video_image_container');

        if (this.files) {
            [].forEach.call(this.files, readAndPreview);
        }

        function readAndPreview(file) {

// Make sure `file.name` matches our extensions criteria
            if (!/\.(jpe?g|png|gif)$/i.test(file.name)) {
                return alert(file.name + " is not an image");
            } // else...

            var reader = new FileReader();

            reader.addEventListener("load", function() {
                var image = new Image();
                image.height = 100;
                image.title  = file.name;
                image.src    = this.result;
                preview.appendChild(image);
            });

            reader.readAsDataURL(file);

        }

    }

    document.querySelector('#upload-video').addEventListener("change", previewImages);

    $('#reset-video').click(function(){
        $("#upload-video").val('');
    });
</script>

<script>
    function delImage(id) {
        var div = document.getElementById(id);
        div.style.display = "none";
        div.classList.add("eliminata");
    }
</script>

<script>
    function EliminaImmagini() {
        var json = {}
        var array = document.getElementsByClassName('eliminata');
        var eliminati = "";
        for(i=0; i < array.length; i++){
            eliminati = eliminati + array[i].id;
        }
        console.log(eliminati);
        var xhttp = new XMLHttpRequest();
        xhttp.open("GET","ServletRimuoviImmagini?eliminati="+eliminati,true);
        xhttp.send(null);
    }
</script>


<script src="script/index.js"></script>
<script src="bootstrap/js/jquery-3.3.1.min.js"></script>
<script src="bootstrap/js/popper.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="bootstrap/js/jquery.sticky.js"></script>

</body>
</html>
