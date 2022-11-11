<%@ page import="java.util.ArrayList" %>
<%@ page import="model.agente.AgenteBean" %>
<%@ page import="model.utente.UtenteBean" %>
<%@ page import="UtilityClass.CompositeKeyAgenteCase" %>
<%@ page import="UtilityClass.Città" %>
<%@ page import="UtilityClass.VisualizzazioneImmobile" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="it" dir="ltr">
<head>
    <title>Gabetti Nocera | Lista Immobili</title>
    <link rel="shortcut icon" type="image/jpg" href="images/favicon-256x256.png"/>
    <meta charset="utf-8">
    <link rel="stylesheet" href="css/aggiunte.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/listaappartamenti.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css"/>
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
    <link rel="stylesheet" href="icomoon/style.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCNvsKhyzYjIrmKtBJRIkaxz1-GZFIwROs&callback=initMap&v=weekly" defer></script>

    <link rel="stylesheet" href="bootstrapcss/owl.carousel.min.css">
    <script src="bootstrap/js/jquery-3.3.1.min.js"></script>
    <script src="bootstrap/js/popper.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="bootstrap/js/jquery.sticky.js"></script>
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
<%
    ArrayList<String> categorie = (ArrayList<String>) request.getSession().getAttribute("categorie");
    ArrayList<VisualizzazioneImmobile> appArray = (ArrayList<VisualizzazioneImmobile>) request.getAttribute("array");
    if (appArray == null) {
        response.sendRedirect(response.encodeRedirectURL("ListaAppartamenti?ordina=default&numero=1"));
        return;
    }
    String ordinamento = (String) request.getAttribute("ordinamento");
    String pagina = (String) request.getAttribute("pagina");
    VisualizzazioneImmobile visualizzazioneImmobile = (VisualizzazioneImmobile) request.getAttribute("featured");
    ArrayList<AgenteBean> agenteArray = (ArrayList<AgenteBean>) request.getAttribute("arrayAgente");
    ArrayList<UtenteBean> utenteArray = (ArrayList<UtenteBean>) request.getAttribute("arrayUtente");
    String sizeArrayString = (String) request.getAttribute("sizeArray");
    ArrayList<CompositeKeyAgenteCase> arrayComp = (ArrayList<CompositeKeyAgenteCase>) request.getAttribute("arrayComp");
    int sizeArray = Integer.parseInt(sizeArrayString);
