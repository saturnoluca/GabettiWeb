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
<%
    CompositeKeyAgenteCase agenteCase = null;
    AgenteBean agente = null;
    UtenteBean admin = (UtenteBean) session.getAttribute("utente");
    if (admin == null) {
        response.sendRedirect(response.encodeRedirectURL("login.jsp"));
        return;
    }
    if (admin.getRuolo().equals("Agente") || admin.getRuolo().equals("Collaboratore")) {
        agente = (AgenteBean) session.getAttribute("agente");
        agenteCase = (CompositeKeyAgenteCase) session.getAttribute("appartamenti");
    }

    String inviata = (String) request.getSession().getAttribute("inviata");
    request.getSession().setAttribute("inviata","no");
%>
<!DOCTYPE html>
<html lang="it" dir="ltr">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="css/myprofile.css">

    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">

    <link rel="stylesheet" href="icomoon/style.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <link rel="stylesheet" href="bootstrapcss/owl.carousel.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="shortcut icon" type="image/jpg" href="images/favicon-256x256.png"/>
    <title>Gabetti Nocera | <%=admin.getNome() + " " + admin.getCognome()%>></title>
</head>

<body>
<input type="hidden" value="<%=inviata%>" id="inviata">
<jsp:include page="sidebar.jsp"/>
<section class="home-section">
    <input type="hidden" id="ruolo" value="<%=admin.getRuolo()%>">
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
                            <%if (admin.getFotoString() == null) {%>
                            <img src="images/agente.jpg" height="160" width="160" alt="no photo">
                            <%} else {%>
                            <img src="data:image/png;base64,<%=admin.getFotoString()%>" id="file-ip-1-preview"
                                 height="160" width="160" alt="no photo">
                            <%}%>
                            <div class="change_pic">
                                <p>
                                    <a class="change_pic_button" data-toggle="collapse" href="#collapseExample"
                                       role="button" aria-expanded="false" aria-controls="collapseExample">
                                        Cambia Foto
                                    </a>
                                </p>
                                <form action="CambiaFotoProfilo" enctype="multipart/form-data" method="post">
                                    <div class="collapse" id="collapseExample">
                                        <div class="card card-body">
                                            <input name="foto" type="file" id="file-ip-1" accept="images/*"
                                                   onchange="previewBeforeUpload(event);">
                                            <input type="hidden" name="idUtente" value="<%=admin.getIdUtente()%>">
                                            <label for="file-ip-1">Carica Immagine</label>
                                            <div class="choices-foto">
                                                <button type="submit" onclick="location.reload();"
                                                        class="change_pic_button">Annulla
                                                </button>
                                                <button type="submit" class="change_pic_button">Conferma</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
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
                                            if (admin.getRuolo().equals("Agente") || admin.getRuolo().equals("Collaboratore")) {

                                        %>
                                        <span><%=agenteCase.getContaCase()%></span>
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
                                            if (admin.getRuolo().equals("Agente")  || admin.getRuolo().equals("Collaboratore")) {
                                        %>
                                        <span><%=agenteCase.getTotvisite()%></span>
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
                            <form class="form_user_settings" action="CambiaInformazioniPersonali" method="post" id="form_informazioni_personali">
                                <div class="user_settings_fields">
                                    <div class="user_field half_size">
                                        <input id="idUtente" type="hidden" name="idUtente" value="<%=admin.getIdUtente()%>">
                                        <label>Username</label>
                                        <input type="text" placeholder="<%=admin.getUsername()%>" value="<%=admin.getUsername()%>" name="usernameUtente" id="username">
                                        <i class="icon-check-circle"></i>
                                        <i class="icon-exclamation-circle"></i>
                                        <small>Error message</small>
                                    </div>
                                    <div class="user_field half_size">
                                        <label>Email</label>
                                        <input type="email" placeholder="<%=admin.getEmail()%>" value="<%=admin.getEmail()%>" name="emailUtente" id="email">
                                        <i class="icon-check-circle"></i>
                                        <i class="icon-exclamation-circle"></i>
                                        <small>Error message</small>
                                    </div>
                                    <div class="user_field half_size">
                                        <label>Nome</label>
                                        <input type="text" placeholder="<%=admin.getNome()%>" value="<%=admin.getNome()%>" name="nomeUtente" id="nome">
                                        <i class="icon-check-circle"></i>
                                        <i class="icon-exclamation-circle"></i>
                                        <small>Error message</small>
                                    </div>
                                    <div class="user_field half_size">
                                        <label>Cognome</label>
                                        <input type="text" placeholder="<%=admin.getCognome()%>" value="<%=admin.getCognome()%>" name="cognomeUtente" id="cognome">
                                        <i class="icon-check-circle"></i>
                                        <i class="icon-exclamation-circle"></i>
                                        <small>Error message</small>
                                    </div>
                                    <div class="user_field half_size">
                                        <div class="password_div">
                                            <label>Password</label>
                                            <input id="mostra_password" type="button" value="Mostra Password" onclick="MostraPassword()">
                                        </div>
                                        <input type="password" placeholder="********" value="<%=admin.getPassword()%>" name="passwordUtente" id="passwordUtente">
                                        <i class="icon-check-circle"></i>
                                        <i class="icon-exclamation-circle"></i>
                                        <small>Error message</small>
                                    </div>
                                </div>
                                <div>
                                    <button type="submit" class="change_user_inf" onclick="return checkInputs();">Cambia informazioni personali</button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div id="divInformazioniAgente" class="user_settings">
                        <div class="user_settings_head">
                            <p>Informazioni agente</p>
                        </div>
                        <div class="user_settings_body">
                            <form class="form_user_settings" action="CambiaInformazioniAgente" method="post" id="form_dati_agente">
                                <%if (admin.getRuolo().equals("Agente") || admin.getRuolo().equals("Collaboratore")) {%>
                                <input type="hidden" name="idAgente" value="<%=agente.getIdAgente()%>">
                                <%}%>
                                <div class="user_settings_fields">
                                    <div class="user_field full_size">
                                        <label>Descrizione</label>
                                        <%
                                            if (admin.getRuolo().equals("Agente") || admin.getRuolo().equals("Collaboratore")) {
                                        %>
                                        <textarea rows="10" name="descrizioneAgente" value="<%=agente.getDescrizionePersonale()%>" id="descrizione"><%=agente.getDescrizionePersonale()%></textarea>
                                        <%}%>
                                        <i class="icon-check-circle"></i>
                                        <i class="icon-exclamation-circle"></i>
                                        <small>Error message</small>
                                    </div>
                                    <div class="user_field half_size">
                                        <label>Link Facebook</label>
                                        <%
                                            if (admin.getRuolo().equals("Agente") || admin.getRuolo().equals("Collaboratore")) {
                                                if(agente.getLinkFacebook() == null || agente.getLinkFacebook().equals("")){
                                        %>
                                                    <input type="text" placeholder="Inserisci link Facebook" name="linkFacebook" id="facebook">

                                                <%} else {%>
                                                    <input type="text" placeholder="<%=agente.getLinkFacebook()%>" value="<%=agente.getLinkFacebook()%>" name="linkFacebook" id="facebook">
                                        <%}}%>
                                        <i class="icon-check-circle"></i>
                                        <i class="icon-exclamation-circle"></i>
                                        <small>Error message</small>
                                    </div>
                                    <div class="user_field half_size">
                                        <label>Link Instagram</label>
                                        <%
                                            if (admin.getRuolo().equals("Agente") || admin.getRuolo().equals("Collaboratore")) {
                                                if(agente.getLinkInstagram() == null || agente.getLinkInstagram().equals("")){
                                        %>
                                                    <input type="text" placeholder="Inserisci link Instagram" name="linkInstagram" id="instagram">
                                                <%} else {%>
                                                    <input type="text" placeholder="<%=agente.getLinkInstagram()%>" value="<%=agente.getLinkInstagram()%>" name="linkInstagram" id="instagram">
                                        <%}}%>
                                        <i class="icon-check-circle"></i>
                                        <i class="icon-exclamation-circle"></i>
                                        <small>Error message</small>
                                    </div>
                                    <div class="user_field half_size">
                                        <label>Numero Cellulare</label>
                                        <%
                                            if (admin.getRuolo().equals("Agente") || admin.getRuolo().equals("Collaboratore")) {
                                                if(agente.getTelefonoCellulare() != null || agente.getTelefonoCellulare().equals("")){
                                        %>
                                                    <input type="text" placeholder="<%=agente.getTelefonoCellulare()%>" value="<%=agente.getTelefonoCellulare()%>" name="numeroCellulare" id="telefono">
                                                <%} else {%>
                                                    <input type="text" placeholder="Inserisci numero di cellulare" name="numeroCellulare" id="telefono">
                                        <%}}%>
                                        <i class="icon-check-circle"></i>
                                        <i class="icon-exclamation-circle"></i>
                                        <small>Error message</small>
                                    </div>
                                </div>
                                <div>
                                    <button type="submit" class="change_user_inf" onclick="return checkInputsAgente();">Cambia informazioni agente</button>
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
    document.getElementById("Selector").onchange = changeListener;

    function changeListener() {
        var value = this.value

        if ((value == "Agente") || (value == "Collaboratore")) {
            $('#info_agente').slideDown();
        } else {
            $('#info_agente').slideUp();
        }
    }
</script>

<script>
    function previewBeforeUpload(event) {
        if (event.target.files.length > 0) {
            var src = URL.createObjectURL(event.target.files[0]);
            var preview = document.getElementById("file-ip-1-preview");
            preview.src = src;
        }
    }
</script>

<script src="script/myuser.js"></script>
<script src="script/index.js"></script>
<script src="bootstrap/js/jquery-3.3.1.min.js"></script>
<script src="bootstrap/js/popper.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="bootstrap/js/jquery.sticky.js"></script>
<script>
    $(document).ready(function () {
        var ruolo = $('#ruolo').val();
        if ((ruolo != "Agente") && (ruolo != "Collaboratore")) {
            $('#divruolo').hide();
            $('#divInformazioniAgente').hide();
        }
    });
</script>
<script>
    const inviata = document.getElementById("inviata");
    if(inviata.value.trim() == "ok"){
        swal("Successo!", "I tuoi dati sono stati modificati con successo!", "success");
    }
</script>

</body>
</html>