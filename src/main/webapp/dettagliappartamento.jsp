<%@ page import="model.appartamento.AppartamentoBean" %>
<%@ page import="model.agente.AgenteBean" %>
<%@ page import="model.utente.UtenteBean" %>
<%@ page import="model.indirizzo.IndirizzoBean" %>
<%@ page import="model.multimedia.MultimediaBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="UtilityClass.VisualizzazioneImmobile" %><%--
  Created by IntelliJ IDEA.
  User: Luca
  Date: 14/03/2022
  Time: 09:20
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

</head>
<%
    AppartamentoBean appBean = (AppartamentoBean) request.getAttribute("appartamento");
    if (appBean == null) {
        response.sendRedirect(response.encodeRedirectURL("index.jsp"));
        return;
    }
    AgenteBean agenteBean = (AgenteBean) request.getAttribute("agente");
    UtenteBean utenteBean = (UtenteBean) request.getAttribute("utente");
    IndirizzoBean indirizzoBean = (IndirizzoBean) request.getAttribute("indirizzo");
    MultimediaBean multimediaBean = (MultimediaBean) request.getAttribute("multimedia");
    ArrayList<AppartamentoBean> array = (ArrayList<AppartamentoBean>) request.getAttribute("visite");
    VisualizzazioneImmobile visualizzazioneImmobile = (VisualizzazioneImmobile) request.getAttribute("featured");
    ArrayList<MultimediaBean> allMulti = (ArrayList<MultimediaBean>) request.getAttribute("allMulti");

%>

<body>
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
        <li><a href="index.jsp">Home</a></li>
        <li><a href="listaappartamenti.jsp">Lista Immobili</a></li>
        <li><a class="active" href="valutazione.jsp">Valutazione Immobile</a></li>
        <li><a href="listaagenti.jsp">I Nostri Agenti</a></li>
        <li><a href="contact.html">Contattaci</a></li>
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
        <form class="search_form search_form_header advance_search_form noPrint" action="ServletRicerca" method="post">
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
            <div class="search_button noPrint">
                <div class="search_buttonwrap noPrint">
                    <div class="search_advance noPrint">
                        <button type="button" onclick="advancedOption()" id="advanced_options"
                                class="search_advance_button noPrint">
                            <i class="icon-search-plus noPrint"></i>
                        </button>
                    </div>
                    <div class="search_buttonSubmit noPrint">
                        <button class="submit button_search noPrint">
                            <i class="icon-search noPrint"></i>
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
                    <p class="address"><%=indirizzoBean.toString()%>
                    </p>
                </div>
                <div class="property_price">
                    <p class="status"><%=appBean.getTipoVendita()%>
                    </p>
                    <p class="price">€<%=appBean.getPrezzo()    %>
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
                            <img class="d-block w-100"
                                 src="data:image/png;base64,<%=multimediaBean.getFotoString().get(i)%>">
                        </div>
                        <%}%>
                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>

                <div class="property_wrap">
                    <div class="property_main">
                        <div class="property_content">
                            <div class="property_content_head">
                                <div class="property_name">
                                    <p class="name">Nome: </p>
                                    <p class="id"><%=appBean.getNomeAppartamento()%>
                                    </p>
                                </div>
                                <div class="property_functions">
                                    <a href="">
                                        <i class="icon-share"></i>
                                    </a>
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
                            <div class="property_floor_plans">
                                <h4 class="property_heading_h4">Planimetria</h4>
                                <div class="floor_plans_accordions">
                                    <div class="floor_plan">
                                        <div class="floor_plan_title" onclick="show()">
                                            <div class="floor_title">
                                                <i class="icon-plus"></i>
                                                <h3>Piano principale</h3>
                                            </div>
                                        </div>
                                        <div id="floor" class="floor_plan_content" style="display: block;">
                                            <div>
                                                <%for (MultimediaBean bean : allMulti) {
                                                    if(bean.getIdAppartamento() == appBean.getIdAppartamento() && bean.getPlanimetriaString() != null){
                                                %>
                                                <a href="">
                                                    <img src=data:image/png;base64,<%=bean.getPlanimetriaString()%>">
                                                </a>
                                                <%}}%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="property_video">
                                <h4 class="property_heading_h4">Video</h4>
                                <video controls>
                                    <source type="video/mp4"
                                            src="data:video/mp4;base64,<%=multimediaBean.getVideoString().get(0)%>">
                                </video>
                            </div>
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
                    <div class="property_sidebar">
                        <aside class="sidebar">
                            <section class="property_agent">
                                <a href="" class="agent_image">
                                    <img src="data:image/png;base64,<%=utenteBean.getFotoString()%>">
                                </a>
                                <h3 class="property_agent_title">
                                    Agente <%=utenteBean.getNome() + " " + utenteBean.getCognome()%>
                                </h3>
                                <div class=property_agent_info>
                                    <p class="contact">
                                        <span>Cellulare:&nbsp;</span>
                                        <a href=""><%=agenteBean.getTelefonoCellulare()%>
                                        </a>
                                    </p>
                                    <p class="contact">
                                        <span>Whatsapp:&nbsp;</span>
                                        <a href="https://wa.me/39<%=agenteBean.getTelefonoCellulare()%>"></a>
                                    </p>
                                    <p class="contact">
                                        <span>Email:&nbsp;</span>
                                        <a href=""><%=utenteBean.getEmail()%>
                                        </a>
                                    </p>
                                </div>
                                <a class="agent_property_listing" href="">Visualizza i miei immobili</a>
                                <div class="agent_property_contact_form">
                                    <form class="contact_form">
                                        <input type="hidden" name="action" value="agente">
                                        <input type="hidden" name="agenteid" value="<%=agenteBean.getIdAgente()%>">
                                        <p class="contact_form_row">
                                            <label>Nome e cognome</label>
                                            <input type="text" placeholder="Inserisci il tuo nome e cognome"
                                                   name="nomeGuest">
                                        </p>
                                        <p class="contact_form_row">
                                            <label>Email</label>
                                            <input type="email" placeholder="Inserisci la tua email" name="emailGuest">
                                        </p>
                                        <p class="contact_form_row">
                                            <label>Telefono</label>
                                            <input type="text" placeholder="Inserisci il tuo numero di telefono"
                                                   name="telefonoGuest">
                                        </p>
                                        <p class="contact_form_row">
                                            <label>Messaggio</label>
                                            <textarea cols="40" rows="6"
                                                      placeholder="Ciao vorrei maggiori informazioni su questo immobile"
                                                      name="messaggioGuest"></textarea>
                                        </p>
                                        <div class="privacy_agreement">
                                            <span class="privacy_checkboxLabel">Consenso sulla privacy</span>
                                            <input type="checkbox">
                                            <label>I consent to having this website store my submitted information so
                                                they
                                                can respond to my inquiry.</label>
                                        </div>
                                        <div class="agent_call">
                                            <a href="https://wa.me/393662545295" class="agent_link">
                                                <i class="icon-whatsapp"></i>
                                                <span>Whatsapp</span>
                                            </a>
                                            <a href="" class="agent_link">
                                                <i class="icon-phone"></i>
                                                <span>Chiama ora</span>
                                            </a>
                                        </div>
                                        <div class="agent_message">
                                            <a href="" class="agent_link">
                                                <i class="icon-mail_outline"></i>
                                                <span>Invia messaggio</span>
                                            </a>
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
    <jsp:include page="footer.jsp"/>
</div>


<script type="text/javascript"
        src="https://maps.google.com/maps/api/js?key=AIzaSyDjdvGlwSrEXd5rBJNTvPCtmACuc29-HiU"></script>
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


</body>
</html>