%>
<body>
<%@ include file="loader.html" %>
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
        <div class="banner_wrap">
            <h1 class="banner_title">Lista Immobili</h1>
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
    <div class="section_map">
        <div id="map_head">
            <div id="map"></div>
        </div>
    </div>
    <section class="section_properties_search">
        <div class="page_list_properties">
            <div class="list_properties_head">
                <div class="list_properties_controls">
                    <div class="sort_controls">
                        <button id="ordinamento_button" class="ordinamento_button">Ordina per</button>
                        <div id="ordinamento" class="ordinamento" style="display: none">
                            <%if (pagina.equals("listaAppartamenti")) {%>
                            <a href="ListaAppartamenti?ordina=default&numero=1">Visualizzazioni</a>
                            <a href="ListaAppartamenti?ordina=prezzoCrescente&numero=1">Prezzo Crescente</a>
                            <a href="ListaAppartamenti?ordina=prezzoDecrescente&numero=1">Prezzo Decrescente</a>
                            <%} else if (pagina.equals("ricercaAppartamenti")) {%>
                            <a href="RicercaAppartamenti?ordina=default&numero=1">Visualizzazioni</a>
                            <a href="RicercaAppartamenti?ordina=prezzoCrescente&numero=1">Prezzo Crescente</a>
                            <a href="RicercaAppartamenti?ordina=prezzoDecrescente&numero=1">Prezzo
                                Decrescente</a>
                            <%}%>
                        </div>
                    </div>
                </div>
            </div>
            <div class="page_listing">
                <%for (VisualizzazioneImmobile appartamentoBean : appArray) {%>
                <input type="hidden" name="idAppartamento" value="<%=appartamentoBean.getIdAppartamento()%>">
                <div class="list_card">
                    <div class="list_card_wrap">
                        <figure class="list_card_picture">
                            <div class="figure_property">

                                <a href="${pageContext.request.contextPath}/DettagliAppartamento?id=<%=appartamentoBean.getIdAppartamento()%>">
                                    <img src="data:image/png;base64,<%=appartamentoBean.getFoto()%>"
                                         style="width:100%">
                                </a>

                            </div>
                        </figure>
                        <div class="list_card_details_wrap">
                            <div class="list_card_details">
                                <h3>
                                    <a href="${pageContext.request.contextPath}/DettagliAppartamento?id=<%=appartamentoBean.getIdAppartamento()%>"><%=appartamentoBean.getNomeAppartamento()%>
                                    </a>
                                </h3>
                                <div class="property_address">
                                    <a href="https://www.google.it/maps/place/<%=appartamentoBean.getIndirizzoBean().getVia() +"+"+ appartamentoBean.getIndirizzoBean().getNumeroCivico() +"+"+ appartamentoBean.getIndirizzoBean().getCap() +"+"+ appartamentoBean.getIndirizzoBean().getCitta() +"+"+ appartamentoBean.getIndirizzoBean().getProvincia()%>">
                                    <span class="address">
                                        <i class="icon-map-marker"></i>
                                    </span>
                                    <%
                                        String indirizzo = appartamentoBean.getIndirizzoBean().getVia() + " " + appartamentoBean.getIndirizzoBean().getNumeroCivico() + ", " + appartamentoBean.getIndirizzoBean().getCitta() + ", " + appartamentoBean.getIndirizzoBean().getProvincia() + ", " + appartamentoBean.getIndirizzoBean().getRegione();
                                        if (indirizzo.length() > 42) {%>
                                            <%=indirizzo.substring(0, 42) + "..."%><%
                                        } else { %>
                                            <%=indirizzo%><%
                                            }
                                    %>
                                    </a>
                                </div>
                                <p class="list_card_description"><%
                                    if (appartamentoBean.getDescrizioneAppartamento().length() > 50) {
                                %><%=appartamentoBean.getDescrizioneAppartamento().substring(0, 50) + ".."%><%
                                } else {
                                %><%=appartamentoBean.getDescrizioneAppartamento()%><%
                                    }%></p>
                                <div class="list_card_meta_wrap">
                                    <div class="list_card_meta_style">
                                        <div class="list_card_meta">
                                            <span class="meta_tile">Camere</span>
                                            <div class="meta_icon_wrapper">
                                                <i class="icon-bed"></i>
                                                <span class="figure"><%=appartamentoBean.getCamereLetto()%></span>
                                            </div>
                                        </div>
                                        <div class="list_card_meta">
                                            <span class="meta_tile">Bagni</span>
                                            <div class="meta_icon_wrapper">
                                                <i class="icon-shower"></i>
                                                <span class="figure"><%=appartamentoBean.getBagni()%></span>
                                            </div>
                                        </div>
                                        <div class="list_card_meta">
                                            <span class="meta_tile">Superficie</span>
                                            <div class="meta_icon_wrapper">
                                                <i class="icon-square-o"></i>
                                                <span class="figure"><%=appartamentoBean.getSuperficie()%></span>
                                                <span class="figure">mq</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list_card_priceLabel">
                                <div class="list_card_price">
                                    <span class="status"><%=appartamentoBean.getTipoVendita()%></span>
                                    <%if (appartamentoBean.getVisualizzaPrezzo() == 1) {%>
                                    <p class="price">€<%=appartamentoBean.getPrezzo()%>
                                    </p>
                                    <%} else {%>
                                    <p class="price" style="font-size: 17px">Contatta l'agente</p>
                                    <%}%>
                                    </p>
                                </div>
                                <p class="list_card_agent">
                                    Di&nbsp;
                                    <span class="agent">
                                        <a href="${pageContext.request.contextPath}/AgentePage?id=<%=appartamentoBean.getIdUtente()%>"><%=appartamentoBean.getNomeAgente() + " " + appartamentoBean.getCognomeAgente()%></a></span>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
                <%}%>
            </div>
            <div class="pagination">
                <%
                    for (int i = 1; i <= sizeArray; i++) {
                        if (pagina.equals("listaAppartamenti")) {
                %>
                <a href="${pageContext.request.contextPath}/ListaAppartamenti?ordina=<%=ordinamento%>&numero=<%=i%>"
                   class="pagination_btn"><%=i%>
                </a>
                <%} else if (pagina.equals("ricercaAppartamenti")) {%>
                <a href="${pageContext.request.contextPath}/RicercaAppartamenti?ordina=<%=ordinamento%>&numero=<%=i%>"
                   class="pagination_btn"><%=i%>
                </a>
                <%
                        }
                    }
                %>
            </div>
        </div>
        <div class="page_sidebar">
            <div class="sidebar">
                <section class="widget clearfix">
                    <h3 class="title">Agenti</h3>
                    <div class="agents_list_widget">
                        <%
                            int count = 2;
                            if(arrayComp.size() == 1)
                                count = 1;
                            for (int k = 0; k < count; k++) {
                                for (UtenteBean utenteBean : utenteArray) {
                                    if (utenteBean.getIdUtente() == arrayComp.get(k).getBean().getIdUtente()) {
                        %>
                        <article class="agent_list_item clearfix">
                            <figure class="agent_picture">
                                <a href="${pageContext.request.contextPath}/AgentePage?id=<%=utenteBean.getIdUtente()%>"><img
                                        src="data:image/png;base64,<%=utenteBean.getFotoString()%>"></a>
                            </figure>
                            <div class="agent_widget_content">
                                <h4 class="agent_name">
                                    <a href="${pageContext.request.contextPath}/AgentePage?id=<%=utenteBean.getIdUtente()%>"><%=utenteBean.getNome() + " " + utenteBean.getCognome()%>
                                    </a>
                                </h4>
                                <a href="mailto:<%=utenteBean.getEmail()%>"
                                   class="agent_email"><%=utenteBean.getEmail()%>
                                </a>
                                <div class="agent_number">
                                    <a href="tel:+39<%=arrayComp.get(k).getBean().getTelefonoCellulare()%>"><%=arrayComp.get(k).getBean().getTelefonoCellulare()%>
                                    </a>
                                </div>
                            </div>
                        </article>
                        <% }
                        }
                        }%>
                    </div>
                </section>
                <section class="widget">
                    <h3 class="title">Immobile in evidenza</h3>
                    <article class="featured_card featured_card_block">
                        <div class="featured_card_wrap">
                            <figure class="featured_card_figure">
                                <div class="featured_card_picture">
                                    <a href="${pageContext.request.contextPath}/DettagliAppartamento?id=<%=visualizzazioneImmobile.getIdAppartamento()%>">
                                        <img width="680" height="510"
                                             src="data:image/png;base64,<%=visualizzazioneImmobile.getFoto()%>">
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
                                            <span class="text_feature"><%=visualizzazioneImmobile.getCamereLetto()%></span>
                                        </div>
                                    </div>
                                    <div class="featured_card_feature">
                                        <span class="features_title">Bagni</span>
                                        <div>
                                            <i class="feature_icon icon-shower"></i>
                                            <span class="text_feature"><%=visualizzazioneImmobile.getBagni()%></span>
                                        </div>
                                    </div>
                                    <div class="featured_card_feature">
                                        <span class="features_title">Superficie</span>
                                        <div>
                                            <i class="feature_icon icon-crop_square"></i>
                                            <span class="text_feature"><%=visualizzazioneImmobile.getSuperficie()%></span>
                                            <span class="text_add">mq</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="featured_card_priceLabel">
                                    <div class="featured_card_price">
                                        <span class="status"><%=visualizzazioneImmobile.getTipoVendita()%></span>
                                        <%if (visualizzazioneImmobile.getVisualizzaPrezzo() == 1) {%>
                                        <p class="price">€<%=visualizzazioneImmobile.getPrezzo()%>
                                        </p>
                                        <%} else {%>
                                        <p class="price" style="font-size: 17px">Contatta l'agente</p>
                                        <%}%>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </article>
                </section>
            </div>
        </div>
    </section>
    <jsp:include page="footer.jsp"/>
