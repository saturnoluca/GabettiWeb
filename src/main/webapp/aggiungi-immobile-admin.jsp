<%@ page import="model.utente.UtenteBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.agente.AgenteBean" %>
<%@ page import="UtilityClass.CompositeKeyAgenteCase" %><%--
  Created by IntelliJ IDEA.
  User: Luca
  Date: 12/03/2022
  Time: 14:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<!-- Created by CodingLab |www.youtube.com/CodingLabYT-->
<html lang="it" dir="ltr">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
    <title>Gabetti Nocera | Aggiungi Immobile</title>
    <link rel="shortcut icon" type="image/jpg" href="images/favicon-256x256.png"/>
    <!--<title> Responsive Sidebar Menu  | CodingLab </title>-->
    <link rel="stylesheet" href="css/amministratoreagente.css">
    <link rel="stylesheet" href="css/style1.css">
    <!-- Boxicons CDN Link -->
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">

    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&libraries=places&key=AIzaSyCNvsKhyzYjIrmKtBJRIkaxz1-GZFIwROs"></script>
    <link rel="stylesheet" href="icomoon/style.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <link rel="stylesheet" href="bootstrapcss/owl.carousel.min.css">
    <script src="script/index.js"></script>
    <script src="bootstrap/js/jquery-3.3.1.min.js"></script>
    <script src="bootstrap/js/popper.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="bootstrap/js/jquery.sticky.js"></script>
    <script src="script/script-regione.js"></script>
    <script src="script/script-provincia.js"></script>
    <script src="script/script-citta.js"></script>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <script src="script/aggiungi-immobile.js"></script>
</head>

<%
    AgenteBean agente = null;
    UtenteBean admin = (UtenteBean) session.getAttribute("utente");
    if (admin == null) {
        response.sendRedirect(response.encodeRedirectURL("login.jsp"));
        return;
    }
    ArrayList<UtenteBean> utentiRuolo = (ArrayList<UtenteBean>) request.getAttribute("utentiRuolo");
    if (utentiRuolo == null) {
        response.sendRedirect(response.encodeRedirectURL("login.jsp"));
        return;
    }
