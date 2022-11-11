<%@ page import="model.appartamento.AppartamentoBean" %>
<%@ page import="model.agente.AgenteBean" %>
<%@ page import="model.utente.UtenteBean" %>
<%@ page import="model.indirizzo.IndirizzoBean" %>
<%@ page import="model.multimedia.MultimediaBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="UtilityClass.VisualizzazioneImmobile" %>
<%@ page import="UtilityClass.Città" %>
<%@ page import="model.planimetria.PlanimetriaBean" %><%--
  Created by IntelliJ IDEA.
  User: Luca
  Date: 14/03/2022
  Time: 09:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%

    AppartamentoBean appBean = (AppartamentoBean) request.getAttribute("appartamento");
    AgenteBean agenteBean = (AgenteBean) request.getAttribute("agente");
    UtenteBean utenteBean = (UtenteBean) request.getAttribute("utente");
    IndirizzoBean indirizzoBean = (IndirizzoBean) request.getAttribute("indirizzo");
    MultimediaBean multimediaBean = (MultimediaBean) request.getAttribute("multimedia");
    ArrayList<AppartamentoBean> array = (ArrayList<AppartamentoBean>) request.getAttribute("visite");
    VisualizzazioneImmobile visualizzazioneImmobile = (VisualizzazioneImmobile) request.getAttribute("featured");
    ArrayList<PlanimetriaBean> listaPlanimetrie = (ArrayList<PlanimetriaBean>) request.getAttribute("listaPlanimetrie");

    String inviata = (String) request.getSession().getAttribute("inviata");
    request.getSession().setAttribute("inviata","no");
%>

<!doctype html>
<html lang="it">
<head>
    <title>Gabetti Nocera | <%=appBean.getNomeAppartamento()%></title>
    <link rel="shortcut icon" type="image/jpg" href="images/favicon-256x256.png"/>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">

    <link rel="stylesheet" href="icomoon/style.css">
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link rel="stylesheet" href="bootstrapcss/owl.carousel.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
    <!-- Style -->
    <link rel="stylesheet" href="css/dettagliappartamento.css">
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/aggiunte.css">

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css"/>
    <script src="bootstrap/js/jquery-3.3.1.min.js"></script>
    <script src="bootstrap/js/popper.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="bootstrap/js/jquery.sticky.js"></script>
    <script src="script/dettagliappartamento.js"></script>
    <title>Gabetti Nocera | Homepage</title>

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

<script>
    $(document).ready(function () {
        $("#share").click(function () {
            if (document.getElementById("div_share").style.display == "none") {
                $("#div_share").fadeIn();
            } else {
                $("#div_share").fadeOut();
            }
        });
    });
</script>


<body>
<input type="hidden" value="<%=inviata%>" id="inviata">
<%@ include file="loader.html" %>
<nav id="navbar" class="noPrint">
    <a href="index.jsp" class="logo">
        <img src="images/logo.png">
    </a>
    <input type="checkbox" id="click">
    <label for="click" class="menu-btn noPrint">
        <i class="icon-bars noPrint"></i>
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
    <section class="banner noPrint" style="background-image: url(images/banner.jpg); background-position: center 0%;">
        <div class="banner_cover noPrint"></div>
        <div class="banner_wrap noPrint">
            <h1 class="banner_title noPrint"><%=appBean.getNomeAppartamento()%>
            </h1>
        </div>
    </section>
    <div class="div_search div_search_init noPrint">
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
    <section class="section_details_property">
        <div class="page_fullWidth">
            <div class="property_head">
                <div class="property_title">
                    <h1 class="title"><%=appBean.getNomeAppartamento()%>
                    </h1>
                    <%if(indirizzoBean.getZona().equals("") || indirizzoBean.getZona() == null){%>
                        <p class="address"><%=indirizzoBean.getVia() + " " + indirizzoBean.getNumeroCivico() + ", " + indirizzoBean.getCitta() + ", " + indirizzoBean.getCap() + ", " + indirizzoBean.getProvincia() + ", " + indirizzoBean.getRegione()%></p>
                    <%}else{%>
                        <p class="address"><%=indirizzoBean.getVia() + " " + indirizzoBean.getNumeroCivico() + ", " + indirizzoBean.getCitta() + ", " + indirizzoBean.getCap() + ", "+ indirizzoBean.getZona() +", " + indirizzoBean.getProvincia() + ", " + indirizzoBean.getRegione()%></p>
                    <%}%>
                </div>
                <div class="property_price">
                    <p class="status"><%=appBean.getTipoVendita()%>
                    </p>
                    <%if (appBean.getVisualizzaPrezzo() == 1) {%>
                    <p class="price">€<%=appBean.getPrezzo()%>
                    </p>
                    <%} else {%>
                    <p class="price" style="font-size: 17px">Contatta l'agente</p>
                    <%}%>
                    </p>
                </div>
            </div>
            <div class="property">
                <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img class="d-block w-100"
                                 src="data:image/png;base64,<%=multimediaBean.getFotoString().get(0)%>"
                                 alt="First slide">
                        </div>
                        <%for (int i = 1; i < multimediaBean.getFotoString().size() && i <= 2; i++) {%>
                        <div class="carousel-item">
                            <img class="d-block w-100" src="data:image/png;base64,<%=multimediaBean.getFotoString().get(i)%>">
                        </div>
                        <%}%>
                    </div>
                    <a class="carousel-control-prev noPrint" href="#carouselExampleControls" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next noPrint" href="#carouselExampleControls" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>

                <div class="property_wrap">
                    <div class="property_main">
                        <div class="property_content">
                            <div class="property_content_head">
                                <div class="property_name">
                                    <p class="name">Nome:&nbsp;</p>
                                    <p class="id"><%=appBean.getNomeAppartamento()%>
                                    </p>
                                </div>
                                <div class="property_functions noPrint">