</div>

<script>
    /* When the user clicks on the button,
    toggle between hiding and showing the dropdown content */
    function myFunction() {
        document.getElementById("myDropdown").classList.toggle("show");
    }

    function cambia(elem) {
        var text = elem.children[1];
        var div = document.getElementById("valore_localita");
        if (elem.classList.contains("li_selected")) {
            elem.classList.remove("li_selected")
            var oldWord = div.innerHTML;
            var newWord = oldWord.replace(text.innerHTML, "");
            div.innerHTML = newWord;
            if (newWord.includes(" ") && newWord.length < 3) {
                div.innerHTML = "Tutte le località";
            }
        } else {
            elem.classList.add("li_selected");
            if (div.textContent.includes("Tutte le località")) {
                div.innerHTML = text.innerHTML;
            }
            if (div.textContent.includes(text.innerHTML)) {
                div.innerHTML = text.innerHTML;
            } else {
                div.innerHTML = div.innerHTML + " " + text.innerHTML;
            }
        }
    }
</script>
<script>
    $(document).ready(function () {
        $("#ordinamento_button").click(function () {
            if (document.getElementById("ordinamento").style.display == "none") {
                $("#ordinamento").slideDown();
            } else {
                $("#ordinamento").slideUp();
            }
        });
    });
</script>


