<%@ page import="java.util.ArrayList" %>
<%@ page import="model.utente.UtenteBean" %>
<%@ page import="model.agente.AgenteBean" %>
<%@ page import="model.appartamento.AppartamentoBean" %>
<%@ page import="UtilityClass.CompositeKeyAgenteCase" %>
<%@ page import="model.collaboratore.CollaboratoreBean" %><%--
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

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="script/index.js"></script>
    <script src="bootstrap/js/jquery-3.3.1.min.js"></script>
    <script src="bootstrap/js/popper.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="bootstrap/js/jquery.sticky.js"></script>

    <title>Gabetti Nocera | Agente</title>
</head>

<%
    ArrayList<UtenteBean> utenteBeans = (ArrayList<UtenteBean>) request.getAttribute("utenti");
    if (utenteBeans == null) {
        response.sendRedirect("ServletAgentiPage");
        return;
    }
    ArrayList<CompositeKeyAgenteCase> agenteBeans = (ArrayList<CompositeKeyAgenteCase>) request.getAttribute("agentiCase");
    ArrayList<AppartamentoBean> appartamentoBeans = (ArrayList<AppartamentoBean>) request.getAttribute("inEvidenza");
    ArrayList<CollaboratoreBean> collaboratoreBeans = (ArrayList<CollaboratoreBean>) request.getAttribute("collaboratori");
