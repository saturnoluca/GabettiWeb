<%@ page import="model.appartamento.AppartamentoBean" %>
<%@ page import="model.agente.AgenteBean" %>
<%@ page import="model.utente.UtenteBean" %>
<%@ page import="model.indirizzo.IndirizzoBean" %>
<%@ page import="model.multimedia.MultimediaBean" %>
<%@ page import="java.util.ArrayList" %><%--
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
    ArrayList<MultimediaBean> allMulti = (ArrayList<MultimediaBean>) request.getAttribute("allMulti");
%>

<body>
<nav class="navbar navbar-expand-lg py-3">
    <div class="container">
        <a href="#" class="navbar-brand">
            <img src="images/gabetti.png" width="100" alt="" class="d-inline-block align-middle mr-2">
        </a>

        <button type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"
                class="navbar-toggler"><span class="navbar-toggler-icon"></span></button>

        <div id="navbarSupportedContent" class="collapse navbar-collapse">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active"><a href="#" class="nav-link">Home<span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item"><a href="#" class="nav-link">Proprietà</a></li>
                <li class="nav-item"><a href="#" class="nav-link">Agenti</a></li>
                <li class="nav-item"><a href="#" class="nav-link">Valutatore</a></li>
                <li class="nav-item"><a href="contact.html" class="nav-link">Contattaci</a></li>
            </ul>
        </div>
    </div>