<script>
    var uluru;
    function mappa(map) {
        var idAppartamenti = [];
        var elements = document.getElementsByName("idAppartamento");
        for (var i = 0; i < elements.length; i++) {
            idAppartamenti.push(parseInt(elements[i].value));
        }
        var stringa = JSON.stringify(idAppartamenti);
        $.post('ProvaJson', {idAppartamenti: stringa}, function (listJson) {
            var json = JSON.parse(listJson);
            var infowindow = new google.maps.InfoWindow();
            for (var i = 0; i < json.length; i++) {
                var geocoder = new google.maps.Geocoder();
                var address = json[i].indirizzo;
                var lat = 0;
                var lng = 0;
                converti(json[i]);
                function converti(json){
                    geocoder.geocode({'address': json.indirizzo}, function (results, status) {
                        if (status == google.maps.GeocoderStatus.OK) {
                            var latitude = results[0].geometry.location.lat();
                            var longitude = results[0].geometry.location.lng();
                            lat = parseFloat(latitude);
                            lng = parseFloat(longitude);
                            uluru = {lat: lat, lng: lng};
                            const contentString =
                                '<div class="property_map" id="marker' + i + '">' +
                                '<article class="featured_card featured_card_block">' +
                                '<div class="featured_card_wrap">' +
                                '<figure class=featured_card_figure>' +
                                '<div class="featured_card_picture">' +
                                '<a href="${pageContext.request.contextPath}/DettagliAppartamento?id='+json.idAppartamento +'">' +
                                '<img src="data:image/png;base64,'+json.foto+'" style="height: 275px;object-fit: cover">' +
                                '</a>' +
                                '</div>' +
                                '</figure>' +
                                '<div class=featured_card_details>' +
                                '<h3>' +
                                '<a href="${pageContext.request.contextPath}/DettagliAppartamento?id='+json.idAppartamento +'">'+json.nome+'</a>' +
                                '</h3>' +
                                '<div class="featured_card_features_wrap">' +
                                '<div class="featured_card_feature">' +
                                '<span class="features_title">Camere da letto</span>' +
                                '<div>' +
                                '<i class="feature_icon icon-bed"></i>' +
                                '<span class="text_feature">'+json.letti+'</span>' +
                                '</div>' +
                                '</div>' +
                                '<div class="featured_card_feature">' +
                                '<span class="features_title">Bagni</span>' +
                                '<div>' +
                                '<i class="feature_icon icon-shower"></i>' +
                                '<span class="text_feature">'+json.bagni+'</span>' +
                                '</div>' +
                                '</div>' +
                                '<div class="featured_card_feature">' +
                                '<span class="features_title">Superficie</span>' +
                                '<div>' +
                                '<i class="feature_icon icon-square-o"></i>' +
                                '<span class="text_feature">'+json.superficie+'</span>' +
                                '</div>' +
                                '</div>' +
                                '</div>' +
                                '<div class="featured_card_priceLabel">' +
                                '<div class="featured_card_price">' +
                                '<span class=status>'+json.tipoVendita+'</span>' +
                                '<p class="price">€ '+json.prezzo+'</p>' +
                                '</div>' +
                                '</div>' +
                                '</div>' +
                                '</article>' +
                                '</div>';


                            var marker = new google.maps.Marker({
                                position: window.uluru,
                                map,
                                title: json.nome,
                            });

                            google.maps.event.addListener(marker, 'click', (function(marker){
                                return function (){
                                    infowindow.setContent(contentString);
                                    infowindow.open(map,marker);
                                }
                            })(marker));
                        }
                    });
                }

            }
            window.initMap = initMap;
        })};
</script>

<script>
    function initMap() {
        const uluru = {lat:40.7454000, lng:14.6454200}
        const map = new google.maps.Map(document.getElementById("map"), {
            zoom: 10,
            center: uluru,
        });
        mappa(map)
    }

    window.initMap = initMap;

</script>

<script src="script/valutazione.js"></script>
<script src="script/index.js"></script>
<script src="bootstrap/js/jquery-3.3.1.min.js"></script>
<script src="bootstrap/js/popper.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="bootstrap/js/jquery.sticky.js"></script>
</body>
</html>