<!--                                    <button class="share" id="share">
                                        <i class="icon-share"></i>
                                    </button>
                                    <div id="div_share" class="property_share" style="display: none">
                                        <div class="social_list">
                                            <ul>
                                                <li class="choice_facebook">
                                                    <i class="icon-facebook"></i>
                                                </li>
                                                <li class="choice_telegram">
                                                    <a href="https://telegram.me/share/url?url=http://93.186.251.8/DettagliAppartamento?id=7"><i class="icon-telegram"></i></a>
                                                </li>
                                                <li class="choice_whatsapp">
                                                    <a onclick="window.open('https://web.whatsapp.com://send?text=http://93.186.251.8/DettagliAppartamento?id=7')"><i class="icon-whatsapp"></i></a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>-->
                                    <button type="button" onclick="window.print();">
                                        <i class="icon-print"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="property_features_wrap">
                                <div class="property_feature">
                                    <span class="feature_title">Camere</span>
                                    <div class="feature_content">
                                        <i class="icon-bed"></i>
                                        <span class="text"><%=appBean.getCamereLetto()%></span>
                                    </div>
                                </div>
                                <div class="property_feature">
                                    <span class="feature_title">Bagni</span>
                                    <div class="feature_content">
                                        <i class="icon-shower"></i>
                                        <span class="text"><%=appBean.getBagni()%></span>
                                    </div>
                                </div>
                                <div class="property_feature">
                                    <span class="feature_title">Garage</span>
                                    <div class="feature_content">
                                        <i class="icon-car"></i>
                                        <span class="text"><%=appBean.getPostoAuto()%></span>
                                        <span class="text">posti auto</span>
                                    </div>
                                </div>
                                <div class="property_feature">
                                    <span class="feature_title">Superficie</span>
                                    <div class="feature_content">
                                        <i class="icon-square-o"></i>
                                        <span class="text"><%=appBean.getSuperficie()%></span>
                                        <span class="text">mq</span>
                                    </div>
                                </div>
                            </div>
                            <h4 class="property_heading_h4">Descrizione</h4>
                            <div class="description_content">
                                <p><%=appBean.getDescrizioneAppartamento()%>
                                </p>
                            </div>
                            <h4 class="property_heading_h4">Dettagli addizionali</h4>
                            <ul class="property_additional">
                                <li>
                                    <span class="valore">Piano: </span>
                                    <span class="value"><%=appBean.getPiano()%></span>
                                </li>
                                <li>
                                    <span class="valore">Classe Energetica: </span>
                                    <span class="value"><%=appBean.getClasseEnergetica()%></span>
                                </li>
                                <li>
                                    <span class="valore">Riscaldamento: </span>
                                    <span class="value"><%=appBean.getRiscaldamento()%></span>
                                </li>
                            </ul>
                            <%if (listaPlanimetrie.size() != 0) {%>
                            <div class="property_floor_plans noPrint">
                                <h4 class="property_heading_h4">Planimetria</h4>
                                <div class="floor_plans_accordions">
                                    <div class="floor_plan">
                                        <div class="floor_plan_title" onclick="show()">
                                            <div class="floor_title">
                                                <i class="icon-plus"></i>
                                                <h3 id="test_h3">Lista Planimetrie</h3>
                                            </div>
                                        </div>

                                        <div id="floor" class="floor_plan_content" style="display: block;">
                                            <%
                                                for (int i = 0; i < listaPlanimetrie.size(); i++) {
                                            %>
                                            <div>
                                                <a href="VisualizzaPlanimetria?idPlanimetria=<%=listaPlanimetrie.get(i).getIdPlanimetria()%>" target="_blank"><img src="images/pdf.png" style="height: 200px; margin-bottom: 20px"></a>
                                            </div>
                                            <%
                                                }
                                            %>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%}%>
                            <div class="property_map">
                                <input type="hidden" name="indirizzoAppartamento"
                                       value="<%=indirizzoBean.getCitta()+", "+indirizzoBean.getProvincia()+", "+ indirizzoBean.getNumeroCivico()%>">
                                <h4 class="property_heading_h4">Mappa</h4>
                                <iframe allowfullscreen frameborder="0" loading="lazy"
                                        src="https://www.google.com/maps/embed/v1/place?key=AIzaSyCghlu8qhmsmptec4eSidg5APpA57lCPlU&q=<%=indirizzoBean.getVia()+"+"+indirizzoBean.getProvincia()+"+"+indirizzoBean.getNumeroCivico()%>&zoom=17"
                                        width="100%" height="450"></iframe>
                            </div>
                        </div>

                    </div>
                    <div class="property_sidebar noPrint">
                        <aside class="sidebar">
                            <section class="property_agent">
                                <a href="${pageContext.request.contextPath}/AgentePage?id=<%=utenteBean.getIdUtente()%>" class="agent_image">
                                    <img src="data:image/png;base64,<%=utenteBean.getFotoString()%>">
                                </a>
                                <h3 class="property_agent_title">
                                    Agente <%=utenteBean.getNome() + " " + utenteBean.getCognome()%>
                                </h3>
                                <div class=property_agent_info>
                                    <p class="contact">
                                        <span>Cellulare:&nbsp;</span>
                                        <a href="tel:+39<%=agenteBean.getTelefonoCellulare()%>"><%=agenteBean.getTelefonoCellulare()%>
                                        </a>
                                    </p>
                                    <p class="contact">
                                        <span>Whatsapp:&nbsp;</span>
                                        <a href="https://wa.me/<%=agenteBean.getTelefonoCellulare()%>"></a>
                                    </p>
                                    <p class="contact">
                                        <span>Email:&nbsp;</span>
                                        <a href="mailto:<%=utenteBean.getEmail()%>"><%=utenteBean.getEmail()%>
                                        </a>
                                    </p>
                                </div>
                                <a class="agent_property_listing" href="${pageContext.request.contextPath}/AgentePage?id=<%=utenteBean.getIdUtente()%>">Visualizza i miei immobili</a>
                                <div class="agent_property_contact_form">
                                    <form class="contact_form" action="SendEmail" METHOD="post" id="form_contact">
                                        <input type="hidden" name="action" value="immobile">
                                        <input type="hidden" name="agenteid" value="<%=agenteBean.getIdAgente()%>">
                                        <input type="hidden" name="idAppartamento" value="<%=appBean.getIdAppartamento()%>">
                                        <div class="contact_form_row">
                                            <label>Nome e cognome</label>
                                            <input required type="text" placeholder="Inserisci il tuo nome e cognome" name="nomeGuest" id="nome">
                                            <i class="icon-check-circle"></i>
                                            <i class="icon-exclamation-circle"></i>
                                            <small>Error message</small>
                                        </div>
                                        <div class="contact_form_row">
                                            <label>Email</label>
                                            <input required type="email" placeholder="Inserisci la tua email" name="emailGuest" id="email">
                                            <i class="icon-check-circle"></i>
                                            <i class="icon-exclamation-circle"></i>
                                            <small>Error message</small>
                                        </div>
                                        <div class="contact_form_row">
                                            <label>Telefono</label>
                                            <input required type="text" placeholder="Inserisci il tuo numero di telefono" name="telefonoGuest" id="telefono">
                                            <i class="icon-check-circle"></i>
                                            <i class="icon-exclamation-circle"></i>
                                            <small>Error message</small>
                                        </div>
                                        <div class="contact_form_row">
                                            <label>Messaggio</label>
                                            <textarea required cols="40" rows="6" placeholder="Ciao vorrei maggiori informazioni su questo immobile" name="messaggioGuest" id="messaggio"></textarea>
                                            <i class="icon-check-circle"></i>
                                            <i class="icon-exclamation-circle"></i>
                                            <small>Error message</small>
                                        </div>
                                        <div class="privacy_agreement">
                                            <span class="privacy_checkboxLabel">Consenso sulla privacy</span>
                                            <input id="privacy" type="checkbox" style="display: block;">
                                            <label>Acconsento che questo sito Web memorizzi le informazioni inviate in modo che possano rispondere alla mia richiesta.</label>
                                            <i class="icon-check-circle"></i>
                                            <i class="icon-exclamation-circle"></i>
                                            <small>Error message</small>
                                        </div>
                                        <div class="agent_call">
                                            <a href="https://wa.me/<%=agenteBean.getTelefonoCellulare()%>" class="agent_link">
                                                <i class="icon-whatsapp"></i>
                                                <span>Whatsapp</span>
                                            </a>
                                            <a href="tel:+39<%=agenteBean.getTelefonoCellulare()%>" class="agent_link">
                                                <i class="icon-phone"></i>
                                                <span>Chiama ora</span>
                                            </a>
                                        </div>
                                        <div class="agent_message">
                                            <button class="send_message" type="submit" class="agent_link" onclick="return checkInputs();">
                                                <i class="icon-mail_outline"></i>
                                                <span>Invia messaggio</span>
                                            </button>
                                        </div>
                                    </form>
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
                                                    <p class="price">€<%=visualizzazioneImmobile.getPrezzo()%>
                                                    </p>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </article>
                            </section>
                        </aside>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <div class="noPrint">
        <jsp:include page="footer.jsp"/>
    </div>
