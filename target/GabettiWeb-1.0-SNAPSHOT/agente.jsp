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
    ArrayList<AppartamentoBean> arrayAppartamento = (ArrayList<AppartamentoBean>) request.getAttribute("arrayAppartamento");
    AgenteBean agenteBean = (AgenteBean) request.getAttribute("agente");
    UtenteBean utenteBean = (UtenteBean) request.getAttribute("utente");
    ArrayList<IndirizzoBean> arrayIndirizzo = (ArrayList<IndirizzoBean>) request.getAttribute("arrayIndirizzo");
    ArrayList<MultimediaBean> arrayMultimedia = (ArrayList<MultimediaBean>) request.getAttribute("arrayMultimedia");
    ArrayList<CompositeKeyAgenteCase> agenteCase = (ArrayList<CompositeKeyAgenteCase>) request.getAttribute("agenteCase");
    ArrayList<AppartamentoBean> inEvidenza=(ArrayList<AppartamentoBean>) request.getAttribute("inEvidenza");
%>

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Style -->
    <link rel="stylesheet" href="css/agente.css">

    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">

    <link rel="stylesheet" href="fonts/icomoon/style.css">

    <link rel="stylesheet" href="bootstrapcss/owl.carousel.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">


    <title>Gabetti Nocera | Agente</title>
</head>

<body>
<section class="banner banner-image" style="background-image: url(images/banner.jpg);">
    <div class="banner_cover"></div>
    <div class="banner_wrap">
        <h2 class="banner_title"><%=utenteBean.getNome() + " " + utenteBean.getCognome()%>
        </h2>
    </div>
</section>
<section class="section-agent section_flex wrap_padding">
    <div class="page page_agent page_main">
        <div class="agent_profile">
            <article class="agent_card">
                <div class="agent_card_wrap">
                    <div class="agent_card_head">
                        <figure class="agent_card_figure">
                            <a href="">
                                <img width="210" height="210" src="images/agente.jpg">
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
                                <p class="contact">Telefono: <a href=""><%=agenteBean.getTelefonoFisso()%>
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
                                    <textarea rows="6" placeholder="Il tuo messaggio" id="messaggioGuest"></textarea>
                                </div>
                                <input type="hidden" id="agenteid" value="<%=agenteBean.getIdAgente()%>">
                                <div class="form_privacy">
                          <span class="form_checkbox_label">
                            Consenso sulla privacy
                          </span>
                                    <input type="checkbox">
                                    <label>I consent to having this website store my submitted information so they can
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
                            <a href="">
                                <div class="post_property"
                                     style="background: url(images/prova.jpg) 50% 50% no-repeat; background-size: cover;">
                                </div>
                            </a>
                            <div class="overlay_property"></div>
                            <div class="overlay_contents overlay_fadeIn_bottom">
                                <a href="">Visualizza Proprietà</a>
                            </div>
                        </div>
                    </figure>
                    <div class="list_card_details_wrap">
                        <div class="list_card_details">
                            <h3><a href=""><%=arrayAppartamento.get(i).getNomeAppartamento()%>
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
                <%for(AppartamentoBean appBean : inEvidenza){
                    if(appBean.getIdAgente()==agenteBean.getIdAgente()){
                        %><article class="featured_card featured_card_block">
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
                            <a href=""><%=appBean.getNomeAppartamento()%></a>
                        </h3>
                        <p class="featured_card_description"><%
                            if (appBean.getDescrizioneAppartamento().length() > 30) {
                        %><%=appBean.getDescrizioneAppartamento().substring(0, 30) + ".."%><%
                        } else {
                        %><%=appBean.getDescrizioneAppartamento()%><%
                            }%></p>
                        <div class="featured_card_features_wrap">
                            <div class="featured_card_feature">
                                <span class="features_title">Camere da letto</span>
                                <div>
                                    <i class="feature_icon icon-bed"></i>
                                    <span class="text"><%=appBean.getCamereLetto()%></span>
                                </div>
                            </div>
                            <div class="featured_card_feature">
                                <span class="features_title">Bagni</span>
                                <div>
                                    <i class="feature_icon icon-shower"></i>
                                    <span class="text"><%=appBean.getBagni()%></span>
                                </div>
                            </div>
                            <div class="featured_card_feature">
                                <span class="features_title">Superficie</span>
                                <div>
                                    <i class="feature_icon icon-crop_square"></i>
                                    <span class="text"><%=appBean.getSuperficie()%></span>
                                    <span class=>mq</span>
                                </div>
                            </div>
                        </div>
                        <div class="featured_card_priceLabel">
                            <div class="featured_card_price">
                                <span class="status"><%=appBean.getTipoVendita()%></span>
                                <p class="price">€<%=appBean.getPrezzo()%>></p>
                            </div>
                        </div>
                    </div>

                </div>
            </article><%
                    }
                }%>
            </section>
        </aside>
    </div>
</section>
</body>

</html>
