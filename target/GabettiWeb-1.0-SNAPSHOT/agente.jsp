<%@ page import="model.appartamento.AppartamentoBean" %>
<%@ page import="model.agente.AgenteBean" %>
<%@ page import="model.utente.UtenteBean" %>
<%@ page import="model.indirizzo.IndirizzoBean" %>
<%@ page import="model.multimedia.MultimediaBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="UtilityClass.CompositeKeyAgenteCase" %>
<%@ page import="UtilityClass.Città" %>
<%@ page import="UtilityClass.VisualizzazioneImmobile" %><%--
  Created by IntelliJ IDEA.
  User: Luca
  Date: 25/02/2022
  Time: 16:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="it">
<%
    ArrayList<Città> allCittàZone = (ArrayList<Città>) request.getSession().getAttribute("allCittaZone");
    if (allCittàZone == null) {
        request.getSession().setAttribute("nomepagina", "agente.jsp");
        response.sendRedirect(response.encodeRedirectURL("ServletValutazioneCampiRicerca"));
        return;
    }
    ArrayList<String> categorie = (ArrayList<String>) request.getSession().getAttribute("categorie");
    if (request.getAttribute("utente") == null) {
        response.sendRedirect(response.encodeRedirectURL("IndexServlet"));
        return;
    }
    VisualizzazioneImmobile visualizzazioneImmobile = (VisualizzazioneImmobile) request.getAttribute("featured");
    AgenteBean agenteBean = (AgenteBean) request.getAttribute("agente");
    UtenteBean utenteBean = (UtenteBean) request.getAttribute("utente");
    ArrayList<AppartamentoBean> arrayAppartamento = (ArrayList<AppartamentoBean>) request.getAttribute("arrayAppartamento");
    ArrayList<IndirizzoBean> arrayIndirizzo = (ArrayList<IndirizzoBean>) request.getAttribute("arrayIndirizzo");
    ArrayList<MultimediaBean> arrayMultimedia = (ArrayList<MultimediaBean>) request.getAttribute("arrayMultimedia");
    ArrayList<CompositeKeyAgenteCase> agenteCase = (ArrayList<CompositeKeyAgenteCase>) request.getAttribute("agenteCase");
    ArrayList<AppartamentoBean> inEvidenza = (ArrayList<AppartamentoBean>) request.getAttribute("inEvidenza");
%>

<head>
    <title>Gabetti - Agente</title>
    <link rel="shortcut icon" type="image/jpg" href="images/favicon-256x256.png"/>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Style -->
    <link rel="stylesheet" href="css/agente.css">
    <link rel="stylesheet" href="css/aggiunte.css">

    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">

    <link rel="stylesheet" href="fonts/icomoon/style.css">

    <link rel="stylesheet" href="bootstrapcss/owl.carousel.min.css">
    <script src="bootstrap/js/jquery-3.3.1.min.js"></script>
    <script src="bootstrap/js/popper.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="bootstrap/js/jquery.sticky.js"></script>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
