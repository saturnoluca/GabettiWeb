<%@ page import="model.appartamento.AppartamentoBean" %>
<%@ page import="model.agente.AgenteBean" %>
<%@ page import="model.utente.UtenteBean" %>
<%@ page import="model.indirizzo.IndirizzoBean" %>
<%@ page import="model.multimedia.MultimediaBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="UtilityClass.CompositeKeyAgenteCase" %><%--
  Created by IntelliJ IDEA.
  User: Luca
  Date: 25/02/2022
  Time: 16:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="it">
<%
    if (request.getAttribute("utente") == null) {
        response.sendRedirect(response.encodeRedirectURL("IndexServlet"));
        return;
    }
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

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
</head>

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
        <li><a href="listaagenti.jsp">I Nostri Agenti</a></li>
        <li><a href="contact.html">Contattaci</a></li>
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
    <section class="section-agent section_flex wrap_padding">
        <div class="page page_agent page_main">
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
                                    <span class="head">Proprietà possedute</span>
                                </div>
                            </div>
                            <div class="social">
                                <a href=""><i class="icon_social icon-facebook"></i></a>
                                <a href=""><i class="icon_social icon-twitter"></i></a>
                                <a href=""><i class="icon_social icon-instagram"></i></a>
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
                                    <p class="contact">Whatsapp: <a
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
                                        <input type="text" placeholder="Il tuo nome" id="nomeGuest">
                                    </div>
                                    <div class="agent_form_field agent_form_text">
                                        <label>Email</label>
                                        <input type="text" placeholder="La tua email" id="emailGuest">
                                    </div>
                                    <div class="agent_form_field agent_form_text">
                                        <label>Telefono</label>
                                        <input type="text" placeholder="Il tuo numero di telefono" id="telefonoGuest">
                                    </div>
                                    <div class="agent_form_field agent_form_textarea">
                                        <label>Messaggio</label>
                                        <textarea rows="6" placeholder="Il tuo messaggio"
                                                  id="messaggioGuest"></textarea>
                                    </div>
                                    <input type="hidden" id="agenteid" value="<%=agenteBean.getIdAgente()%>">
                                    <div class="form_privacy">
                          <span class="form_checkbox_label">
                            Consenso sulla privacy
                          </span>
                                        <input type="checkbox">
                                        <label>I consent to having this website store my submitted information so they
                                            can
                                            respond to my inquiry.</label>
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
            <div class="div_mylistings div_agent_mylistings">
                <h2 class="page_title">
                    <span class="sub">Le Mie Proprietà</span>
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
                                    <a href="">Visualizza Proprietà</a>
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
        </div>
        <div class="page_right page_sidebar">
            <aside class="featured_sidebar">
                <section class="widget">
                    <h3 class="title">Proprietà in evidenza</h3>
                    <%
                        boolean p = false;
                        for (int i = 0; i < 1; i++) {
                            if (inEvidenza.get(0).getIdAgente() == agenteBean.getIdAgente()) {
                    %>
                    <article class="featured_card featured_card_block">
                        <div class="featured_card_wrap">
                            <figure class="featured_card_figure">
                                <div class="featured_card_picture">
                                    <%
                                        for (MultimediaBean multi : arrayMultimedia) {
                                            if (multi.getIdAppartamento() == inEvidenza.get(0).getIdAppartamento() && multi.getFotoString() != null && !p) {
                                    %><a href="">
                                    <img width="680" height="510"
                                         src="data:image/png;base64,<%=multi.getFotoString().get(0)%>">
                                </a><%
                                            p = true;
                                            break;
                                        }
                                    }%>
                                </div>
                            </figure>
                            <div class="featured_card_details">
                                <h3>
                                    <a href=""><%=inEvidenza.get(0).getNomeAppartamento()%>
                                    </a>
                                </h3>
                                <p class="featured_card_description"><%
                                    if (inEvidenza.get(0).getDescrizioneAppartamento().length() > 30) {
                                %><%=inEvidenza.get(0).getDescrizioneAppartamento().substring(0, 30) + ".."%><%
                                } else {
                                %><%=inEvidenza.get(0).getDescrizioneAppartamento()%><%
                                    }%></p>
                                <div class="featured_card_features_wrap">
                                    <div class="featured_card_feature">
                                        <span class="features_title">Camere da letto</span>
                                        <div>
                                            <i class="feature_icon icon-bed"></i>
                                            <span class="text"><%=inEvidenza.get(0).getCamereLetto()%></span>
                                        </div>
                                    </div>
                                    <div class="featured_card_feature">
                                        <span class="features_title">Bagni</span>
                                        <div>
                                            <i class="feature_icon icon-shower"></i>
                                            <span class="text"><%=inEvidenza.get(0).getBagni()%></span>
                                        </div>
                                    </div>
                                    <div class="featured_card_feature">
                                        <span class="features_title">Superficie</span>
                                        <div>
                                            <i class="feature_icon icon-crop_square"></i>
                                            <span class="text"><%=inEvidenza.get(0).getSuperficie()%></span>
                                            <span class=>mq</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="featured_card_priceLabel">
                                    <div class="featured_card_price">
                                        <span class="status"><%=inEvidenza.get(0).getTipoVendita()%></span>
                                        <p class="price">€<%=inEvidenza.get(0).getPrezzo()%>
                                        </p>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </article>
                    <%
                            }
                        }%>
                </section>
            </aside>
        </div>
    </section>
    <jsp:include page="footer.jsp"/>
</div>

</body>

</html>