%>
<body>
<jsp:include page="sidebar.jsp"/>
<section class="home-section">
    <div class="div_addProperty_page">
        <div class="addProperty_page_head">
            <div class="addProperty_head_title">
                <h1 class="head_title">Aggiungi immobile</h1>
            </div>
        </div>
        <div class="addProperty_page_content">
            <form class="form_addProperty" action="AggiungiAppartamento" method="post" id="form_add_immobile">
                <input type="hidden" name="ruolo" value="<%=admin.getRuolo()%>">
                <div class="addProperty_tab">
                    <h3 class="tab_title">Informazioni generali</h3>
                </div>
                <div class="addProperty_content">
                    <div class="form_content_fields">
                        <div class="content_fields_row">
                            <div class="property_title">
                                <div class="content_fields_column full_size">
                                    <label class="label_property_title">Titolo immobile</label>
                                    <input type="text" placeholder="Inserisci titolo immobile" name="titoloImmobile" id="titoloImmobile">
                                    <i class="icon-check-circle"></i>
                                    <i class="icon-exclamation-circle"></i>
                                    <small>Error message</small>
                                </div>
                            </div>
                            <div class="property_address">
                                <div class="content_fields_column half_size">
                                    <label class="label_property_title">Regione</label>
                                    <input type="hidden" id="hidden_regione" name="hidden_regione">
                                    <div class="wrapper" id="wrapper-regione">
                                        <div class="select-btn" id="select-btn-regione" onclick="apriRegione()">
                                            <span class="text_select">Select Regione</span>
                                            <i class="uil uil-angle-down"></i>
                                        </div>
                                        <div class="content">
                                            <div class="search">
                                                <i class="uil uil-search"></i>
                                                <input id="input-regione" spellcheck="false" type="text" placeholder="Cerca">
                                            </div>
                                            <ul class="options" id="options-regione"></ul>
                                        </div>
                                    </div>
                                    <i class="icon-check-circle"></i>
                                    <i class="icon-exclamation-circle"></i>
                                    <small>Error message</small>
                                </div>
                                <div class="content_fields_column half_size">
                                    <label class="label_property_title">Provincia</label>
                                    <input type="hidden" id="hidden_provincia" name="hidden_provincia">
                                    <div class="wrapper" id="wrapper-provincia">
                                        <div class="select-btn" id="select-btn-provincia" onclick="apriProvincia()">
                                            <span class="text_select">Seleziona Provincia</span>
                                            <i class="uil uil-angle-down"></i>
                                        </div>
                                        <div class="content">
                                            <div class="search">
                                                <i class="uil uil-search"></i>
                                                <input id="input-provincia" spellcheck="false" type="text" placeholder="Cerca">
                                            </div>
                                            <ul class="options" id="options-provincia"></ul>
                                        </div>
                                    </div>
                                    <i class="icon-check-circle"></i>
                                    <i class="icon-exclamation-circle"></i>
                                    <small>Error message</small>
                                </div>
                                <div class="content_fields_column half_size">
                                    <label class="label_property_title">Città</label>
                                    <input type="hidden" id="hidden_citta" name="hidden_citta">
                                    <div class="wrapper" id="wrapper-citta">
                                        <div class="select-btn" id="select-btn-citta" onclick="apriCitta()">
                                            <span class="text_select">Seleziona Città</span>
                                            <i class="uil uil-angle-down"></i>
                                        </div>
                                        <div class="content">
                                            <div class="search">
                                                <i class="uil uil-search"></i>
                                                <input id="input-citta" spellcheck="false" type="text" placeholder="Cerca">
                                            </div>
                                            <ul class="options" id="options-citta"></ul>
                                        </div>
                                    </div>
                                    <i class="icon-check-circle"></i>
                                    <i class="icon-exclamation-circle"></i>
                                    <small>Error message</small>
                                </div>
                                <div class="content_fields_column half_size">
                                    <label class="label_property_title">CAP</label>
                                    <input type="text" placeholder="Inserisci il CAP" name="cap" id="cap" disabled onchange="apriIndirizzo()">
                                    <i class="icon-check-circle"></i>
                                    <i class="icon-exclamation-circle"></i>
                                    <small>Error message</small>
                                </div>
                                <div class="content_fields_column half_size">
                                    <label class="label_property_title">Indirizzo*</label>
                                    <input type="text" placeholder="Inserisci l'indirizzo" name="indirizzo" id="indirizzo" disabled onchange="apriNumeroCivico()">
                                    <i class="icon-check-circle"></i>
                                    <i class="icon-exclamation-circle"></i>
                                    <small>Error message</small>
                                </div>
                                <div class="content_fields_column half_size">
                                    <label class="label_property_title">Numero civico</label>
                                    <input type="text" placeholder="Inserisci il numero civico" name="numeroCivico" id="numeroCivico" value="" disabled onchange="apriZona()">
                                    <i class="icon-check-circle"></i>
                                    <i class="icon-exclamation-circle"></i>
                                    <small>Error message</small>
                                </div>
                                <div class="content_fields_column half_size">
                                    <label class="label_property_title">Zona</label>
                                    <input type="text" placeholder="Inserisci la zona" name="zona" id="zona" value="" disabled>
                                    <i class="icon-check-circle"></i>
                                    <i class="icon-exclamation-circle"></i>
                                    <small>Error message</small>
                                </div>
                            </div>
                            <div class="property_description">
                                <div class="content_fields_column full_size">
                                    <label class="label_property_title">Descrizione</label>
                                    <textarea rows="10" placeholder="Scrivi una descrizione" name="descrizione" id="descrizione"></textarea>
                                    <i class="icon-check-circle"></i>
                                    <i class="icon-exclamation-circle"></i>
                                    <small>Error message</small>
                                </div>
                            </div>
                            <div class="property_features">
                                <div class="content_fields_column half_size">
                                    <label class="label_property_title">Prezzo</label>
                                    <input type="text" placeholder="Inserisci il prezzo" name="prezzo" id="prezzo">
                                    <i class="icon-check-circle"></i>
                                    <i class="icon-exclamation-circle"></i>
                                    <small>Error message</small>
                                </div>
                                <div class="content_fields_column half_size">
                                    <label class="label_property_title">Mostare il prezzo</label>
                                    <select name="visualizzazionePrezzo" id="mostraPrezzo">
                                        <option value="" selected disabled>Seleziona se mostrare il prezzo</option>
                                        <option value="Si">SI</option>
                                        <option value="No">NO</option>
                                    </select>
                                    <i class="icon-check-circle"></i>
                                    <i class="icon-exclamation-circle"></i>
                                    <small>Error message</small>
                                </div>
                                <div class="content_fields_column half_size">
                                    <label class="label_property_title">Tipo immobile</label>
                                    <select name="tipoImmobile" id="tipoImmobile">
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
                                    <i class="icon-check-circle"></i>
                                    <i class="icon-exclamation-circle"></i>
                                    <small>Error message</small>
                                </div>
                                <div class="content_fields_column half_size">
                                    <label class="label_property_title">Stato immobile</label>
                                    <select name="statoImmobile" id="statoImmobile">
                                        <option value="" selected disabled>Seleziona stato immobile</option>
                                        <option value="In Vendita">In Vendita</option>
                                        <option value="In Affitto">In Affitto</option>
                                    </select>
                                    <i class="icon-check-circle"></i>
                                    <i class="icon-exclamation-circle"></i>
                                    <small>Error message</small>
                                </div>
                                <div class="content_fields_column half_size">
                                    <label class="label_property_title">Superficie in mq</label>
                                    <input type="text" placeholder="Inserisci la superficie in mq" name="superficie" id="superficie">
                                    <i class="icon-check-circle"></i>
                                    <i class="icon-exclamation-circle"></i>
                                    <small>Error message</small>
                                </div>
                                <div class="content_fields_column half_size">
                                    <label class="label_property_title">Numero Locali</label>
                                    <input type="text" placeholder="Inserisci il numero dei locali" name="locali" id="locali">
                                    <i class="icon-check-circle"></i>
                                    <i class="icon-exclamation-circle"></i>
                                    <small>Error message</small>
                                </div>
                                <div class="content_fields_column half_size">
                                    <label class="label_property_title">Piano</label>
                                    <select name="piano" id="piano">
                                        <option value="" selected disabled>Seleziona piano immobile</option>
                                        <option value="Interrato Seminterrato">Interrato / Seminterrato</option>
                                        <option value="Piano terra">Piano terra</option>
                                        <option value="Piano rialzato">Piano rialzato</option>
                                        <option value="1 piano">1° Piano</option>
                                        <option value="2 piano">2° Piano</option>
                                        <option value="3 piano">3° Piano</option>
                                        <option value="4 piano">4° Piano</option>
                                        <option value="5 piano e oltre">5° Piano e oltre</option>
                                        <option value="Attico">Attico</option>
                                        <option value="Basso">Basso</option>
                                        <option value="Medio">Medio</option>
                                        <option value="Alto">Alto</option>
                                    </select>
                                    <i class="icon-check-circle"></i>
                                    <i class="icon-exclamation-circle"></i>
                                    <small>Error message</small>
                                </div>
                                <div class="content_fields_column half_size">
                                    <label class="label_property_title">Posti auto</label>
                                    <input type="text" placeholder="Inserisci il numero dei posti auto" name="postiAuto" id="postiAuto">
                                    <i class="icon-check-circle"></i>
                                    <i class="icon-exclamation-circle"></i>
                                    <small>Error message</small>
                                </div>
                                <div class="content_fields_column half_size">
                                    <label class="label_property_title">Numero Bagni</label>
                                    <input type="text" placeholder="Inserisci il numero dei bagni" name="numeroBagni" id="numeroBagni">
                                    <i class="icon-check-circle"></i>
                                    <i class="icon-exclamation-circle"></i>
                                    <small>Error message</small>
                                </div>
                                <div class="content_fields_column half_size">
                                    <label class="label_property_title">Numero Camere Da Letto</label>
                                    <input type="text" placeholder="Inserisci il numero delle camere da letto" name="camereLetto" id="camereLetto">
                                    <i class="icon-check-circle"></i>
                                    <i class="icon-exclamation-circle"></i>
                                    <small>Error message</small>
                                </div>
                                <div class="content_fields_column half_size">
                                    <label class="label_property_title">Riscaldamento</label>
                                    <select name="riscaldamento" id="riscaldamento">
                                        <option value="" selected disabled>Seleziona tipo riscaldamento</option>
                                        <option value="Non presente">Non presente</option>
                                        <option value="Autonomo">Autonomo</option>
                                        <option value="Condominiale">Condominiale</option>
                                        <option value="Pompe di calore">Pompe di calore</option>
                                    </select>
                                    <i class="icon-check-circle"></i>
                                    <i class="icon-exclamation-circle"></i>
                                    <small>Error message</small>
                                </div>
                                <div class="content_fields_column half_size">
                                    <label class="label_property_title">Classe energetica</label>
                                    <input type="text" placeholder="Inserisci la classe energetica" name="classeEnergetica" id="classeEnergetica">
                                    <i class="icon-check-circle"></i>
                                    <i class="icon-exclamation-circle"></i>
                                    <small>Error message</small>
                                </div>
                                <%
                                    if (admin.getRuolo().equals("Agente") || admin.getRuolo().equals("Collaboratore")) {
                                %><input type="hidden" name="Agente" id="agente" value="<%=admin.getIdUtente()%>"><%
                            }else {%>
                                <div class="content_fields_column half_size">
                                    <label class="label_property_title">Agente</label>
                                    <select name="Admin" id="agente">
                                        <option value="" selected disabled>Seleziona l'agente</option>
                                        <%
                                            for (UtenteBean utenteBean : utentiRuolo) {
                                        %>
                                        <option value="<%=utenteBean.getIdUtente()%>"><%=utenteBean.getNome() + " " + utenteBean.getCognome()%>
                                        </option>
                                        <%
                                            }
                                        %>
                                    </select>
                                    <i class="icon-check-circle"></i>
                                    <i class="icon-exclamation-circle"></i>
                                    <small>Error message</small>
                                </div>
                            </div>
                            <%}%>
                        </div>
                        <div class="div_button_submit">
                            <input type="submit"  value="Aggiungi immobile" onclick="return checkInputs();">
                        </div>
                    </div>
                </div>
                <input type="hidden" name="data" value="" id="data">
            </form>
        </div>
    </div>
</section>


<script>
    $(document).ready(function () {
        var today = new Date();
        var month = today.getMonth() + 1;
        if (month < 10) {
            month = '0' + month;
        }
        var date = today.getFullYear() + '-' + month + '-' + today.getDate();
        $("#data").val(date);
    });

</script>
</body>
</html>