</nav>
<section class="banner" style="background-image: url(images/banner.jpg); background-position: center 0%;">
    <div class="banner_cover"></div>
    <div class="banner_wrap">
        <h1 class="banner_title"><%=appBean.getNomeAppartamento()%>
        </h1>
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
									<div class="dropdown bootstrap-select picker trigger" style="width: 100%;">
										<button type="button" class="btn dropdown-toggle" data-toggle="dropdown"
                                                role="combobox">
											<div class="filter-option">
												<div class="filter-option-inner">
													<div class="filter-option-text">
														Tutte le località
													</div>
												</div>
											</div>
										</button>
									</div>
								</span>
                    </div>
                    <div class="search_select search_option">
                        <label>Stato Proprietà</label>
                        <span class="search_selectwrap">
									<div class="dropdown bootstrap-select picker trigger" style="width: 100%;">
										<button type="button" class="btn dropdown-toggle" data-toggle="dropdown"
                                                role="combobox">
											<div class="filter-option">
												<div class="filter-option-inner">
													<div class="filter-option-text">
														Tutte le località
													</div>
												</div>
											</div>
										</button>
									</div>
								</span>
                    </div>
                    <div class="search_select search_option">
                        <label>Tipo Proprietà</label>
                        <span class="search_selectwrap">
									<div class="dropdown bootstrap-select picker trigger" style="width: 100%;">
										<button type="button" class="btn dropdown-toggle" data-toggle="dropdown"
                                                role="combobox">
											<div class="filter-option">
												<div class="filter-option-inner">
													<div class="filter-option-text">
														Tutte le località
													</div>
												</div>
											</div>
										</button>
									</div>
								</span>
                    </div>
                </div>
                <div id="advanced_option_div" class="form_collapsed_field_wrapper" style="display: none;">
                    <div class="collapsed_field_container search_advanced_fields">
                        <div class="search_option search_select search_beds">
                            <label>Min camere da letto</label>
                            <div class="dropdown bootstrap-select picker trigger" style="width: 100%;">
                                <button type="button" class="btn dropdown-toggle" data-toggle="dropdown"
                                        role="combobox">
                                    <div class="filter-option">
                                        <div class="filter-option-inner">
                                            <div class="filter-option-text">
                                                Tutte le località
                                            </div>
                                        </div>
                                    </div>
                                </button>
                            </div>
                        </div>
                        <div class="search_option search_select search_beds">
                            <label>Min bagni</label>
                            <div class="dropdown bootstrap-select picker trigger" style="width: 100%;">
                                <button type="button" class="btn dropdown-toggle" data-toggle="dropdown"
                                        role="combobox">
                                    <div class="filter-option">
                                        <div class="filter-option-inner">
                                            <div class="filter-option-text">
                                                Tutte le località
                                            </div>
                                        </div>
                                    </div>
                                </button>
                            </div>
                        </div>
                        <div class="search_option search_select search_beds">
                            <label>Prezzo minimo</label>
                            <div class="dropdown bootstrap-select picker trigger" style="width: 100%;">
                                <button type="button" class="btn dropdown-toggle" data-toggle="dropdown"
                                        role="combobox">
                                    <div class="filter-option">
                                        <div class="filter-option-inner">
                                            <div class="filter-option-text">
                                                Tutte le località
                                            </div>
                                        </div>
                                    </div>
                                </button>
                            </div>
                        </div>
                        <div class="search_option search_select search_beds">
                            <label>Prezzo massimo</label>
                            <div class="dropdown bootstrap-select picker trigger" style="width: 100%;">
                                <button type="button" class="btn dropdown-toggle" data-toggle="dropdown"
                                        role="combobox">
                                    <div class="filter-option">
                                        <div class="filter-option-inner">
                                            <div class="filter-option-text">
                                                Tutte le località
                                            </div>
                                        </div>
                                    </div>
                                </button>
                            </div>
                        </div>
                        <div class="search_option search_select search_beds">
                            <label>Garage</label>
                            <div class="dropdown bootstrap-select picker trigger" style="width: 100%;">
                                <button type="button" class="btn dropdown-toggle" data-toggle="dropdown"
                                        role="combobox">
                                    <div class="filter-option">
                                        <div class="filter-option-inner">
                                            <div class="filter-option-text">
                                                Tutte le località
                                            </div>
                                        </div>
                                    </div>
                                </button>
                            </div>
                        </div>
                        <div class="search_option search_select search_beds">
                            <label>Agenti</label>
                            <div class="dropdown bootstrap-select picker trigger" style="width: 100%;">
                                <button type="button" class="btn dropdown-toggle" data-toggle="dropdown"
                                        role="combobox">
                                    <div class="filter-option">
                                        <div class="filter-option-inner">
                                            <div class="filter-option-text">
                                                Tutte le località
                                            </div>
                                        </div>
                                    </div>
                                </button>
                            </div>
                        </div>
                        <div class="search_option search_select search_beds">
                            <label>Superificie minima</label>
                            <div class="dropdown bootstrap-select picker trigger" style="width: 100%;">
                                <button type="button" class="btn dropdown-toggle" data-toggle="dropdown"
                                        role="combobox">
                                    <div class="filter-option">
                                        <div class="filter-option-inner">
                                            <div class="filter-option-text">
                                                Tutte le località
                                            </div>
                                        </div>
                                    </div>
                                </button>
                            </div>
                        </div>
                        <div class="search_option search_select search_beds">
                            <label>Superficie massima</label>
                            <div class="dropdown bootstrap-select picker trigger" style="width: 100%;">
                                <button type="button" class="btn dropdown-toggle" data-toggle="dropdown"
                                        role="combobox">
                                    <div class="filter-option">
                                        <div class="filter-option-inner">
                                            <div class="filter-option-text">
                                                Tutte le località
                                            </div>
                                        </div>
                                    </div>
                                </button>
                            </div>
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
            <div class="picture">
                <img src="data:image/png;base64,<%=multimediaBean.getFotoString().get(0)%>">
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
                                <a href="">
                                    <i class="icon-print"></i>
                                </a>
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
                                <span class="feature_title">Anno di costruzione</span>
                                <div class="feature_content">
                                    <i class="icon-calendar"></i>
                                    <span class="text">2013</span>
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
                                            <a href="">
                                                <img src="data:image/png;base64,<%=multimediaBean.getPlanimetriaString().get(0)%>">
                                            </a>
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
                            <input type="hidden" name="indirizzoAppartamento" value="<%=indirizzoBean.getCitta()+", "+indirizzoBean.getProvincia()+", "+ indirizzoBean.getNumeroCivico()%>">
                            <h4 class="property_heading_h4">Mappa</h4>
                            <iframe allowfullscreen frameborder="0" loading="lazy" src="https://www.google.com/maps/embed/v1/place?key=AIzaSyCghlu8qhmsmptec4eSidg5APpA57lCPlU&q=<%=indirizzoBean.getVia()+"+"+indirizzoBean.getProvincia()+"+"+indirizzoBean.getNumeroCivico()%>&zoom=17" width="100%" height="450"></iframe>
                        </div>
                    </div>

                </div>
                <div class="property_sidebar">
                    <aside class="sidebar">
                        <section class="property_agent">
                            <a href="" class="agent_image">
                                <img src="images/agente.jpg">
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
                                        <label>I consent to having this website store my submitted information so they
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
                            <%
                                int i = 0;
                                for (AppartamentoBean appartamentoBean : array) {
                                    if (appartamentoBean.getIdAgente() == agenteBean.getIdAgente()) {
                                        i++;%>
                            <article class="featured_card featured_card_block">
                                <div class="featured_card_wrap">
                                    <figure class="featured_card_figure">
                                        <div class="featured_card_picture">
                                            <a href="${pageContext.request.contextPath}/ServletDettagliAppartamento?id=<%=appartamentoBean.getIdAppartamento()%>">
                                                <%
                                                    int p = 0;
                                                    for (MultimediaBean multimediaBean1 : allMulti) {
                                                        if (multimediaBean1.getIdAppartamento() == appartamentoBean.getIdAppartamento()) {
                                                            i++;
                                                %><img width="680" height="510" src="data:image/png;base64,<%=multimediaBean1.getFotoString().get(0)%>"><%
                                                    }
                                                        if(p!=0) break;
                                                }
                                            %>
                                            </a>
                                        </div>
                                    </figure>
                                    <div class="featured_card_details">
                                        <h3>
                                            <a href=""><%=appartamentoBean.getNomeAppartamento()%></a>
                                        </h3>
                                        <p class="featured_card_description"><%if (appartamentoBean.getDescrizioneAppartamento().length() > 30) {
                                            %><%=appartamentoBean.getDescrizioneAppartamento().substring(0, 30) + ".."%><%
                                            } else {
                                            %><%=appartamentoBean.getDescrizioneAppartamento()%><%
                                                }%> </p>
                                        <div class="featured_card_features_wrap">
                                            <div class="featured_card_feature">
                                                <span class="features_title">Camere da letto</span>
                                                <div>
                                                    <i class="feature_icon icon-bed"></i>
                                                    <span class="text_feature"><%=appartamentoBean.getCamereLetto()%></span>
                                                </div>
                                            </div>
                                            <div class="featured_card_feature">
                                                <span class="features_title">Bagni</span>
                                                <div>
                                                    <i class="feature_icon icon-shower"></i>
                                                    <span class="text_feature"><%=appartamentoBean.getBagni()%></span>
                                                </div>
                                            </div>
                                            <div class="featured_card_feature">
                                                <span class="features_title">Superficie</span>
                                                <div>
                                                    <i class="feature_icon icon-crop_square"></i>
                                                    <span class="text_feature"><%=appartamentoBean.getSuperficie()%></span>
                                                    <span class="text_add">mq</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="featured_card_priceLabel">
                                            <div class="featured_card_price">
                                                <span class="status"><%=appartamentoBean.getTipoVendita()%></span>
                                                <p class="price">€<%=appartamentoBean.getPrezzo()%></p>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </article>
                            <%
                                    }
                                    if (i != 0) {
                                        break;
                                    }
                                }
                            %>
                        </section>
                    </aside>
                </div>
            </div>
        </div>
    </div>
</section>

<script type="text/javascript" src="https://maps.google.com/maps/api/js?key=AIzaSyDjdvGlwSrEXd5rBJNTvPCtmACuc29-HiU"></script>
<script src="script/index.js"></script>
<script src="script/dettagliappartamento.js"></script>
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
            }, function(results, status) {
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
                        google.maps.event.addListener(marker, 'click', function() {
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

