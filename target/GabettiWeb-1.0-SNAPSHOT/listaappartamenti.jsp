<%@ page import="java.util.ArrayList" %>
<%@ page import="model.appartamento.AppartamentoBean" %>
<%@ page import="model.agente.AgenteBean" %>
<%@ page import="model.utente.UtenteBean" %>
<%@ page import="UtilityClass.CompositeKeyAgenteCase" %>
<%@ page import="UtilityClass.Città" %>
<%@ page import="model.multimedia.MultimediaBean" %>
<%@ page import="UtilityClass.VisualizzazioneImmobile" %>
<%@ page import="java.util.Collections" %>
<%@ page import="UtilityClass.PrezzoCrescenteImmobileComparator" %><%--
  Created by IntelliJ IDEA.
  User: Luca
  Date: 17/03/2022
  Time: 08:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!-- Created By CodingLab - www.codinglabweb.com -->
<html lang="it" dir="ltr">
<head>
    <meta charset="utf-8">
    <!--------- <title>Responsive Navigation Menu</title>------>
    <link rel="stylesheet" href="css/aggiunte.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/listaappartamenti.css">


    <link rel="stylesheet" href="icomoon/style.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB41DRUbKWJHPxaFjMAwdrzWzbVKartNGg&v=weekly"
            defer></script>
    <link rel="stylesheet" href="icomoon/style.css">

    <link rel="stylesheet" href="bootstrapcss/owl.carousel.min.css">
    <script src="bootstrap/js/jquery-3.3.1.min.js"></script>
    <script src="bootstrap/js/popper.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="bootstrap/js/jquery.sticky.js"></script>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
</head>
<%
    ArrayList<Città> allCittàZone = (ArrayList<Città>) request.getSession().getAttribute("allCittaZone");
    if (allCittàZone == null) {
        request.getSession().setAttribute("nomepagina", "listaappartamenti.jsp");
        response.sendRedirect(response.encodeRedirectURL("ServletValutazioneCampiRicerca"));
        return;
    }
    ArrayList<String> categorie = (ArrayList<String>) request.getSession().getAttribute("categorie");
    ArrayList<AppartamentoBean> appArray = (ArrayList<AppartamentoBean>) request.getAttribute("array");
    if (appArray == null) {
        response.sendRedirect(response.encodeRedirectURL("ServletListaAppartamenti?ordina=default&numero=1"));
        return;
    }
    String ordinamento = (String) request.getAttribute("ordinamento");
    String pagina = (String) request.getAttribute("pagina");
    ArrayList<MultimediaBean> multimediaBeans = (ArrayList<MultimediaBean>) request.getAttribute("multimedia");
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
        <li><a href="index.jsp">Home</a></li>
        <li><a class="active" href="listaappartamenti.jsp">Lista Immobili</a></li>
        <li><a href="valutazione.jsp">Valutazione Immobile</a></li>
        <li><a href="listaagenti.jsp">I Nostri Agenti</a></li>
        <li><a href="contact.jsp">Contattaci</a></li>
    </ul>
