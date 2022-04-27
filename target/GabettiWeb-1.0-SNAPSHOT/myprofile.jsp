<%@ page import="model.utente.UtenteBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.agente.AgenteBean" %>
<%@ page import="UtilityClass.CompositeKeyAgenteCase" %><%--
<%--
  Created by IntelliJ IDEA.
  User: Luca
  Date: 13/03/2022
  Time: 16:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!-- Created by CodingLab |www.youtube.com/CodingLabYT-->
<html lang="en" dir="ltr">
<head>
    <meta charset="UTF-8">
    <!--<title> Responsive Sidebar Menu  | CodingLab </title>-->
    <link rel="stylesheet" href="css/myprofile.css">
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
    <link rel="shortcut icon" type="image/jpg" href="images/favicon-256x256.png"/>
    <title>Gabetti Nocera | Profilo</title>
</head>
<%
    ArrayList<CompositeKeyAgenteCase> agenteCase = null;
    AgenteBean agente = null;
    UtenteBean admin = (UtenteBean) session.getAttribute("utente");
    if (admin == null) {
        response.sendRedirect(response.encodeRedirectURL("login.jsp"));
        return;
    }
    if (admin.getRuolo().equals("Admin")) {
        ArrayList<UtenteBean> utenti = (ArrayList<UtenteBean>) session.getAttribute("array");
    } else if (admin.getRuolo().equals("Agente")) {
        agente = (AgenteBean) session.getAttribute("agente");
        agenteCase = (ArrayList<CompositeKeyAgenteCase>) session.getAttribute("appartamenti");
    }

