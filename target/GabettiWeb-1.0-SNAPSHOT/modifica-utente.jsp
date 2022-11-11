<%@ page import="model.utente.UtenteBean" %>
<%@ page import="model.utente.UtenteBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="UtilityClass.UtenteAgente" %>
<%@ page import="model.agente.AgenteBean" %><%--
  Created by IntelliJ IDEA.
  User: Luca
  Date: 16/03/2022
  Time: 10:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!-- Created by CodingLab |www.youtube.com/CodingLabYT-->
<html lang="it" dir="ltr">
<head>
    <title>Gabetti - Modifica Utente</title>
    <link rel="shortcut icon" type="image/jpg" href="images/favicon-256x256.png"/>
    <meta charset="UTF-8">
    <!--<title> Responsive Sidebar Menu  | CodingLab </title>-->
    <link rel="stylesheet" href="css/amministratoreagente.css">
    <!-- Boxicons CDN Link -->
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">

    <link rel="stylesheet" href="icomoon/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <link rel="stylesheet" href="bootstrapcss/owl.carousel.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
</head>

<%
    UtenteBean utente = (UtenteBean) session.getAttribute("utente");
    if (utente == null) {
        response.sendRedirect(response.encodeRedirectURL("login.jsp"));
        return;
    }
    if (!utente.getRuolo().equals("Admin") && !utente.getRuolo().equals("Segretario")) {
        response.sendRedirect(response.encodeRedirectURL("login.jsp"));
        return;
    }

    ArrayList<UtenteBean> listaUtenti = (ArrayList<UtenteBean>) request.getAttribute("lista-utenti");
    ArrayList<AgenteBean> listaAgenti = (ArrayList<AgenteBean>) request.getAttribute("lista-agenti");
    UtenteAgente utenteDaMoficare = (UtenteAgente) request.getAttribute("utenteDaModificare");
    if (utenteDaMoficare == null) {
        response.sendRedirect(response.encodeRedirectURL("lista-utenti.jsp"));
        return;
    }

