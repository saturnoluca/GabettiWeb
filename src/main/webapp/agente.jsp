<%@ page import="model.appartamento.AppartamentoBean" %>
<%@ page import="model.agente.AgenteBean" %>
<%@ page import="model.utente.UtenteBean" %>
<%@ page import="model.indirizzo.IndirizzoBean" %>
<%@ page import="model.multimedia.MultimediaBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="UtilityClass.CompositeKeyAgenteCase" %>
<%@ page import="UtilityClass.Città" %>
<%@ page import="UtilityClass.VisualizzazioneImmobile" %>
<%@ page import="javax.swing.text.AttributeSet" %><%--
  Created by IntelliJ IDEA.
  User: Luca
  Date: 25/02/2022
  Time: 16:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="it">
<%

    ArrayList<String> categorie = (ArrayList<String>) request.getSession().getAttribute("categorie");
    if (request.getAttribute("utente") == null) {
        response.sendRedirect(response.encodeRedirectURL("Index"));
        return;
    }

    UtenteBean utenteBean = (UtenteBean) request.getAttribute("utente");
    AgenteBean agenteBean = (AgenteBean) request.getAttribute("agente");


    VisualizzazioneImmobile visualizzazioneImmobile = (VisualizzazioneImmobile) request.getAttribute("featured");
    ArrayList<VisualizzazioneImmobile> arrayAppartamento = (ArrayList<VisualizzazioneImmobile>) request.getAttribute("arrayAppartamento");
    ArrayList<IndirizzoBean> arrayIndirizzo = (ArrayList<IndirizzoBean>) request.getAttribute("arrayIndirizzo");
    ArrayList<MultimediaBean> arrayMultimedia = (ArrayList<MultimediaBean>) request.getAttribute("arrayMultimedia");
    ArrayList<CompositeKeyAgenteCase> agenteCase = (ArrayList<CompositeKeyAgenteCase>) request.getAttribute("agenteCase");
    ArrayList<AppartamentoBean> inEvidenza = (ArrayList<AppartamentoBean>) request.getAttribute("inEvidenza");

    String inviata = (String) request.getSession().getAttribute("inviata");
    request.getSession().setAttribute("inviata","no");
%>

<head>
    <title>Gabetti Nocera | <%=utenteBean.getNome() + " " + utenteBean.getCognome()%></title>
    <link rel="shortcut icon" type="image/jpg" href="images/favicon-256x256.png"/>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Style -->
    <link rel="stylesheet" href="css/agente.css">
    <link rel="stylesheet" href="css/aggiunte.css">

    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link rel="stylesheet" href="fonts/icomoon/style.css">
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
    <link rel="stylesheet" href="bootstrapcss/owl.carousel.min.css">
    <script src="bootstrap/js/jquery-3.3.1.min.js"></script>
    <script src="bootstrap/js/popper.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="bootstrap/js/jquery.sticky.js"></script>
    <script src="script/index.js"></script>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <script src="script/index.js"></script>
    <script src="script/ricerca-regione.js"></script>
    <script src="script/ricerca-provincia.js"></script>
    <script src="script/ricerca-citta.js"></script>
    <script src="script/ricerca-zona.js"></script>
    <script src="script/ricerca-stato.js"></script>
    <script src="script/ricerca-tipo.js"></script>
    <script src="script/ricerca-camere.js"></script>
    <script src="script/ricerca-bagni.js"></script>
    <script src="script/ricerca-auto.js"></script>
</head>

<body>
<input type="hidden" value="<%=inviata%>" id="inviata">
<%@ include file="loader.html"%>
<nav id="navbar">
    <a href="index.jsp" class="logo">
        <img src="images/logo.png">
    </a>
    <input type="checkbox" id="click">
    <label for="click" class="menu-btn">
        <i class="icon-bars"></i>
    </label>
    <ul>
        <li><a href="index.jsp" class="active">Home</a></li>
        <li><a href="listaappartamenti.jsp">Lista Immobili</a></li>
        <li><a href="valutazione.jsp">Valutazione Immobile</a></li>
        <li><a href="listaagenti.jsp">I Nostri Agenti</a></li>
        <li><a href="contact.jsp">Contattaci</a></li>
        <li><a href="login.jsp">Area Personale</a></li>
    </ul>