%>
<body>
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
        <li><a class="active" href="listaagenti.jsp">I Nostri Agenti</a></li>
        <li><a href="contact.html">Contattaci</a></li>
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
        <form class="search_form search_form_header advance_search_form">
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
								  <li>
									  <a onclick="cambiaLocalita(this)" role="option" href="#">
										<span class="icon-check check_mark"></span>
										<span class="text">Sarno</span>
									  </a>
								  </li>
								  <li>
									<ul class="ul_inner">
									  <li>
										<a onclick="cambiaLocalita(this)" role="option" href="#">
										  <span class="icon-check check_mark"></span>
										  <span class="sublist text">Episcopio</span>
										</a>
									  </li>
									  <li>
										<a onclick="cambiaLocalita(this)" role="option" href="#">
										  <span class="icon-check check_mark"></span>
										  <span class="sublist text">Lavorate</span>
										</a>
									  </li>
									  <li>
										<a onclick="cambiaLocalita(this)" role="option" href="#">
										  <span class="icon-check check_mark"></span>
										  <span class="sublist text">Foce</span>
										</a>
									  </li>
									</ul>
								  </li>
								  <li>
									<a onclick="cambiaLocalita(this)" onclick="cambia(this)" role="option" href="#">
									  <span class="icon-check check_mark"></span>
									  <span class="text">Sarno</span>
									</a>
								  </li>
								  <li>
									<ul class="ul_inner">
									  <li>
										<a onclick="cambiaLocalita(this)" role="option" href="#">
										  <span class="icon-check check_mark"></span>
										  <span class="sublist text">Episcopio</span>
										</a>
									  </li>
									  <li>
										<a onclick="cambiaLocalita(this)" role="option" href="#">
										  <span class="icon-check check_mark"></span>
										  <span class="sublist text">Lavorate</span>
										</a>
									  </li>
									  <li>
										<a onclick="cambiaLocalita(this)" role="option" href="#">
										  <span class="icon-check check_mark"></span>
										  <span class="sublist text">Foce</span>
										</a>
									  </li>
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
								  <li>
									  <a onclick="cambiaTipo(this)" role="option" href="#">
										<span class="icon-check check_mark"></span>
										<span class="text">Appartamento</span>
									  </a>
								  </li>
								  <li>
									<a onclick="cambiaTipo(this)" role="option" href="#">
									  <span class="icon-check check_mark"></span>
									  <span class="text">Abitazione economia</span>
									</a>
								  </li>
								  <li>
									<a onclick="cambiaTipo(this)" role="option" href="#">
									  <span class="icon-check check_mark"></span>
									  <span class="text">Mansarda</span>
									</a>
								  </li>
								  <li>
									<a onclick="cambiaTipo(this)" role="option" href="#">
									  <span class="icon-check check_mark"></span>
									  <span class="text">Villetta a schiera</span>
									</a>
								  </li>
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
                                <div class="bootstrap-select picker trigger" style="width: 100%;">
                                    <button type="button" onclick="apriScegliMinPrezzo()" class="btn dropdown-toggle">
                                        <div class="filter-option">
                                            <div class="filter-option-inner">
                                                <div id="valore_minPrezzo" class="filter-option-text">
                                                    Qualsiasi
                                                </div>
                                                <input type="hidden" name="minPrezzo_immobile" id="minPrezzo_immobile"
                                                       value="Qualsiasi">
                                            </div>
                                        </div>
                                    </button>
                                    <div id="selezionaMinPrezzo" class="dropdown-content wrap_content_half">
                                        <ul class="ul_inner">
                                            <li>
                                                <a onclick="cambiaMinPrezzo(this)" role="option" href="#">
                                                    <span class="icon-check check_mark"></span>
                                                    <span class="text">Qualsiasi</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a onclick="cambiaMinPrezzo(this)" role="option" href="#">
                                                    <span class="icon-check check_mark"></span>
                                                    <span class="text">1</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a onclick="cambiaMinPrezzo(this)" role="option" href="#">
                                                    <span class="icon-check check_mark"></span>
                                                    <span class="text">2</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="search_option search_select search_beds">
                                <label>Prezzo massimo</label>
                                <div class="bootstrap-select picker trigger" style="width: 100%;">
                                    <button type="button" onclick="apriScegliMaxPrezzo()" class="btn dropdown-toggle">
                                        <div class="filter-option">
                                            <div class="filter-option-inner">
                                                <div id="valore_maxPrezzo" class="filter-option-text">
                                                    Qualsiasi
                                                </div>
                                                <input type="hidden" name="maxPrezzo_immobile" id="maxPrezzo_immobile"
                                                       value="Qualsiasi">
                                            </div>
                                        </div>
                                    </button>
                                    <div id="selezionaMaxPrezzo" class="dropdown-content wrap_content_half">
                                        <ul class="ul_inner">
                                            <li>
                                                <a onclick="cambiaMaxPrezzo(this)" role="option" href="#">
                                                    <span class="icon-check check_mark"></span>
                                                    <span class="text">Qualsiasi</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a onclick="cambiaMaxPrezzo(this)" role="option" href="#">
                                                    <span class="icon-check check_mark"></span>
                                                    <span class="text">1</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a onclick="cambiaMaxPrezzo(this)" role="option" href="#">
                                                    <span class="icon-check check_mark"></span>
                                                    <span class="text">2</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
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
                                <label>Agenti</label>
                                <div class="bootstrap-select picker trigger" style="width: 100%;">
                                    <button type="button" onclick="apriScegliAgente()" class="btn dropdown-toggle">
                                        <div class="filter-option">
                                            <div class="filter-option-inner">
                                                <div id="valore_agente" class="filter-option-text">
                                                    Qualsiasi
                                                </div>
                                                <input type="hidden" name="agente_immobile" id="agente_immobile"
                                                       value="Qualsiasi">
                                            </div>
                                        </div>
                                    </button>
                                    <div id="selezionaAgente" class="dropdown-content wrap_content_half">
                                        <ul class="ul_inner">
                                            <li>
                                                <a onclick="cambiaAgente(this)" role="option" href="#">
                                                    <span class="icon-check check_mark"></span>
                                                    <span class="text">Qualsiasi</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a onclick="cambiaAgente(this)" role="option" href="#">
                                                    <span class="icon-check check_mark"></span>
                                                    <span class="text">1</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a onclick="cambiaAgente(this)" role="option" href="#">
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
                                <a href="">
                                    <%if (u.getFotoString() == null) {%>
                                    <img src="images/agente.jpg">
                                    <%} else {%>
                                    <img src="data:image/png;base64,<%=u.getFotoString()%>">
                                    <%}%>

                                </a>
                            </figure>
                            <div class="agent_card_name">
                                <h4 class="name">
                                    <a href=""><%=u.getNome() + " " + u.getCognome()%>
                                    </a>
                                </h4>
                                <%if (u.getRuolo().equals("Collaboratore")) {%>
                                <h4 class="name">
                                    Collaboratore associato all'agente:<a href=""><%
                                    for (CollaboratoreBean c : collaboratoreBeans) {
                                        for (CompositeKeyAgenteCase agenteCase : agenteBeans) {
                                            if (c.getIdAgente() == agenteCase.getBean().getIdAgente()) {
                                                for (UtenteBean utente : utenteBeans) {
                                                    if (utente.getIdUtente() == agenteCase.getBean().getIdUtente()) {
                                %><%=utente.getNome() + " " + utente.getCognome()%><%
                                                    }
                                                }
                                            }
                                        }
                                    }%></a>
                                </h4>
                                <%}%>
                            </div>
                            <div class="agent_card_listings">
                                <p class="head">Proprietà possedute</p>
                                <%if (u.getRuolo().equals("Agente")) {%>
                                <p class="count"><%
                                    for (CompositeKeyAgenteCase ag : agenteBeans) {
                                        if (u.getIdUtente() == ag.getBean().getIdUtente()) {
                                %><%=ag.getContaCase()%><%
                                        }
                                    }%></p>
                                <%} else {%>
                                <p class="count"><%
                                    for (CollaboratoreBean c : collaboratoreBeans) {
                                        if (u.getIdUtente() == c.getIdUtente()) {
                                            for(CompositeKeyAgenteCase ag : agenteBeans){
                                                if(ag.getBean().getIdAgente()==c.getIdAgente()){
                                                     %>
                                        <%=ag.getContaCase()%>
                                        <%
                                                }
                                            }
                                        }
                                    }%>
                                        <%}%>
                            </div>
                        </div>
                        <div class="agent_card_details">
                            <p>
                                <%
                                    if (u.getRuolo().equals("Agente")) {
                                        for (CompositeKeyAgenteCase ag : agenteBeans) {
                                            if (u.getIdUtente() == ag.getBean().getIdUtente()) {
                                %><%=ag.getBean().getDescrizionePersonale()%><%
                                    }
                                }
                            } else {
                            %><%
                                for (CollaboratoreBean c : collaboratoreBeans) {
                                    if (u.getIdUtente() == c.getIdUtente()) {
                            %><%=c.getDescrizionePersonale()%><%
                                    }
                                }%><%
                                }%>
                            </p>
                            <div class="agent_card_contact">
                                <div class="agent_card_contact_wrap">
                                    <%
                                        if (u.getRuolo().equals("Agente")) {
                                            for (CompositeKeyAgenteCase ag : agenteBeans) {
                                                if (ag.getBean().getIdUtente() == u.getIdUtente()) {
                                    %> <p class="contact">Cellulare: <a href=""><%=ag.getBean().getTelefonoCellulare()%>
                                </a></p>
                                    <a href="https://wa.me/39<%=ag.getBean().getTelefonoCellulare()%>"><p
                                            class="contact">Whatsapp</p></a>
                                    <p class="contact">Email: <a href=""><%=u.getEmail()%>
                                    </a></p><%
                                        }
                                    }
                                %>
                                    <%}%>
                                </div>
                                <%
                                    if (u.getRuolo().equals("Agente")) {
                                        for (CompositeKeyAgenteCase ag : agenteBeans) {
                                            if (ag.getBean().getIdUtente() == u.getIdUtente()) {
                                %><a
                                    href="${pageContext.request.contextPath}/ServletAgentePage?id=<%=ag.getBean().getIdAgente()%>"
                                    class="agent_card_link">
                                <span>Visualizza le mie proprietà</span>
                                <i class="icon-angle-right"></i>
                            </a><%
                                    }
                                }
                            } else {
                                for (CollaboratoreBean c : collaboratoreBeans) {
                                    if (c.getIdUtente() == u.getIdUtente()) {
                                        for (CompositeKeyAgenteCase ag : agenteBeans) {
                                            if (ag.getBean().getIdAgente() == c.getIdAgente()) {
                            %><a href="${pageContext.request.contextPath}/ServletAgentePage?id=<%=ag.getBean().getIdAgente()%>"
                                 class="agent_card_link">
                                <span>Visualizza le mie proprietà</span>
                                <i class="icon-angle-right"></i>
                            </a><%
                                                }
                                            }
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
                    <h3 class="title">Proprietà in evidenza</h3>
                    <article class="featured_card featured_card_block">
                        <div class="featured_card_wrap">
                            <figure class="featured_card_figure">
                                <div class="featured_card_picture">
                                    <a href="">
                                        <img width="680" height="510" src="images/prova.jpg">
                                    </a>
                                </div>
                            </figure>
                            <div class="featured_card_details">
                                <h3>
                                    <a href=""><%=appartamentoBeans.get(0).getNomeAppartamento()%>
                                    </a>
                                </h3>
                                <p class="featured_card_description">
                                    <%
                                        if (appartamentoBeans.get(0).getDescrizioneAppartamento().length() > 30) {
                                    %>
                                    <%=appartamentoBeans.get(0).getDescrizioneAppartamento().substring(0, 30) + "..."%>
                                    <%
                                    } else {
                                    %>
                                    <%=appartamentoBeans.get(0).getDescrizioneAppartamento()%>
                                    <%}%>
                                </p>
                                <div class="featured_card_features_wrap">
                                    <div class="featured_card_feature">
                                        <span class="features_title">Camere da letto</span>
                                        <div>
                                            <i class="feature_icon icon-bed"></i>
                                            <span class="text"><%=appartamentoBeans.get(0).getCamereLetto()%></span>
                                        </div>
                                    </div>
                                    <div class="featured_card_feature">
                                        <span class="features_title">Bagni</span>
                                        <div>
                                            <i class="feature_icon icon-shower"></i>
                                            <span class="text"><%=appartamentoBeans.get(0).getBagni()%></span>
                                        </div>
                                    </div>
                                    <div class="featured_card_feature">
                                        <span class="features_title">Superficie</span>
                                        <div>
                                            <i class="feature_icon icon-crop_square"></i>
                                            <span class="text"><%=appartamentoBeans.get(0).getSuperficie()%></span>
                                            <span class=>mq</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="featured_card_priceLabel">
                                    <div class="featured_card_price">
                                        <span class="status"><%=appartamentoBeans.get(0).getTipoVendita()%></span>
                                        <p class="price"><%=appartamentoBeans.get(0).getPrezzo() + "€"%>
                                        </p>
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