</nav>
<div class="content">
    <section class="banner" style="background-image: url(images/banner.jpg); background-position: center 0%;">
        <div class="banner_wrap">
            <h1 class="banner_title">Lista Immobili</h1>
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
									<div id="valore_localita" class="filter-option-text">Qualsiasi</div>
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
                            <a href="ServletListaAppartamenti?ordina=default&numero=1">Visualizzazioni</a>
                            <a href="ServletListaAppartamenti?ordina=prezzoCrescente&numero=1">Prezzo Crescente</a>
                            <a href="ServletListaAppartamenti?ordina=prezzoDecrescente&numero=1">Prezzo Decrescente</a>
                            <%} else if (pagina.equals("ricercaAppartamenti")) {%>
                            <a href="ServletRicercaAppartamenti?ordina=default&numero=1">Visualizzazioni</a>
                            <a href="ServletRicercaAppartamenti?ordina=prezzoCrescente&numero=1">Prezzo Crescente</a>
                            <a href="ServletRicercaAppartamenti?ordina=prezzoDecrescente&numero=1">Prezzo
                                Decrescente</a>
                            <%}%>
                        </div>
                    </div>
                </div>
            </div>
            <div class="page_listing">
                <%for (AppartamentoBean appartamentoBean : appArray) {%>
                <input type="hidden" name="idAppartamento" value="<%=appartamentoBean.getIdAppartamento()%>">
                <div class="list_card">
                    <div class="list_card_wrap">
                        <figure class="list_card_picture">
                            <div class="figure_property">
                                <%
                                    boolean p = false;
                                    for (MultimediaBean multi : multimediaBeans) {
                                        if (multi.getIdAppartamento() == appartamentoBean.getIdAppartamento() && multi.getFotoString() != null && !p) {
                                %>
                                <a href="${pageContext.request.contextPath}/ServletDettagliAppartamento?id=<%=appartamentoBean.getIdAppartamento()%>">
                                    <img src="data:image/png;base64,<%=multi.getFotoString().get(0)%>"
                                         style="width:100%">
                                </a>
                                <%
                                            p = true;
                                            break;
                                        }
                                    }%>
                            </div>
                        </figure>
                        <div class="list_card_details_wrap">
                            <div class="list_card_details">
                                <h3>
                                    <a href="${pageContext.request.contextPath}/ServletDettagliAppartamento?id=<%=appartamentoBean.getIdAppartamento()%>"><%=appartamentoBean.getNomeAppartamento()%>
                                    </a>
                                </h3>
                                <p class="list_card_description"><%
                                    if (appartamentoBean.getDescrizioneAppartamento().length() > 30) {
                                %><%=appartamentoBean.getDescrizioneAppartamento().substring(0, 30) + ".."%><%
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
                                    <span class="agent"><%
                                        for (AgenteBean bean : agenteArray) {
                                            if (bean.getIdAgente() == appartamentoBean.getIdAgente()) {
                                                for (UtenteBean utenteBean : utenteArray) {
                                                    if (utenteBean.getIdUtente() == bean.getIdUtente()) {%>
                                                        <a href="${pageContext.request.contextPath}/ServletAgentePage?id=<%=utenteBean.getIdUtente()%>"><%=utenteBean.getNome() + " " + utenteBean.getCognome()%></a><%
                                                        }
                                                    }
                                                }
                                            }%></span>
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
                <a href="${pageContext.request.contextPath}/ServletListaAppartamenti?ordina=<%=ordinamento%>&numero=<%=i%>"
                   class="pagination_btn"><%=i%>
                </a>
                <%} else if (pagina.equals("ricercaAppartamenti")) {%>
                <a href="${pageContext.request.contextPath}/ServletRicercaAppartamenti?ordina=<%=ordinamento%>&numero=<%=i%>"
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
                            for (int k = 0; k < 2; k++) {
                                for (UtenteBean utenteBean : utenteArray) {
                                    if (utenteBean.getIdUtente() == arrayComp.get(k).getBean().getIdUtente()) {
                        %>
                        <article class="agent_list_item clearfix">
                            <figure class="agent_picture">
                                <a href="${pageContext.request.contextPath}/ServletAgentePage?id=<%=utenteBean.getIdUtente()%>"><img
                                        src="data:image/png;base64,<%=utenteBean.getFotoString()%>"></a>
                            </figure>
                            <div class="agent_widget_content">
                                <h4 class="agent_name">
                                    <a href="${pageContext.request.contextPath}/ServletAgentePage?id=<%=utenteBean.getIdUtente()%>"><%=utenteBean.getNome() + " " + utenteBean.getCognome()%>
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
                                    <a href="${pageContext.request.contextPath}/ServletDettagliAppartamento?id=<%=visualizzazioneImmobile.getIdAppartamento()%>">
                                        <img width="680" height="510"
                                             src="data:image/png;base64,<%=visualizzazioneImmobile.getFoto()%>">
                                    </a>
                                </div>
                            </figure>
                            <div class="featured_card_details">
                                <h3>
                                    <a href="${pageContext.request.contextPath}/ServletDettagliAppartamento?id=<%=visualizzazioneImmobile.getIdAppartamento()%>"><%=visualizzazioneImmobile.getNomeAppartamento()%>
                                    </a>
                                </h3>
                                <p class="featured_card_description"><%=visualizzazioneImmobile.getDescrizioneAppartamento()%>
                                </p>
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
            console.log(oldWord);
            console.log(text.innerHTML);
            console.log("risultato: " + oldWord.replace(text.innerHTML, ""));
            var newWord = oldWord.replace(text.innerHTML, "");
            console.log("sss" + newWord);
            div.innerHTML = newWord;
            console.log("a" + newWord + "a");
            if (newWord.includes(" ") && newWord.length < 3) {
                div.innerHTML = "Tutte le località";
            }
        } else {
            elem.classList.add("li_selected");
            if (div.textContent.includes("Tutte le località")) {
                console.log("Sium");
                div.innerHTML = text.innerHTML;
            }
            if (div.textContent.includes(text.innerHTML)) {
                console.log("Sium");
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
    // This example displays a marker at the center of Australia.
    // When the user clicks the marker, an info window opens.
    function initMap(json, i, map) {
        var geocoder = new google.maps.Geocoder();
        var address = json[i].indirizzo;
        var lat = 0;
        var lng = 0;
        geocoder.geocode({'address': address}, function (results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                var latitude = results[0].geometry.location.lat();
                var longitude = results[0].geometry.location.lng();

                localStorage.setItem("endlat"+i+"", latitude);
                localStorage.setItem("endlng"+i+"", longitude);

            }
        });
        lat = parseFloat(localStorage.getItem("endlat"+i+""));
        lng = parseFloat(localStorage.getItem("endlng"+i+""));
        const uluru = {lat: lat, lng: lng};
        console.log(lat+"\n"+lng)
        const contentString =
            '<div class="property_map" id="marker' + i + '">' +
            '<article class="featured_card featured_card_block">' +
            '<div class="featured_card_wrap">' +
            '<figure class=featured_card_figure>' +
            '<div class="featured_card_picture">' +
            '<a href="">' +
            '<img src="'+json[i].foto+'">' +
            '</a>' +
            '</div>' +
            '</figure>' +
            '<div class=featured_card_details>' +
            '<h3>' +
            '<a>'+json[i].nome+'</a>' +
            '</h3>' +
            '<p class=featured_card_description>'+json[i].descrizione+'</p>' +
            '<div class="featured_card_features_wrap">' +
            '<div class="featured_card_feature">' +
            '<span class="features_title">Camere da letto</span>' +
            '<div>' +
            '<i class="feature_icon icon-bed"></i>' +
            '<span class="text_feature">'+json[i].letti+'</span>' +
            '</div>' +
            '</div>' +
            '<div class="featured_card_feature">' +
            '<span class="features_title">Bagni</span>' +
            '<div>' +
            '<i class="feature_icon icon-shower"></i>' +
            '<span class="text_feature">'+json[i].bagni+'</span>' +
            '</div>' +
            '</div>' +
            '<div class="featured_card_feature">' +
            '<span class="features_title">Superficie</span>' +
            '<div>' +
            '<i class="feature_icon icon-square-o"></i>' +
            '<span class="text_feature">'+json[i].superficie+'</span>' +
            '</div>' +
            '</div>' +
            '</div>' +
            '<div class="featured_card_priceLabel">' +
            '<div class="featured_card_price">' +
            '<span class=status>'+json[i].tipoVendiata+'</span>' +
            '<p class="price">€ '+json[i].prezzo+'</p>' +
            '</div>' +
            '</div>' +
            '</div>' +
            '</article>' +
            '</div>';

        const infowindow = new google.maps.InfoWindow({
            content: contentString,
            maxWidth: 450,
        });


        const marker = new google.maps.Marker({
            position: uluru,
            map,
        });

        marker.addListener("click", () => {
            infowindow.open({
                anchor: marker,
                map,
                shouldFocus: false,
            });
        });

    }

    window.initMap = initMap;
</script>

<script>
    function mappa(map) {
        var idAppartamenti = [];
        var elements = document.getElementsByName("idAppartamento");
        for (var i = 0; i < elements.length; i++) {
            idAppartamenti.push(parseInt(elements[i].value));
        }
        var stringa = JSON.stringify(idAppartamenti);
        $.post('ServletProvaJson', {idAppartamenti: stringa}, function (listJson) {
            var json = JSON.parse(listJson);
            for (var i = 0; i < json.length; i++) {
                initMap(json, i, map);
            }
        })
    };
</script>

<script>
    $(document).ready(function () {
        const uluru = {lat:40.7454000, lng:14.6454200}
        const map = new google.maps.Map(document.getElementById("map"), {
            zoom: 10,
            center: uluru,
        });
        mappa(map)
    });

</script>


<script src="script/valutazione.js"></script>
<script src="script/index.js"></script>
<script src="bootstrap/js/jquery-3.3.1.min.js"></script>
<script src="bootstrap/js/popper.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="bootstrap/js/jquery.sticky.js"></script>
</body>
</html>

