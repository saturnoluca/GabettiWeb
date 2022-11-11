<%@ page import="java.util.ArrayList" %>
<%@ page import="model.utente.UtenteBean" %>
<%@ page import="model.agente.AgenteBean" %>
<%@ page import="model.appartamento.AppartamentoBean" %>
<%@ page import="UtilityClass.CompositeKeyAgenteCase" %>
<%@ page import="model.multimedia.MultimediaBean" %>
<%@ page import="UtilityClass.Città" %>
<%@ page import="UtilityClass.VisualizzazioneImmobile" %><%--
  Created by IntelliJ IDEA.
  User: Luca
  Date: 21/03/2022
  Time: 10:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="it">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">

    <link rel="stylesheet" href="icomoon/style.css">

    <link rel="stylesheet" href="bootstrapcss/owl.carousel.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">

    <!-- Style -->
    <link rel="stylesheet" href="css/listaagenti.css">
    <link rel="stylesheet" href="css/aggiunte.css">
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="script/index.js"></script>
    <script src="bootstrap/js/jquery-3.3.1.min.js"></script>
    <script src="bootstrap/js/popper.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="bootstrap/js/jquery.sticky.js"></script>
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
    <title>Gabetti Nocera | Lista Agenti</title>
    <link rel="shortcut icon" type="image/jpg" href="images/favicon-256x256.png"/>
</head>

<%

    ArrayList<String> categorie = (ArrayList<String>) request.getSession().getAttribute("categorie");
    ArrayList<UtenteBean> utenteBeans = (ArrayList<UtenteBean>) request.getAttribute("utenti");
    if (utenteBeans == null) {
        response.sendRedirect("AgentiPage");
        return;
    }
    VisualizzazioneImmobile visualizzazioneImmobile = (VisualizzazioneImmobile) request.getAttribute("featured");
    ArrayList<CompositeKeyAgenteCase> agenteBeans = (ArrayList<CompositeKeyAgenteCase>) request.getAttribute("agentiCase");
    ArrayList<AppartamentoBean> appartamentoBeans = (ArrayList<AppartamentoBean>) request.getAttribute("inEvidenza");
    ArrayList<MultimediaBean> multimediaBeans = (ArrayList<MultimediaBean>) request.getAttribute("multimedia");