</head>

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
        <li><a href="index.jsp">Home</a></li>
        <li><a href="listaappartamenti.jsp">Lista Immobili</a></li>
        <li><a href="valutazione.jsp">Valutazione Immobile</a></li>
        <li><a href="listaagenti.jsp">I Nostri Agenti</a></li>
        <li><a href="contact.jsp">Contattaci</a></li>
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
        <form class="search_form search_form_header advance_search_form" action="ServletRicerca" method="post">
            <div class="search_fields">
                <div class="search_wrap search_data">
                    <div class="top_fields">
                        <div class="search_select search_option">
                            <label>Località</label>
                            <span class="search_selectwrap">
							<div class="bootstrap-select picker trigger" style="width: 100%;">
							  <button type="button" onclick="apriScegliLocalita()" class="btn dropdown-toggle">
								<div class="filter-option">
								  <div class="filter-option-inner">
									<div id="valore_localita" class="filter-option-text">
									  Qualsiasi
									</div>
									  <input type="hidden" name="localita_immobile" id="localita_immobile"
                                             value="Qualsiasi">
								  </div>
								</div>
							  </button>
							  <div id="selezionaLocalita" class="dropdown-content wrap_content">
								<ul class="ul_inner">
								  <li>
									<a onclick="cambiaLocalita(this)" role="option" href="#">
									  <span class="icon-check check_mark"></span>
									  <span class="text">Qualsiasi</span>
									</a>
								</li>
                                    <%for (Città c : allCittàZone) {%>
								  <li>
									  <a onclick="cambiaLocalita(this)" role="option" href="#">
										<span class="icon-check check_mark"></span>
										<span class="text"><%=c.getNomeCittà()%></span>
									  </a>
								  </li>
                                    <%for (String z : c.getZone()) {%>
								  <li>
									<ul class="ul_inner">
									  <li>
										<a onclick="cambiaLocalita(this)" role="option" href="#">
										  <span class="icon-check check_mark"></span>
										  <span class="sublist text"><%=z%></span>
										</a>
									  </li>

                                        <%
                                                }
                                            }
                                        %>
									</ul>
								  </li>
								</ul>
							  </div>
							</div>
						  </span>
                        </div>
                        <div class="search_select search_option">
                            <label>Stato Immobile</label>
                            <span class="search_selectwrap">
							<div class="dropdown bootstrap-select picker trigger" style="width: 100%;">
							  <button type="button" onclick="apriScegliStato()" class="btn dropdown-toggle">
								<div class="filter-option">
								  <div class="filter-option-inner">
									<div id="valore_stato" class="filter-option-text">
									  Qualsiasi
									</div>
									<input type="hidden" name="stato_immobile" id="stato_immobile" value="Qualsiasi">
								  </div>
								</div>
							  </button>
							  <div id="selezionaStato" class="dropdown-content">
								<ul class="ul_inner">
								  <li>
									<a onclick="cambiaStato(this)" role="option" href="#">
									  <span class="icon-check check_mark"></span>
									  <span class="text">Qualsiasi</span>
									</a>
								</li>
								  <li>
									  <a onclick="cambiaStato(this)" role="option" href="#">
										<span class="icon-check check_mark"></span>
										<span class="text">In Vendita</span>
									  </a>
								  </li>
								  <li>
									<a onclick="cambiaStato(this)" role="option" href="#">
									  <span class="icon-check check_mark"></span>
									  <span class="text">in Affitto</span>
									</a>
								</li>
								</ul>
							  </div>
							</div>
						  </span>
                        </div>
                        <div class="search_select search_option">
                            <label>Tipo Immobile</label>
                            <span class="search_selectwrap">
							<div class="bootstrap-select picker trigger" style="width: 100%;">
							  <button type="button" onclick="apriScegliTipo()" class="btn dropdown-toggle">
								<div class="filter-option">
								  <div class="filter-option-inner">
									<div id="valore_tipo" class="filter-option-text">
									  Qualsiasi
									</div>
									<input type="hidden" name="tipo_immobile" id="tipo_immobile" value="Qualsiasi">
								  </div>
								</div>
							  </button>
							  <div id="selezionaTipo" class="dropdown-content wrap_content_max">
								<ul class="ul_inner">
								  <li>
									<a onclick="cambiaTipo(this)" role="option" href="#">
									  <span class="icon-check check_mark"></span>
									  <span class="text">Qualsiasi</span>
									</a>
								  </li>
                                    <%for (String s : categorie) {%>
								  <li>
									  <a onclick="cambiaTipo(this)" role="option" href="#">
										<span class="icon-check check_mark"></span>
										<span class="text"><%=s%></span>
									  </a>
								  </li>
                                    <%}%>
								</ul>
							  </div>
							</div>
						  </span>
                        </div>
                    </div>
                    <div id="advanced_option_div" class="form_collapsed_field_wrapper" style="display: none;">
                        <div class="collapsed_field_container search_advanced_fields">
                            <div class="search_option search_select search_beds">
                                <label>Min camere da letto</label>
                                <div class="bootstrap-select picker trigger" style="width: 100%;">
                                    <button type="button" onclick="apriScegliMinCamere()" class="btn dropdown-toggle">
                                        <div class="filter-option">
                                            <div class="filter-option-inner">
                                                <div id="valore_minCamere" class="filter-option-text">
                                                    Qualsiasi
                                                </div>
                                                <input type="hidden" name="camere_immobile" id="camere_immobile"
                                                       value="Qualsiasi">
                                            </div>
                                        </div>
                                    </button>
                                    <div id="selezionaMinCamere" class="dropdown-content wrap_content_half">
                                        <ul class="ul_inner">
                                            <li>
                                                <a onclick="cambiaMinCamere(this)" role="option" href="#">
                                                    <span class="icon-check check_mark"></span>
                                                    <span class="text">Qualsiasi</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a onclick="cambiaMinCamere(this)" role="option" href="#">
                                                    <span class="icon-check check_mark"></span>
                                                    <span class="text">1</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a onclick="cambiaMinCamere(this)" role="option" href="#">
                                                    <span class="icon-check check_mark"></span>
                                                    <span class="text">2</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="search_option search_select search_beds">
                                <label>Min bagni</label>
                                <div class="bootstrap-select picker trigger" style="width: 100%;">
                                    <button type="button" onclick="apriScegliMinBagni()" class="btn dropdown-toggle">
                                        <div class="filter-option">
                                            <div class="filter-option-inner">
                                                <div id="valore_minBagni" class="filter-option-text">
                                                    Qualsiasi
                                                </div>
                                                <input type="hidden" name="bagni_immobile" id="bagni_immobile"
                                                       value="Qualsiasi">
                                            </div>
                                        </div>
                                    </button>
                                    <div id="selezionaMinBagni" class="dropdown-content wrap_content_half">
                                        <ul class="ul_inner">
                                            <li>
                                                <a onclick="cambiaMinBagni(this)" role="option" href="#">
                                                    <span class="icon-check check_mark"></span>
                                                    <span class="text">Qualsiasi</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a onclick="cambiaMinBagni(this)" role="option" href="#">
                                                    <span class="icon-check check_mark"></span>
                                                    <span class="text">1</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a onclick="cambiaMinBagni(this)" role="option" href="#">
                                                    <span class="icon-check check_mark"></span>
                                                    <span class="text">2</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="search_option search_select search_beds">
                                <label>Prezzo minimo</label>
                                <input name="minPrezzo_immobile" type="text" placeholder="Qualsiasi">
                            </div>
                            <div class="search_option search_select search_beds">
                                <label>Prezzo massimo</label>
                                <input name="maxPrezzo_immobile" type="text" placeholder="Qualsiasi">
                            </div>
                            <div class="search_option search_select search_beds">
                                <label>Min Posti Auto</label>
                                <div class="bootstrap-select picker trigger" style="width: 100%;">
                                    <button type="button" onclick="apriScegliMinAuto()" class="btn dropdown-toggle">
                                        <div class="filter-option">
                                            <div class="filter-option-inner">
                                                <div id="valore_minAuto" class="filter-option-text">
                                                    Qualsiasi
                                                </div>
                                                <input type="hidden" name="auto_immobile" id="auto_immobile"
                                                       value="Qualsiasi">
                                            </div>
                                        </div>
                                    </button>
                                    <div id="selezionaMinAuto" class="dropdown-content wrap_content_half">
                                        <ul class="ul_inner">
                                            <li>
                                                <a onclick="cambiaMinAuto(this)" role="option" href="#">
                                                    <span class="icon-check check_mark"></span>
                                                    <span class="text">Qualsiasi</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a onclick="cambiaMinAuto(this)" role="option" href="#">
                                                    <span class="icon-check check_mark"></span>
                                                    <span class="text">1</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a onclick="cambiaMinAuto(this)" role="option" href="#">
                                                    <span class="icon-check check_mark"></span>
                                                    <span class="text">2</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="search_option search_select search_beds">
                                <label>Superificie minima (mq)</label>
                                <input name="minSuperficie_immobile" type="text" placeholder="Qualsiasi">
                            </div>
                            <div class="search_option search_select search_beds">
                                <label>Superficie massima (mq)</label>
                                <input name="maxSuperficie_immobile" type="text" placeholder="Qualsiasi">
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
                                %><a href="${pageContext.request.contextPath}/ServletDettagliAppartamento?id=<%=arrayAppartamento.get(i).getIdAppartamento()%>">
                                <img class="post_property" src="data:image/png;base64,<%=multi.getFotoString().get(0)%>"
                                     style="background-size: cover;">

                            </a><%
                                        p = true;
                                        break;
                                    }
                                }
                            %>
                                <div class="overlay_property"></div>
                                <div class="overlay_contents overlay_fadeIn_bottom">
                                    <a href="${pageContext.request.contextPath}/ServletDettagliAppartamento?id=<%=arrayAppartamento.get(i).getIdAppartamento()%>">Visualizza Immobili</a>
                                </div>
                            </div>
                        </figure>
                        <div class="list_card_details_wrap">
                            <div class="list_card_details">
                                <h3>
                                    <a href="${pageContext.request.contextPath}/ServletDettagliAppartamento?id=<%=arrayAppartamento.get(i).getIdAppartamento()%>"><%=arrayAppartamento.get(i).getNomeAppartamento()%>
                                    </a></h3>
                                <p class="list_card_description"><%
                                    if (arrayAppartamento.get(i).getDescrizioneAppartamento().length() > 30) {
                                %><%=arrayAppartamento.get(i).getDescrizioneAppartamento().substring(0, 30) + ".."%><%
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
                                    <p class="price">€<%=arrayAppartamento.get(i).getPrezzo()%>
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
                                        if (key.getBean().getIdAgente() == agenteBean.getIdAgente()) {
                                %><%=key.getContaCase()%><%
                                        }
                                    }%></span>
                                    <span class="head">Immobili posseduti</span>
                                </div>
                            </div>
                            <div class="social">
                                <%if(agenteBean.getLinkFacebook()!= null){%>
                                    <a href=""><i class="icon_social icon-facebook"></i></a>
                                <%}%>
                                <%if(agenteBean.getLinkInstagram()!= null){%>
                                    <a href=""><i class="icon_social icon-instagram"></i></a>
                                <%}%>
                            </div>
                        </div>
                        <div class="agent_profile_content">
                            <p>
                                <%=agenteBean.getDescrizionePersonale()%>
                            </p>
                        </div>
                        <div class="agent_card_details">
                            <div class="agent_card_contact">
                                <div class="agent_card_contact_wrap">
                                    <p class="contact">Cellulare: <a href=""><%=agenteBean.getTelefonoCellulare()%>
                                    </a></p>
                                    </a></p>
                                    <p class="contact"><a
                                            href="https://wa.me/39<%=agenteBean.getTelefonoCellulare()%>">Chatta su
                                        whatsapp</a></p>
                                    <p class="contact">Email: <a href=""><%=utenteBean.getEmail()%>
                                    </a></p>
                                </div>
                            </div>
                        </div>
                        <div class="horizontal_border"></div>
                        <div class="agent_profile_contact_form">
                            <div class="agent_form">
                                <form action="ServletMail" method="post">
                                    <div class="agent_form_field agent_form_text">
                                        <label>Nome</label>
                                        <input required type="text" placeholder="Il tuo nome" id="nomeGuest">
                                    </div>
                                    <div class="agent_form_field agent_form_text">
                                        <label>Email</label>
                                        <input required type="text" placeholder="La tua email" id="emailGuest">
                                    </div>
                                    <div class="agent_form_field agent_form_text">
                                        <label>Telefono</label>
                                        <input required type="text" placeholder="Il tuo numero di telefono" id="telefonoGuest">
                                    </div>
                                    <div class="agent_form_field agent_form_textarea">
                                        <label>Messaggio</label>
                                        <textarea required rows="6" placeholder="Il tuo messaggio"
                                                  id="messaggioGuest"></textarea>
                                    </div>
                                    <input type="hidden" id="agenteid" value="<%=agenteBean.getIdAgente()%>">
                                    <div class="form_privacy">
                          <span class="form_checkbox_label">
                            Consenso sulla privacy
                          </span>
                                        <input id="privacy" type="checkbox" style="display: block;">
                                        <label>Acconsento che questo sito Web memorizzi le informazioni inviate in modo che possano rispondere alla mia richiesta.</label>
                                    </div>
                                    <div class="agent_form_submit">
                                        <input type="submit" class="submit_button" value="Invia Messaggio">
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
                                    <a href="${pageContext.request.contextPath}/ServletDettagliAppartamento?id=<%=visualizzazioneImmobile.getIdAppartamento()%>">
                                        <img width="680" height="510" src="data:image/png;base64,<%=visualizzazioneImmobile.getFoto()%>">
                                    </a>
                                </div>
                            </figure>
                            <div class="featured_card_details">
                                <h3>
                                    <a href="${pageContext.request.contextPath}/ServletDettagliAppartamento?id=<%=visualizzazioneImmobile.getIdAppartamento()%>"><%=visualizzazioneImmobile.getNomeAppartamento()%>
                                    </a>
                                </h3>
                                <p class="featured_card_description"><%
                                    if (visualizzazioneImmobile.getDescrizioneAppartamento().length() > 30) {
                                %><%=visualizzazioneImmobile.getDescrizioneAppartamento().substring(0, 30) + ".."%><%
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
<script type=text/javascript>
    function validate(){
        var privacy = document.getElementById("privacy");
        if (privacy.checked != 1){
            alert("Spunta la casella sul consenso della privacy")
        }
    }
</script>
</html>