</nav>
<div class="content">
    <section class="banner banner-image" style="background-image: url(images/banner.jpg);">
        <div class="banner_cover"></div>
        <div class="banner_wrap">
            <h2 class="banner_title"><%=utenteBean.getNome() + " " + utenteBean.getCognome()%>
            </h2>
        </div>
    </section>
    <div class="div_search div_search_init">
        <form class="search_form search_form_header advance_search_form" action="Ricerca" method="post">
            <div class="search_fields">
                <div class="search_wrap search_data">
                    <div class="top_fields">
                        <div class="search_select search_option">
                            <label>Regione</label>
                            <span class="search_selectwrap">
                            <div class="wrapper" id="wrapper-regione">
                                <input type="hidden" id="hidden-regione" name="hidden-regione" value="Qualsiasi">
                                <div class="select-btn" id="select-btn-regione" onclick="apriRegione()">
                                  <span class="text_select">Qualsiasi</span>
                                    <i class="uil uil-angle-down"></i>
                                </div>
                                <div class="content-search main-2">
                                  <div class="search">
                                    <i class="uil uil-search"></i>
                                    <input id="input-regione" spellcheck="false" type="text" placeholder="Cerca">
                                  </div>
                                  <ul class="options" id="options-regione"></ul>
                                </div>
                            </div>
						  </span>
                        </div>
                        <div class="search_select search_option">
                            <label>Provincia</label>
                            <span class="search_selectwrap">
                            <div class="wrapper" id="wrapper-provincia">
                                <input type="hidden" id="hidden-provincia" name="hidden-provincia" value="Qualsiasi">
                                <div class="select-btn" id="select-btn-provincia" onclick="apriProvincia()">
                                  <span class="text_select">Qualsiasi</span>
                                    <i class="uil uil-angle-down"></i>
                                </div>
                                <div class="content-search main-2">
                                  <div class="search">
                                    <i class="uil uil-search"></i>
                                    <input id="input-provincia" spellcheck="false" type="text" placeholder="Cerca">
                                  </div>
                                  <ul class="options" id="options-provincia"></ul>
                                </div>
                            </div>
						  </span>
                        </div>
                        <div class="search_select search_option">
                            <label>Città</label>
                            <span class="search_selectwrap">
							<div class="wrapper" id="wrapper-citta">
                                <input type="hidden" id="hidden-citta" name="hidden-citta" value="Qualsiasi">
                                <div class="select-btn" id="select-btn-citta" onclick="apriCitta()">
                                  <span class="text_select">Qualsiasi</span>
                                    <i class="uil uil-angle-down"></i>
                                </div>
                                <div class="content-search main-1">
                                  <div class="search">
                                    <i class="uil uil-search"></i>
                                    <input id="input-citta" spellcheck="false" type="text" placeholder="Cerca">
                                  </div>
                                  <ul class="options" id="options-citta"></ul>
                                </div>
                            </div>
						  </span>
                        </div>
                    </div>
                    <div id="advanced_option_div" class="form_collapsed_field_wrapper" style="display: none;">
                        <div class="collapsed_field_container search_advanced_fields">
                            <div class="search_option search_select search_beds">
                                <label>Zona</label>
                                <div class="wrapper" id="wrapper-zona">
                                    <input type="hidden" id="hidden-zona" name="hidden-zona" value="Qualsiasi">
                                    <div class="select-btn" id="select-btn-zona" onclick="apriZona()">
                                        <span class="text_select">Qualsiasi</span>
                                        <i class="uil uil-angle-down"></i>
                                    </div>
                                    <div class="content-search supply">
                                        <div class="search">
                                            <i class="uil uil-search"></i>
                                            <input id="input-zona" spellcheck="false" type="text" placeholder="Cerca">
                                        </div>
                                        <ul class="options" id="options-zona"></ul>
                                    </div>
                                </div>
                            </div>
                            <div class="search_option search_select search_beds">
                                <label>Stato Immobile</label>
                                <div class="wrapper" id="wrapper-stato">
                                    <input type="hidden" id="hidden-stato" name="hidden-stato" value="Qualsiasi">
                                    <div class="select-btn" id="select-btn-stato" onclick="apriStato()">
                                        <span class="text_select">Qualsiasi</span>
                                        <i class="uil uil-angle-down"></i>
                                    </div>
                                    <div class="content-search supply">
                                        <div class="search">
                                            <i class="uil uil-search"></i>
                                            <input id="input-stato" spellcheck="false" type="text" placeholder="Cerca">
                                        </div>
                                        <ul class="options" id="options-stato"></ul>
                                    </div>
                                </div>
                            </div>
                            <div class="search_option search_select search_beds">
                                <label>Tipo Immobile</label>
                                <div class="wrapper" id="wrapper-tipo">
                                    <input type="hidden" id="hidden-tipo" name="hidden-tipo" value="Qualsiasi">
                                    <div class="select-btn" id="select-btn-tipo" onclick="apriTipo()">
                                        <span class="text_select">Qualsiasi</span>
                                        <i class="uil uil-angle-down"></i>
                                    </div>
                                    <div class="content-search supply">
                                        <div class="search">
                                            <i class="uil uil-search"></i>
                                            <input id="input-tipo" spellcheck="false" type="text" placeholder="Cerca">
                                        </div>
                                        <ul class="options" id="options-tipo"></ul>
                                    </div>
                                </div>
                            </div>
                            <div class="search_option search_select search_beds">
                                <label>Min Camere Letto</label>
                                <div class="wrapper" id="wrapper-minCamere">
                                    <input type="hidden" id="hidden-minCamere" name="hidden-minCamere" value="Qualsiasi">
                                    <div class="select-btn" id="select-btn-minCamere" onclick="apriMinCamere()">
                                        <span class="text_select">Qualsiasi</span>
                                        <i class="uil uil-angle-down"></i>
                                    </div>
                                    <div class="content-search supply">
                                        <div class="search">
                                            <i class="uil uil-search"></i>
                                            <input id="input-minCamere" spellcheck="false" type="text" placeholder="Cerca">
                                        </div>
                                        <ul class="options" id="options-minCamere"></ul>
                                    </div>
                                </div>
                            </div>
                            <div class="search_option search_select search_beds">
                                <label>Min Bagni</label>
                                <div class="wrapper" id="wrapper-minBagni">
                                    <input type="hidden" id="hidden-minBagni" name="hidden-minBagni" value="Qualsiasi">
                                    <div class="select-btn" id="select-btn-minBagni" onclick="apriMinBagni()">
                                        <span class="text_select">Qualsiasi</span>
                                        <i class="uil uil-angle-down"></i>
                                    </div>
                                    <div class="content-search supply">
                                        <div class="search">
                                            <i class="uil uil-search"></i>
                                            <input id="input-minBagni" spellcheck="false" type="text" placeholder="Cerca">
                                        </div>
                                        <ul class="options" id="options-minBagni"></ul>
                                    </div>
                                </div>
                            </div>
                            <div class="search_option search_select search_beds">
                                <label>Prezzo minimo</label>
                                <input name="minPrezzo_immobile" type="number" placeholder="Qualsiasi">
                            </div>
                            <div class="search_option search_select search_beds">
                                <label>Prezzo massimo</label>
                                <input name="maxPrezzo_immobile" type="number" placeholder="Qualsiasi">
                            </div>
                            <div class="search_option search_select search_beds">
                                <label>Min Posti Auto</label>
                                <div class="wrapper" id="wrapper-minAuto">
                                    <input type="hidden" id="hidden-minAuto" name="hidden-minAuto" value="Qualsiasi">
                                    <div class="select-btn" id="select-btn-minAuto" onclick="apriAuto()">
                                        <span class="text_select">Qualsiasi</span>
                                        <i class="uil uil-angle-down"></i>
                                    </div>
                                    <div class="content-search supply">
                                        <div class="search">
                                            <i class="uil uil-search"></i>
                                            <input id="input-minAuto" spellcheck="false" type="text" placeholder="Cerca">
                                        </div>
                                        <ul class="options" id="options-minAuto"></ul>
                                    </div>
                                </div>
                            </div>
                            <div class="search_option search_select search_beds">
                                <label>Superificie minima (mq)</label>
                                <input name="minSuperficie_immobile" type="number" placeholder="Qualsiasi">
                            </div>
                            <div class="search_option search_select search_beds">
                                <label>Superficie massima (mq)</label>
                                <input name="maxSuperficie_immobile" type="number" placeholder="Qualsiasi">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="search_button">
                <div class="search_buttonwrap">
                    <div class="search_advance">
                        <button type="button" onclick="advancedOption()" id="advanced_options"
                                class="search_advance_button">
                            <i class="icon-search-plus"></i>
                        </button>
                    </div>
                    <div class="search_buttonSubmit">
                        <button class="submit button_search">
                            <i class="icon-search"></i>
                            <span>Cerca</span>
                        </button>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <section class="section-agent section_flex wrap_padding">
        <div class="page page_agent page_main">
            <div class="div_mylistings div_agent_mylistings">
                <h2 class="page_title">
                    <span class="sub">I miei immobili</span>
                </h2>
            </div>
            <div class="properties_section">
                <%for (int i = 0; i < arrayAppartamento.size(); i++) {%>
                <article class="list_card">
                    <div class="list_card_wrap">
                        <figure class="list_card_figure">
                            <div class="figure_property">
                                <%
                                    boolean p = false;
                                    for (MultimediaBean multi : arrayMultimedia) {
                                        if (multi.getIdAppartamento() == arrayAppartamento.get(i).getIdAppartamento() && multi.getFotoString() != null && !p) {
                                            if(multi.getCopertina() == 1){
                                %><a href="${pageContext.request.contextPath}/DettagliAppartamento?id=<%=arrayAppartamento.get(i).getIdAppartamento()%>">
                                <img class="post_property" src="data:image/png;base64,<%=multi.getFotoString().get(0)%>" style="object-fit: cover;">

                            </a><%
                                        p = true;
                                        break;
                                        }
                                    }
                                }
                            %>
                                <div class="overlay_property"></div>
                                <div class="overlay_contents overlay_fadeIn_bottom">
                                    <a href="${pageContext.request.contextPath}/DettagliAppartamento?id=<%=arrayAppartamento.get(i).getIdAppartamento()%>">Visualizza Immobili</a>
                                </div>
                            </div>
                        </figure>
                        <div class="list_card_details_wrap">
                            <div class="list_card_details">
                                <h3>
                                    <a href="${pageContext.request.contextPath}/DettagliAppartamento?id=<%=arrayAppartamento.get(i).getIdAppartamento()%>"><%=arrayAppartamento.get(i).getNomeAppartamento()%>
                                    </a>
                                </h3>
                                <div class="property_address">
                                    <a href="https://www.google.it/maps/place/<%=arrayAppartamento.get(i).getIndirizzoBean().getVia() +"+"+ arrayAppartamento.get(i).getIndirizzoBean().getNumeroCivico() +"+"+ arrayAppartamento.get(i).getIndirizzoBean().getCap() +"+"+ arrayAppartamento.get(i).getIndirizzoBean().getCitta() +"+"+ arrayAppartamento.get(i).getIndirizzoBean().getProvincia()%>">
                                    <span class="address">
                                        <i class="icon-map-marker"></i>
                                    </span>
                                        <%
                                            String indirizzo = arrayAppartamento.get(i).getIndirizzoBean().getVia() + " " + arrayAppartamento.get(i).getIndirizzoBean().getNumeroCivico() + ", " + arrayAppartamento.get(i).getIndirizzoBean().getCitta() + ", " + arrayAppartamento.get(i).getIndirizzoBean().getProvincia() + ", " + arrayAppartamento.get(i).getIndirizzoBean().getRegione();
                                            if (indirizzo.length() > 42) {%>
                                        <%=indirizzo.substring(0, 42) + "..."%><%
                                    } else { %>
                                        <%=indirizzo%><%
                                        }
                                    %>
                                    </a>
                                </div>
                                <p class="list_card_description"><%
                                    if (arrayAppartamento.get(i).getDescrizioneAppartamento().length() > 50) {
                                %><%=arrayAppartamento.get(i).getDescrizioneAppartamento().substring(0, 50) + ".."%><%
                                } else {
                                %><%=arrayAppartamento.get(i).getDescrizioneAppartamento()%><%
                                    }%></p>
                                <div class="list_card_features_wrap">
                                    <div class="list_card_features_theme">
                                        <div class="list_card_features">
                                            <span class="features_title">Camere da letto</span>
                                            <div class="features_icon_wrapper">
                                                <i class="feature_icon icon-bed"></i>
                                                <span class="text"><%=arrayAppartamento.get(i).getCamereLetto()%></span>
                                            </div>
                                        </div>
                                        <div class="list_card_features">
                                            <span class="features_title">Bagni</span>
                                            <div class="features_icon_wrapper">
                                                <i class="feature_icon icon-shower"></i>
                                                <span class="text"><%=arrayAppartamento.get(i).getBagni()%></span>
                                            </div>
                                        </div>
                                        <div class="list_card_features">
                                            <span class="features_title">Superficie</span>
                                            <div class="features_icon_wrapper">
                                                <i class="feature_icon icon-crop_square"></i>
                                                <span class="text"><%=arrayAppartamento.get(i).getSuperficie()%></span>
                                                <span class=>mq</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list_card_priceLabel">
                                <div class="list_card_price">
                                    <span class="status"><%=arrayAppartamento.get(i).getTipoVendita()%></span>
                                    <%if (arrayAppartamento.get(i).getVisualizzaPrezzo() == 1) {%>
                                    <p class="price">€<%=arrayAppartamento.get(i).getPrezzo()%>
                                    </p>
                                    <%} else {%>
                                    <p class="price" style="font-size: 17px">Contatta l'agente</p>
                                    <%}%>
                                    </p>
                                </div>
                                <p class="list_card_author">Di
                                    <span class="author"><%=utenteBean.getNome() + " " + utenteBean.getCognome()%></span>
                                </p>
                            </div>
                        </div>
                    </div>
                </article>
                <%}%>
            </div>
            <div class="agent_profile">
                <article class="agent_card">
                    <div class="agent_card_wrap">
                        <div class="agent_card_head">
                            <figure class="agent_card_figure">
                                <a href="">
                                    <img width="210" height="210"
                                         src="data:image/png;base64,<%=utenteBean.getFotoString()%>">
                                </a>
                            </figure>
                            <div class="agent_card_name">
                                <h4 class="name"><%=utenteBean.getNome() + " " + utenteBean.getCognome()%>
                                </h4>
                                <div class="agent_card_listings">
                                <span class="count"><%
                                    for (CompositeKeyAgenteCase key : agenteCase) {
                                        if(utenteBean.getRuolo().equals("Agente")){
                                            if (key.getBean().getIdAgente() == agenteBean.getIdAgente()) {
                                                %><%=key.getContaCase()%>
                                            <%}
                                        }
                                    }%>
                                </span>
                                    <span class="head">Immobili posseduti</span>
                                </div>
                            </div>
                            <%if(utenteBean.getRuolo().equals("Agente")){%>
                                <div class="social">
                                    <%if(agenteBean.getLinkFacebook() == null){%>
                                    <%}else{%>
                                    <a href="<%=agenteBean.getLinkFacebook()%>"><i class="icon_social icon-facebook"></i></a>
                                    <%}if(agenteBean.getLinkInstagram() == null){%>
                                    <%}else{%>
                                    <a href="<%=agenteBean.getLinkInstagram()%>"><i class="icon_social icon-instagram"></i></a>
                                    <%}%>
                                </div>
                            <%}%>
                        </div>
                        <div class="agent_profile_content">
                            <%if(utenteBean.getRuolo().equals("Agente")){%>
                                <p>
                                    <%=agenteBean.getDescrizionePersonale()%>
                                </p>
                            <%}%>
                        </div>
                        <div class="agent_card_details">
                            <div class="agent_card_contact">
                                <div class="agent_card_contact_wrap">
                                    <%if(utenteBean.getRuolo().equals("Agente")){%>
                                        <p class="contact">Cellulare: <a href="tel:+39<%=agenteBean.getTelefonoCellulare()%>"><%=agenteBean.getTelefonoCellulare()%></a></p>
                                        <p class="contact"><a href="https://wa.me/+39<%=agenteBean.getTelefonoCellulare()%>">Chatta su whatsapp</a></p>
                                        <p class="contact">Email: <a href="mailto:<%=utenteBean.getEmail()%>"><%=utenteBean.getEmail()%></a></p>
                                    <%}%>
                                </div>
                            </div>
                        </div>
                        <div class="horizontal_border"></div>
                        <div class="agent_profile_contact_form">
                            <div class="agent_form">
                                <form action="SendEmail" method="post" id="form_agente">
                                    <%if(utenteBean.getRuolo().equals("Agente")){%>
                                    <input type="hidden" name="action" id="action" value="agente">
                                    <%}else if(utenteBean.getRuolo().equals("Collaboratore")){%>
                                    <input type="hidden" name="action" id="action" value="collaboratore">
                                    <%}%>
                                    <div class="agent_form_field agent_form_text">
                                        <label>Nome</label>
                                        <input type="text" placeholder="Il tuo nome" name="nomeGuest" id="nome">
                                        <i class="icon-check-circle"></i>
                                        <i class="icon-exclamation-circle"></i>
                                        <small>Error message</small>
                                    </div>
                                    <div class="agent_form_field agent_form_text">
                                        <label>Email</label>
                                        <input type="text" placeholder="La tua email" name="emailGuest" id="email">
                                        <i class="icon-check-circle"></i>
                                        <i class="icon-exclamation-circle"></i>
                                        <small>Error message</small>
                                    </div>
                                    <div class="agent_form_field agent_form_text">
                                        <label>Telefono</label>
                                        <input type="text" placeholder="Il tuo numero di telefono" name="telefonoGuest" id="telefono">
                                        <i class="icon-check-circle"></i>
                                        <i class="icon-exclamation-circle"></i>
                                        <small>Error message</small>
                                    </div>
                                    <div class="agent_form_field agent_form_textarea">
                                        <label>Messaggio</label>
                                        <textarea rows="6" placeholder="Il tuo messaggio" name="messaggioGuest" id="messaggio"></textarea>
                                        <i class="icon-check-circle"></i>
                                        <i class="icon-exclamation-circle"></i>
                                        <small>Error message</small>
                                    </div>
                                    <%if(utenteBean.getRuolo().equals("Agente")){%>
                                    <input type="hidden" name="agenteid" value="<%=agenteBean.getIdAgente()%>">
                                    <%}%>

                                    <div class="form_privacy">
                                        <span class="form_checkbox_label">Consenso sulla privacy</span>
                                        <input id="privacy" type="checkbox" style="display: block;">
                                        <label>Acconsento che questo sito Web memorizzi le informazioni inviate in modo che possano rispondere alla mia richiesta.</label>
                                        <i class="icon-check-circle"></i>
                                        <i class="icon-exclamation-circle"></i>
                                        <small>Error message</small>
                                    </div>
                                    <div class="agent_form_submit">
                                        <input type="submit" class="submit_button" value="Invia Messaggio" onclick="return checkInputs();">
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </article>
            </div>
        </div>
        <div class="page_right page_sidebar">
            <aside class="featured_sidebar">
                <section class="widget">
                    <h3 class="title">Immobile in evidenza</h3>
                    <article class="featured_card featured_card_block">
                        <div class="featured_card_wrap">
                            <figure class="featured_card_figure">
                                <div class="featured_card_picture">
                                    <a href="${pageContext.request.contextPath}/DettagliAppartamento?id=<%=visualizzazioneImmobile.getIdAppartamento()%>">
                                        <img width="680" height="510" src="data:image/png;base64,<%=visualizzazioneImmobile.getFoto()%>">
                                    </a>
                                </div>
                            </figure>
                            <div class="featured_card_details">
                                <h3>
                                    <a href="${pageContext.request.contextPath}/DettagliAppartamento?id=<%=visualizzazioneImmobile.getIdAppartamento()%>"><%=visualizzazioneImmobile.getNomeAppartamento()%>
                                    </a>
                                </h3>
                                <div class="property_address">
                                    <a href="https://www.google.it/maps/place/<%=visualizzazioneImmobile.getIndirizzoBean().getVia() +"+"+ visualizzazioneImmobile.getIndirizzoBean().getNumeroCivico() +"+"+ visualizzazioneImmobile.getIndirizzoBean().getCap() +"+"+ visualizzazioneImmobile.getIndirizzoBean().getCitta() +"+"+ visualizzazioneImmobile.getIndirizzoBean().getProvincia()%>">
                                    <span class="address">
                                        <i class="icon-map-marker"></i>
                                    </span>
                                        <%
                                            String indirizzo = visualizzazioneImmobile.getIndirizzoBean().getVia() + " " + visualizzazioneImmobile.getIndirizzoBean().getNumeroCivico() + ", " + visualizzazioneImmobile.getIndirizzoBean().getCitta() + ", " + visualizzazioneImmobile.getIndirizzoBean().getProvincia() + ", " + visualizzazioneImmobile.getIndirizzoBean().getRegione();
                                            if (indirizzo.length() > 42) {%>
                                        <%=indirizzo.substring(0, 42) + "..."%><%
                                    } else { %>
                                        <%=indirizzo%><%
                                        }
                                    %>
                                    </a>
                                </div>
                                <p class="featured_card_description"><%
                                    if (visualizzazioneImmobile.getDescrizioneAppartamento().length() > 60) {
                                %><%=visualizzazioneImmobile.getDescrizioneAppartamento().substring(0, 60) + ".."%><%
                                } else {
                                %><%=visualizzazioneImmobile.getDescrizioneAppartamento()%><%
                                    }%></p>
                                <div class="featured_card_features_wrap">
                                    <div class="featured_card_feature">
                                        <span class="features_title">Camere da letto</span>
                                        <div>
                                            <i class="feature_icon icon-bed"></i>
                                            <span class="text"><%=visualizzazioneImmobile.getCamereLetto()%></span>
                                        </div>
                                    </div>
                                    <div class="featured_card_feature">
                                        <span class="features_title">Bagni</span>
                                        <div>
                                            <i class="feature_icon icon-shower"></i>
                                            <span class="text"><%=visualizzazioneImmobile.getBagni()%></span>
                                        </div>
                                    </div>
                                    <div class="featured_card_feature">
                                        <span class="features_title">Superficie</span>
                                        <div>
                                            <i class="feature_icon icon-crop_square"></i>
                                            <span class="text"><%=visualizzazioneImmobile.getSuperficie()%></span>
                                            <span class=>mq</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="featured_card_priceLabel">
                                    <div class="featured_card_price">
                                        <span class="status"><%=visualizzazioneImmobile.getTipoVendita()%></span>
                                        <%if(visualizzazioneImmobile.getVisualizzaPrezzo() == 1){%>
                                            <p class="price">€<%=visualizzazioneImmobile.getPrezzo()%></p>
                                        <%}else{%>
                                            <p class="price" style="font-size: 17px">Contatta l'agente</p>
                                        <%}%>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </article>
                </section>
            </aside>
        </div>
    </section>
    <jsp:include page="footer.jsp"/>
</div>

</body>
<script>
    const inviata = document.getElementById("inviata");
    if(inviata.value.trim() == "ok"){
        swal("Inviata!", "Il tuo messaggio è stato inviato con successo e verrà preso presto in visione!", "success");
    }
</script>
<script src="script/agente.js"></script>
</html>