%>
<body>
<input type="hidden" value="<%=admin.getRuolo()%>" name="ruolo" id="ruolo">
<jsp:include page="sidebar.jsp" />
<section class="home-section">
    <div class="div_user_page">
        <div class="user_page_head">
            <div class="user_head_title">
                <h1 class="head_title">Il mio profilo</h1>
            </div>
        </div>
        <div class="user_page_content">
            <div class="profile_row">
                <div class="user_col_left">
                    <div class="user_profile_pic">
                        <div class="picture_body">
                            <%if(admin.getFotoString() == null){%>
                                <img src="images/agente.jpg" height="160" width="160" alt="no photo">
                            <%}else{%>
                                <img src="data:image/png;base64,<%=admin.getFotoString()%>" height="160" width="160" alt="no photo">
                            <%}%>
                            <div class="change_pic">
                                <button type="submit" class="change_pic_button">Cambia foto</button>
                            </div>
                        </div>
                    </div>
                    <div id="divruolo" class="user_analytics">
                        <div class="num_properties_body">
                            <div class="num_properties_row">
                                <div class="num_properties_value">
                                    <div class="text_heading">
                                        <span>Numero immobili</span>
                                    </div>
                                    <div class="text_value">
                                        <%
                                            if (admin.getRuolo().equals("Agente")) {
                                                for (CompositeKeyAgenteCase keyAgenteCase : agenteCase) {
                                                    if (keyAgenteCase.getBean().getIdAgente() == agente.getIdUtente()) {
                                        %>
                                        <span><%=keyAgenteCase.getContaCase()%></span>
                                        <%
                                                }
                                            }
                                        %>
                                        <%} else {%>
                                        <span>Non è un agente</span>
                                        <%}%>
                                    </div>
                                </div>
                                <div class="num_properties_icon">
                                    <i class="icon-home"></i>
                                </div>
                            </div>
                        </div>
                        <div class="num_properties_body">
                            <div class="num_properties_row">
                                <div class="num_properties_value">
                                    <div class="text_heading">
                                        <span>Visualizzazioni totali immobili</span>
                                    </div>
                                    <div class="text_value">
                                        <%
                                            if (admin.getRuolo().equals("Agente")) {
                                                for (CompositeKeyAgenteCase keyAgenteCase : agenteCase) {
                                                    if (keyAgenteCase.getBean().getIdAgente() == agente.getIdUtente()) {
                                        %>
                                        <span><%=keyAgenteCase.getTotvisite()%></span>
                                        <%
                                                }
                                            }
                                        %>
                                        <%} else {%>
                                        <span>Non è un agente</span>
                                        <%}%>
                                    </div>
                                </div>
                                <div class="num_properties_icon">
                                    <i class="icon-bar-chart"></i>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="user_col_right">
                    <div class="user_settings">
                        <div class="user_settings_head">
                            <p>Informazioni utente</p>
                        </div>
                        <div class="user_settings_body">
                            <form class="form_user_settings" action="ServletCambiaInformazioniPersonali" method="post">
                                <div class="user_settings_fields">
                                    <div class="user_field half_size">
                                        <input type="hidden" name="idUtente" value="<%=admin.getIdUtente()%>">
                                        <label>Username</label>
                                        <input type="text" placeholder="<%=admin.getUsername()%>" name="usernameUtente">
                                    </div>
                                    <div class="user_field half_size">
                                        <label>Email</label>
                                        <input type="email" placeholder="<%=admin.getEmail()%>" name="emailUtente">
                                    </div>
                                    <div class="user_field half_size">
                                        <label>Nome</label>
                                        <input type="text" placeholder="<%=admin.getNome()%>" name="nomeUtente">
                                    </div>
                                    <div class="user_field half_size">
                                        <label>Cognome</label>
                                        <input type="text" placeholder="<%=admin.getCognome()%>" name="cognomeUtente">
                                    </div>
                                    <div class="user_field half_size">
                                        <label>Password</label>
                                        <input type="password" placeholder="********" name="passwordUtente">
                                    </div>
                                </div>
                                <div>
                                    <button type="submit" class="change_user_inf">Cambia informazioni personali</button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div id="divInformazioniAgente" class="user_settings">
                        <div class="user_settings_head">
                            <p>Informazioni agente</p>
                        </div>
                        <div class="user_settings_body">
                            <form class="form_user_settings">
                                <div class="user_settings_fields">
                                    <div class="user_field full_size">
                                        <label>Descrizione</label>
                                        <%
                                            if (admin.getRuolo().equals("Agente")) {
                                        %>
                                        <textarea rows="10"
                                                  placeholder="<%=agente.getDescrizionePersonale()%>"></textarea>
                                        <%} else {%>
                                        <textarea rows="10"
                                                  placeholder="Non è un agente"></textarea>
                                        <%}%>
                                    </div>
                                    <div class="user_field half_size">
                                        <label>Link Facebook</label>
                                        <%
                                            if (admin.getRuolo().equals("Agente")) {
                                        %>
                                        <input type="text" placeholder="<%=agente.getLinkFacebook()%>" name="linkFb" value="">
                                        <%} else {%>
                                        <input type="text" placeholder="non è un agente">
                                        <%}%>
                                    </div>
                                    <div class="user_field half_size">
                                        <label>Link Instagram</label>
                                        <%
                                            if (admin.getRuolo().equals("Agente")) {
                                        %>
                                        <input type="text" placeholder="<%=agente.getLinkInstagram()%>" value="" name="linkInsta">
                                        <%} else {%>
                                        <input type="text" placeholder="non è un agente">
                                        <%}%>
                                    </div>
                                </div>
                                <div>
                                    <button type="submit" class="change_user_inf">Cambia informazioni agente</button>
                                </div>
                            </form>
                        </div>
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
    document.getElementById("Selector").onchange = changeListener;

    function changeListener() {
        var value = this.value
        console.log(value);

        if ((value == "Agente") || (value == "Collaboratore")) {
            $('#info_agente').slideDown();
        } else {
            $('#info_agente').slideUp();
        }

        if (value == "Collaboratore") {
            $('#div_agente').slideDown();
        } else {
            $('#div_agente').slideUp();
        }


    }

</script>


<script src="script/index.js"></script>
<script src="bootstrap/js/jquery-3.3.1.min.js"></script>
<script src="bootstrap/js/popper.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="bootstrap/js/jquery.sticky.js"></script>
<script>
    $(document).ready(function () {
        var ruolo = $('#ruolo').val();
        console.log("porcodio")
        if (ruolo != "Agente") {
            $('#divruolo').hide();
            $('#divInformazioniAgente').hide();
        }
    });
</script>

</body>
</html>