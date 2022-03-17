<%@ page import="model.utente.UtenteBean" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Luca
  Date: 12/03/2022
  Time: 14:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!-- Created by CodingLab |www.youtube.com/CodingLabYT-->
<html lang="en" dir="ltr">
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

    ArrayList<UtenteBean> utenti = (ArrayList<UtenteBean>) session.getAttribute("array");
    if (utenti == null) {
        response.sendRedirect(response.encodeRedirectURL("login.jsp"));
        return;
    }

%>
<body>
<div class="sidebar">
    <div class="logo-details">
        <div class="logo_name">Gabetti</div>
        <i class='bx bx-menu' id="btn"></i>
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
                <i class='bx bx-home'></i>
                <span class="links_name">Lista immobili</span>
            </a>
            <span class="tooltip">Lista immobili</span>
        </li>
        <li>
            <a href="aggiungi-immobile-admin.html">
                <i class='bx bx-home-smile'></i>
                <span class="links_name">Aggiungi immobile</span>
            </a>
            <span class="tooltip">Aggiungi immobile</span>
        </li>
        <li>
            <a href="#">
                <i class='bx bxs-user-detail'></i>
                <span class="links_name">Lista utenti</span>
            </a>
            <span class="tooltip">Lista utenti</span>
        </li>
        <li>
            <a href="aggiungi-utente.html">
                <i class='bx bx-user-plus'></i>
                <span class="links_name">Aggiungi utente</span>
            </a>
            <span class="tooltip">Aggiungi utente</span>
        </li>
        <li class="profile">
            <div class="profile-details">
                <img src="images/agente.jpg" alt="profileImg">
                <div class="name_job">
                    <div class="name"><%=admin.getNome() + " " + admin.getCognome()%>
                    </div>
                    <div class="job">Amministratore</div>
                </div>
            </div>
            <i class='bx bx-log-out' id="log_out"></i>
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
            <form class="form_addProperty" action="/SalvaAppartamento" method="post">
                <input type="hidden" name="ruolo" value="<%=admin.getRuolo()%>">
                <div class="addProperty_tab">
                    <h3 class="tab_title">Informazioni generali</h3>
                </div>
                <div class="addProperty_content">
                    <div class="form_content_fields">
                        <div class="content_fields_row">
                            <div class="property_title">
                                <div class="content_fields_column full_size">
                                    <label class="label_property_title">Titolo immobile*</label>
                                    <input type="text" required placeholder="Inserisci titolo immobile"
                                           name="titoloImmobile">
                                </div>
                            </div>
                            <div class="property_address">
                                <div class="content_fields_column half_size">
                                    <label class="label_property_title">Città*</label>
                                    <input type="text" required placeholder="Inserisci la città" name="citta">
                                </div>
                                <div class="content_fields_column half_size">
                                    <label class="label_property_title">Provincia*</label>
                                    <input type="text" required placeholder="Inserisci la provincia" name="provincia">
                                </div>
                                <div class="content_fields_column half_size">
                                    <label class="label_property_title">Indirizzo*</label>
                                    <input type="text" required placeholder="Inserisci l'indirizzo" name="indirizzo">
                                </div>
                                <div class="content_fields_column half_size">
                                    <label class="label_property_title">Numero civico</label>
                                    <input type="text" placeholder="Inserisci il numero civico" name="numeroCivico">
                                </div>
                                <div class="content_fields_column half_size">
                                    <label class="label_property_title">CAP*</label>
                                    <input type="text" required placeholder="Inserisci il CAP" name="cap">
                                </div>
                            </div>
                            <div class="property_description">
                                <div class="content_fields_column full_size">
                                    <label class="label_property_title">Descrizione*</label>
                                    <textarea rows="10" required placeholder="Scrivi una descrizione"
                                              name="descrizione"></textarea>
                                </div>
                            </div>
                            <div class="property_features">
                                <div class="content_fields_column half_size">
                                    <label class="label_property_title">Prezzo*</label>
                                    <input type="text" required placeholder="Inserisci il prezzo" name="prezzo">
                                </div>
                                <div class="content_fields_column half_size">
                                    <label class="label_property_title">Tipo immobile*</label>
                                    <select required name="tipoImmobile">
                                        <option value="" selected disabled>Seleziona tipo immobile</option>
                                        <option value="Appartamento">Appartamento</option>
                                        <option value="Abitazione economica">Abitazione economica</option>
                                        <option value="Loft Open space ">Loft / Open Space</option>
                                        <option value="Mansarda">Mansarda</option>
                                        <option value="Stabile Palazzo">Stabile / Palazzo</option>
                                        <option value="Rustico Casale">Rustico / Casale</option>
                                        <option value="Attico">Attico</option>
                                        <option value="Villetta a schiera">Villetta a schiera</option>
                                        <option value="Appartamento di lusso">Appartamento di lusso</option>
                                    </select>
                                </div>
                                <div class="content_fields_column half_size">
                                    <label class="label_property_title">Stato appartamento*</label>
                                    <select required name="statoImmobile">
                                        <option value="" selected disabled>Seleziona stato immobile</option>
                                        <option value="In Vendita">In Vendita</option>
                                        <option value="In Affitto">In Affitto</option>
                                    </select>
                                </div>
                                <div class="content_fields_column half_size">
                                    <label class="label_property_title">Superficie in mq</label>
                                    <input type="text" required placeholder="Inserisci la superficie in mq"
                                           name="superficie">
                                </div>
                                <div class="content_fields_column half_size">
                                    <label class="label_property_title">Numero Locali</label>
                                    <input type="text" placeholder="Inserisci il numero dei locali" name="locali">
                                </div>
                                <div class="content_fields_column half_size">
                                    <label class="label_property_title">Piano</label>
                                    <select name="piano">
                                        <option value="" selected disabled>Seleziona piano immobile</option>
                                        <option value="Interrato Seminterrato">Interrato / Seminterrato</option>
                                        <option value="Piano terra">Piano terra</option>
                                        <option value="Piano rialzato">Piano rialzato</option>
                                        <option value="1 piano">1° Piano</option>
                                        <option value="2 piano">2° Piano</option>
                                        <option value="3 piano">3° Piano</option>
                                        <option value="4 piano">4° Piano</option>
                                        <option value="5 piano e oltre">5° Piano e oltre</option>
                                    </select>
                                </div>
                                <div class="content_fields_column half_size">
                                    <label class="label_property_title">Posti auto</label>
                                    <input type="text" required placeholder="Inserisci il numero dei posti auto"
                                           name="postiAuto">
                                </div>
                                <div class="content_fields_column half_size">
                                    <label class="label_property_title">Numero Bagni</label>
                                    <input type="text" required placeholder="Inserisci il numero dei bagni"
                                           name="numeroBagni">
                                </div>
                                <div class="content_fields_column half_size">
                                    <label class="label_property_title">Numero Camere Da Letto</label>
                                    <input type="text" required placeholder="Inserisci il numero delle camere da letto"
                                           name="camereLetto">
                                </div>
                                <div class="content_fields_column half_size">
                                    <label class="label_property_title">Riscaldamento</label>
                                    <select name="riscaldamento">
                                        <option value="" selected disabled>Seleziona tipo riscaldamento</option>
                                        <option value="Non presente">Non presente</option>
                                        <option value="Autonomo">Autonomo</option>
                                        <option value="Condominiale">Condominiale</option>
                                        <option value="Pompe di calore">Pompe di calore</option>
                                    </select>
                                </div>
                                <div class="content_fields_column half_size">
                                    <label class="label_property_title">Classe energetica</label>
                                    <input type="text" required placeholder="Inserisci la classe energetica"
                                           name="classeEnegertica">
                                </div>
                                <div class="content_fields_column half_size">
                                    <label class="label_property_title">Agente</label>
                                    <select name="Agente">
                                        <option value="" selected disabled>Seleziona l'agente</option>
                                        <%
                                            for (UtenteBean utenteBean : utenti) {
                                                if (utenteBean.getRuolo().equals("Agente")) {
                                        %>
                                        <option value="<%=utenteBean.getIdUtente()%>"><%=utenteBean.getNome() + " " + utenteBean.getCognome()%>
                                        </option>
                                        <%
                                                }
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>
                            <div class="property_multimedia">
                                <h3 class="tab_title">Multimedia</h3>
                                <div class="gallery_image_container" id="gallery_image_container"></div>
                                <input id="fileDragName">
                                <div class="content_gallery_images full_size">
                                    <label class="label_property_title">Immagini</label>
                                    <div class="drag_drop_container"
                                         ondragover="this.style.borderColor='#0c0'; return false;"
                                         ondragleave="this.style.borderColor='#ccc'"
                                         ondrop="getTheFile(event); return false;">
                                        <i class="icon-cloud-upload"></i>
                                        <strong>Trascina e rilascia delle immagini</strong>
                                        <span class="or">oppure</span>
                                        <div class="button_browse">Sfoglia Immagine
                                            <div class="input_file">
                                                <input type="file" multiple id="upload-photo"
                                                       onchange="readFile(event)">
                                            </div>
                                        </div>
                                        <div id="reset-image" class="button_browse">Reset
                                        </div>
                                    </div>

                                </div>
                                <div class="gallery_image_container" id="planimetria_image_container"></div>
                                <div class="content_gallery_images full_size">
                                    <label class="label_property_title">Planimetria</label>
                                    <div class="drag_drop_container">
                                        <i class="icon-cloud-upload"></i>
                                        <strong>Trascina e rilascia fino delle immagini</strong>
                                        <span class="or">oppure</span>
                                        <div class="button_browse">Sfoglia Immagine
                                            <div class="input_file">
                                                <input type="file" multiple id="upload-planimetria">
                                            </div>
                                        </div>
                                        <div id="reset-planimetria" class="button_browse">Reset
                                        </div>
                                    </div>

                                </div>
                                <div class="content_gallery_images full_size">
                                    <label class="label_property_title">Video</label>
                                    <div class="drag_drop_container">
                                        <i class="icon-cloud-upload"></i>
                                        <strong>Trascina e rilascia un video</strong>
                                        <span class="or">oppure</span>
                                        <div class="button_browse">Sfoglia Video
                                            <div class="input_file">
                                                <input type="file" id="upload-video">
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

    closeBtn.addEventListener("click", () => {
        sidebar.classList.toggle("open");
        menuBtnChange();//calling the function(optional)
    });

    searchBtn.addEventListener("click", () => { // Sidebar open when you click on the search iocn
        sidebar.classList.toggle("open");
        menuBtnChange(); //calling the function(optional)
    });

    // following are the code to change sidebar button(optional)
    function menuBtnChange() {
        if (sidebar.classList.contains("open")) {
            closeBtn.classList.replace("bx-menu", "bx-menu-alt-right");//replacing the iocns class
        } else {
            closeBtn.classList.replace("bx-menu-alt-right", "bx-menu");//replacing the iocns class
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

            reader.addEventListener("load", function () {
                var image = new Image();
                image.height = 100;
                image.title = file.name;
                image.src = this.result;
                preview.appendChild(image);
            });

            reader.readAsDataURL(file);

        }

    }

    document.querySelector('#upload-photo').addEventListener("change", previewImages);

    $('#reset-image').click(function () {
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

            reader.addEventListener("load", function () {
                var image = new Image();
                image.height = 100;
                image.title = file.name;
                image.src = this.result;
                preview.appendChild(image);
            });

            reader.readAsDataURL(file);

        }

    }

    document.querySelector('#upload-planimetria').addEventListener("change", previewImages);

    $('#reset-planimetria').click(function () {
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

            reader.addEventListener("load", function () {
                var image = new Image();
                image.height = 100;
                image.title = file.name;
                image.src = this.result;
                preview.appendChild(image);
            });

            reader.readAsDataURL(file);

        }

    }

    document.querySelector('#upload-video').addEventListener("change", previewImages);

    $('#reset-video').click(function () {
        $("#upload-video").val('');
    });
</script>

<script>
    function readFile(e) {
        var files;
        console.log("SIUM");
        if (e.target.files) {
            files = e.target.files
        } else {
            files = e.dataTransfer.files
        }
        if (files.length == 0) {
            alert('What you dropped is not a file.');
            return;
        }
        var file = files[0];
        document.getElementById('fileDragName').value = file.name
        document.getElementById('fileDragSize').value = file.size
        document.getElementById('fileDragType').value = file.type
        reader = new FileReader();
        reader.onload = function (e) {
            document.getElementById('fileDragData').value = e.target.result;
        }
        reader.readAsDataURL(file);
    }

    function getTheFile(e) {
        e.target.style.borderColor = '#ccc';
        readFile(e);
    }

    function getDate() {
        var today = new Date();
        var date = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate();
        return date;
    }


</script>


<script src="script/index.js"></script>
<script src="bootstrap/js/jquery-3.3.1.min.js"></script>
<script src="bootstrap/js/popper.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="bootstrap/js/jquery.sticky.js"></script>

</body>
</html>