</div>


<script type="text/javascript"
        src="https://maps.google.com/maps/api/js?key=AIzaSyCNvsKhyzYjIrmKtBJRIkaxz1-GZFIwROs"></script>
<script src="script/index.js"></script>

<script src="bootstrap/js/jquery-3.3.1.min.js"></script>
<script src="bootstrap/js/popper.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="bootstrap/js/jquery.sticky.js"></script>
<script>
    var geocoder;
    var map;
    var address = $('#indirizzoAppartamento').val();

    function initialize() {
        geocoder = new google.maps.Geocoder();
        var latlng = new google.maps.LatLng(-34.397, 150.644);
        var myOptions = {
            zoom: 8,
            center: latlng,
            mapTypeControl: true,
            mapTypeControlOptions: {
                style: google.maps.MapTypeControlStyle.DROPDOWN_MENU
            },
            navigationControl: true,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
        if (geocoder) {
            geocoder.geocode({
                'address': address
            }, function (results, status) {
                if (status == google.maps.GeocoderStatus.OK) {
                    if (status != google.maps.GeocoderStatus.ZERO_RESULTS) {
                        map.setCenter(results[0].geometry.location);

                        var infowindow = new google.maps.InfoWindow({
                            content: '<b>' + address + '</b>',
                            size: new google.maps.Size(150, 50)
                        });

                        var marker = new google.maps.Marker({
                            position: results[0].geometry.location,
                            map: map,
                            title: address
                        });
                        google.maps.event.addListener(marker, 'click', function () {
                            infowindow.open(map, marker);
                        });

                    } else {
                        alert("No results found");
                    }
                } else {
                    alert("Geocode was not successful for the following reason: " + status);
                }
            });
        }
    }

    google.maps.event.addDomListener(window, 'load', initialize);
</script>

<script>
    const inviata = document.getElementById("inviata");
    if(inviata.value.trim() == "ok"){
        swal("Inviato!", "Il tuo messaggio è stato inviato con successo e verrà preso presto in visione!", "success");
    }
</script>

</body>
</html>