%>
<body>
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
    <section class="banner" style="background-image: url(images/banner.jpg); background-position: center 0%;">
        <div class="banner_cover"></div>
        <div class="banner_wrap">
            <h1 class="banner_title">I nostri agenti</h1>
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
    <section class="agents_section agents_section_flex agents_section_padding">
        <%
            if (utenteBeans.size() == 0) {
        %><h3>Non è presente nessun agente</h3>
        <%
        } else {
        %>
        <div class="page page_agents page_main">
            <div class="agents_listing">
                <%for (UtenteBean u : utenteBeans) {%>
                <article class="agent_card">
                    <div class="agent_card_wrap">
                        <div class="agent_card_head">
                            <figure class="agent_card_figure">
                                <a href="${pageContext.request.contextPath}/AgentePage?id=<%=u.getIdUtente()%>">
                                    <%if (u.getFotoString() == null) {%>
                                    <img src="images/agente.jpg">
                                    <%} else {%>
                                    <img src="data:image/png;base64,<%=u.getFotoString()%>">
                                    <%}%>

                                </a>
                            </figure>
                            <div class="agent_card_name">
                                <h4 class="name">
                                    <a href="${pageContext.request.contextPath}/AgentePage?id=<%=u.getIdUtente()%>"><%=u.getNome() + " " + u.getCognome()%>
                                    </a>
                                </h4>
                                <%if (u.getRuolo().equals("Collaboratore")) {%>
                                <%
                                        for (CompositeKeyAgenteCase agenteCase : agenteBeans) {
                                            if (u.getIdUtente() == agenteCase.getBean().getIdUtente()) {
                                                for (CompositeKeyAgenteCase agente : agenteBeans) {
                                                    if (agenteCase.getBean().getCollaboratore() == agente.getBean().getIdAgente()) {
                                                        for(UtenteBean utente: utenteBeans){
                                                            if(utente.getIdUtente() == agente.getBean().getIdUtente()){%>
                                                                <div class="collaboratore">Collaboratore associato all'agente:
                                                                    <a href="${pageContext.request.contextPath}/AgentePage?id=<%=utente.getIdUtente()%>"><%=" " +utente.getNome() + " " + utente.getCognome()%></a>
                                                                </div>
                                                            <%}
                                                        }
                                                    }
                                                }
                                            }
                                        }%>

                                <%}%>
                            </div>
                            <div class="agent_card_listings">
                                <p class="head">Immobili posseduti</p>
                                <%if (u.getRuolo().equals("Agente") || u.getRuolo().equals("Collaboratore")) {%>
                                <p class="count"><%
                                    for (CompositeKeyAgenteCase ag : agenteBeans) {
                                        if (u.getIdUtente() == ag.getBean().getIdUtente()) {
                                %><%=ag.getContaCase()%><%
                                        }
                                    }%></p>
                                <%}%>
                            </div>
                        </div>
                        <div class="agent_card_details">
                            <p>
                                <%
                                    if (u.getRuolo().equals("Agente") || u.getRuolo().equals("Collaboratore")) {
                                        for (CompositeKeyAgenteCase ag : agenteBeans) {
                                            if (u.getIdUtente() == ag.getBean().getIdUtente()) {
                                %><%=ag.getBean().getDescrizionePersonale()%><%
                                    }
                                }
                            }%>
                            </p>
                            <div class="agent_card_contact">
                                <div class="agent_card_contact_wrap">
                                    <%
                                        if (u.getRuolo().equals("Agente") || u.getRuolo().equals("Collaboratore")) {
                                            for (CompositeKeyAgenteCase ag : agenteBeans) {
                                                if (ag.getBean().getIdUtente() == u.getIdUtente()) {
                                    %> <p class="contact">Cellulare: <a href=""><%=ag.getBean().getTelefonoCellulare()%>
                                </a></p>
                                    <p class="contact">
                                        <a href="https://wa.me/39<%=ag.getBean().getTelefonoCellulare()%>">Whatsapp</a>
                                    </p>
                                    <p class="contact">Email:
                                        <a href=""><%=u.getEmail()%></a>
                                    </p><%
                                                }
                                            }
                                        }%>
                                </div>
                                <%
                                    if (u.getRuolo().equals("Agente") || u.getRuolo().equals("Collaboratore")) {
                                        for (CompositeKeyAgenteCase ag : agenteBeans) {
                                            if (ag.getBean().getIdUtente() == u.getIdUtente()) {
                                %><a
                                    href="${pageContext.request.contextPath}/AgentePage?id=<%=ag.getBean().getIdUtente()%>"
                                    class="agent_card_link">
                                <span>Visualizza i miei immobili</span>
                                <i class="icon-angle-right"></i>
                            </a><%
                                    }
                                }
                            }%>
                            </div>
                        </div>
                    </div>
                </article>
                <%}%>
            </div>
        </div>
        <%
            }
        %>
        <%
            if (appartamentoBeans.size() == 0) {

            } else {
        %>
        <div class="page_right page_sidebar">
            <aside class="featured_sidebar">
                <section class="widget">
                    <h3 class="title">Immobile in evidenza</h3>
                    <article class="featured_card featured_card_block">
                        <div class="featured_card_wrap">
                            <figure class="featured_card_figure">
                                <div class="featured_card_picture">
                                    <a href="${pageContext.request.contextPath}/DettagliAppartamento?id=<%=visualizzazioneImmobile.getIdAppartamento()%>">
                                        <img src="data:image/png;base64,<%=visualizzazioneImmobile.getFoto()%>" style="width:100%">
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
        <%}%>
    </section>
    <jsp:include page="footer.jsp"/>

</div>

</body>
</html>