%>
<body>
<jsp:include page="sidebar.jsp" />
<section class="home-section">
    <div class="div_addUser_page">
        <div class="addUser_page_head">
            <div class="addUser_head_title">
                <h1 class="head_title">Modifica Utente</h1>
            </div>
        </div>
        <div class="addUser_page_content">
            <form class="form_addUser" action="ModificaUtente" id="form_modifica_utente" method="post" enctype="multipart/form-data">
                <div class="addUser_tab">
                    <h3 class="tab_title">Informazioni generali</h3>
                </div>
                <div class="addUser_content">
                    <div class="form_content_fields">
                        <div class="content_fields_row">
                            <input type="hidden" name="idUtente" value="<%=utenteDaMoficare.getIdUtente()%>">
                            <div class="user_general">
                                <div class="content_fields_column half_size">
                                    <label class="label_user_title">Nome*</label>
                                    <input id="nome" type="text" placeholder="Inserisci il nome" value="<%=utenteDaMoficare.getNome()%>" name="nome">
                                    <i class="icon-check-circle"></i>
                                    <i class="icon-exclamation-circle"></i>
                                    <small>Error message</small>
                                </div>
                                <div class="content_fields_column half_size">
                                    <label class="label_user_title">Cognome*</label>
                                    <input id="cognome" type="text" placeholder="Inserisci il cognome" value="<%=utenteDaMoficare.getCognome()%>" name="cognome">
                                    <i class="icon-check-circle"></i>
                                    <i class="icon-exclamation-circle"></i>
                                    <small>Error message</small>
                                </div>
                                <div class="content_fields_column half_size">
                                    <label class="label_user_title">Email*</label>
                                    <input id="vecchiaEmail" type="hidden" value="<%=utenteDaMoficare.getEmail()%>">
                                    <input id="email" type="text" placeholder="Inserisci l'email" value="<%=utenteDaMoficare.getEmail()%>" name="email">
                                    <i class="icon-check-circle"></i>
                                    <i class="icon-exclamation-circle"></i>
                                    <small>Error message</small>
                                </div>
                                <div class="content_fields_column half_size">
                                    <label class="label_user_title">Username</label>
                                    <input id="vecchioUsername" type="hidden" value="<%=utenteDaMoficare.getUsername()%>">
                                    <input id="username" type="text" placeholder="Inserisci username" value="<%=utenteDaMoficare.getUsername()%>" name="username">
                                    <i class="icon-check-circle"></i>
                                    <i class="icon-exclamation-circle"></i>
                                    <small>Error message</small>
                                </div>
                                <div class="content_fields_column half_size">
                                    <div class="password_div">
                                        <label class="label_user_title">Password</label>
                                        <input id="mostra_password" type="button" value="Mostra Password" onclick="MostraPassword()">
                                    </div>
                                    <input id="password" type="password" value="<%=utenteDaMoficare.getPassword()%>" placeholder="Inserisci una password" name="password">
                                    <i class="icon-check-circle"></i>
                                    <i class="icon-exclamation-circle"></i>
                                    <small>Error message</small>
                                </div>
                                <div class="content_fields_column half_size">
                                    <label class="label_user_title">Ruolo</label>
                                    <select id="Selector" name="ruolo">
                                        <option value="" selected disabled>Seleziona ruolo utente</option>
                                        <%if(utenteDaMoficare.getRuolo().equals("Admin")){%>
                                        <option selected value="Admin">Admin</option>
                                        <%}else{%>
                                        <option value="Admin">Admin</option>
                                        <%}%>
                                        <%if(utenteDaMoficare.getRuolo().equals("Segretario")){%>
                                        <option selected value="Segretario">Segretario</option>
                                        <%}else{%>
                                        <option value="Segretario">Segretario</option>
                                        <%}%>
                                        <%if(utenteDaMoficare.getRuolo().equals("Agente")){%>
                                        <option selected value="Agente">Agente</option>
                                        <%}else{%>
                                        <option value="Agente">Agente</option>
                                        <%}%>
                                        <%if(utenteDaMoficare.getRuolo().equals("Collaboratore")){%>
                                        <option selected value="Collaboratore">Collaboratore</option>
                                        <%}else{%>
                                        <option value="Collaboratore">Collaboratore</option>
                                        <%}%>
                                    </select>
                                    <i class="icon-check-circle"></i>
                                    <i class="icon-exclamation-circle"></i>
                                    <small>Error message</small>
                                </div>
                                <div class="content_fields_column half_size" id="div_agente" style="display: none;">
                                    <label class="label_user_title">Collaborazione agente</label>
                                    <select id="agente" name="idAgente">
                                        <option value="" selected disabled>Seleziona collaborazione agente</option>
                                        <%
                                            for (UtenteBean bean : listaUtenti) {
                                                if (bean.getRuolo().equals("Agente")) {
                                                    for(AgenteBean agente : listaAgenti){
                                                        if(utenteDaMoficare.getIdUtente() != agente.getIdUtente()){
                                                        if(bean.getIdUtente() == agente.getIdUtente()){
                                                        if(utenteDaMoficare.getCollaboratore() == agente.getIdAgente()){%>
                                                            <option selected value="<%=agente.getIdAgente()%>"><%=bean.getNome() + " " + bean.getCognome()%></option>
                                                        <%}else{%>
                                                            <option value="<%=agente.getIdAgente()%>"><%=bean.getNome() + " " + bean.getCognome()%></option>
                                                        <%}
                                                    }
                                                        }
                                                        }
                                                }
                                            }
                                        %>
                                    </select>
                                    <i class="icon-check-circle"></i>
                                    <i class="icon-exclamation-circle"></i>
                                    <small>Error message</small>
                                </div>
                            </div>
                            <div class="user_otherInfo" id="info_agente" style="display: none;">
                                <h3 class="tab_title" style="margin-bottom:50px;">Informazioni Agente</h3>
                                <div class="content_fields_column full_size">
                                    <label class="label_property_title">Descrizione*</label>
                                    <%if(utenteDaMoficare.getDescrizione() == null || utenteDaMoficare.getDescrizione().length() == 0){%>
                                        <textarea id="descrizione" rows="10"  placeholder="Inserisci una descrizione" name="descrizionePersonale"></textarea>
                                    <%}else if(utenteDaMoficare.getDescrizione().length() > 0){%>
                                        <textarea id="descrizione" rows="10" name="descrizionePersonale"><%=utenteDaMoficare.getDescrizione()%></textarea>
                                    <%}%>
                                    <i class="icon-check-circle"></i>
                                    <i class="icon-exclamation-circle"></i>
                                    <small>Error message</small>
                                </div>
                                <div class="content_fields_column half_size">
                                    <label class="label_user_title">Link Facebook</label>
                                    <%if(utenteDaMoficare.getLinkFacebook() == null || utenteDaMoficare.getLinkFacebook().length() == 0){%>
                                        <input id="facebook" type="text" placeholder="Inserisci link profilo facebook" name="linkFacebook">
                                    <%}else if(utenteDaMoficare.getLinkFacebook().length() > 0){%>
                                        <input id="facebook" type="text" placeholder="Inserisci il link Facebook" value="<%=utenteDaMoficare.getLinkFacebook()%>" name="linkFacebook">
                                    <%}%>
                                    <i class="icon-check-circle"></i>
                                    <i class="icon-exclamation-circle"></i>
                                    <small>Error message</small>
                                </div>
                                <div class="content_fields_column half_size">
                                    <label class="label_user_title">Link Instagram</label>
                                    <%if(utenteDaMoficare.getLinkInstragram() == null || utenteDaMoficare.getLinkInstragram().length() == 0){%>
                                        <input id="instagram" type="text" placeholder="Inserisci link profilo instagram" name="linkInstagram">
                                    <%}else if(utenteDaMoficare.getLinkInstragram().length() > 0){%>
                                        <input id="instagram" type="text" placeholder="Inserisci il link Instagram" value="<%=utenteDaMoficare.getLinkInstragram()%>" name="linkInstagram">
                                    <%}%>
                                    <i class="icon-check-circle"></i>
                                    <i class="icon-exclamation-circle"></i>
                                    <small>Error message</small>
                                </div>
                                <div class="content_fields_column half_size">
                                    <label class="label_user_title">Cellulare</label>
                                    <%if(utenteDaMoficare.getTelefono() == null || utenteDaMoficare.getTelefono().length() == 0){%>
                                    <input id="telefono" type="text" placeholder="Inserisci il Telefono" name="telefono">
                                    <%}else if(utenteDaMoficare.getTelefono().length() > 0){%>
                                    <input id="telefono" type="text" placeholder="Inserisci il numero cellulare" value="<%=utenteDaMoficare.getTelefono()%>" name="telefono">
                                    <%}%>
                                    <i class="icon-check-circle"></i>
                                    <i class="icon-exclamation-circle"></i>
                                    <small>Error message</small>
                                </div>
                            </div>
                            <div class="property_multimedia">
                                <h3 class="tab_title">Multimedia</h3>
                                <div class="container_gallery">
                                    <div class="wrapper">
                                        <div class="image">
                                            <img id="preview" src="data:image/png;base64,<%=utenteDaMoficare.getFotoString()%>" alt="">
                                        </div>
                                        <div class="content">
                                            <div class="icon">
                                                <i class="fas fa-cloud-upload-alt"></i>
                                            </div>
                                            <div class="text">
                                                Nessuna immagine selezionata
                                            </div>
                                        </div>
                                        <div id="cancel-btn">
                                            <i class="fas fa-times"></i>
                                        </div>
                                    </div>
                                    <div class="custom_button"></div>
                                    <button type="button" onclick="defaultBtnActive()" id="custom-btn">Seleziona un'immagine</button>
                                    <input id="default-btn" type="file" hidden name="foto" value="<%=utenteDaMoficare.getFoto()%>">
                                </div>
                            </div>
                        </div>
                        <div class="div_button_submit">
                            <input type="submit" value="Modifica Utente" onclick="return checkInputs();">
                        </div>
                    </div>
                </div>

            </form>
        </div>
    </div>
</section>

<script>
    const wrapper = document.querySelector(".wrapper");
    const fileName = document.querySelector(".file-name");
    const defaultBtn = document.querySelector("#default-btn");
    const customBtn = document.querySelector("#custom-btn");
    const cancelBtn = document.querySelector("#cancel-btn i");
    const img = document.querySelector("#preview");
    let divText = document.querySelector(".content");
    let regExp = /[0-9a-zA-Z\^\&\'\@\{\}\[\]\,\$\=\!\-\#\(\)\.\%\+\~\_ ]+$/;
    function defaultBtnActive() {
        defaultBtn.click();
    }
    defaultBtn.addEventListener("change", function(){
        const file = this.files[0];
        if(file) {
            const reader = new FileReader();
            reader.onload = function () {
                const result = reader.result;
                img.src = result;
                wrapper.classList.add("active");
                divText.style.display = "none";
            }
            cancelBtn.addEventListener("click", function () {
                img.src = "";
                wrapper.classList.remove("active");
                divText.style.display = "block";
            })
            reader.readAsDataURL(file);
        }
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
<script>
    $( document ).ready(function() {
        var value = document.getElementById("Selector").value;
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
    });
</script>

<script src="script/modifica-utente.js"></script>
<script src="script/index.js"></script>
<script src="bootstrap/js/jquery-3.3.1.min.js"></script>
<script src="bootstrap/js/popper.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="bootstrap/js/jquery.sticky.js"></script>


</body>
</html>
