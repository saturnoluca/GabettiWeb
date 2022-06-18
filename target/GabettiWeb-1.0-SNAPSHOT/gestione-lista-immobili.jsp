<%@ page import="model.utente.UtenteBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.appartamento.AppartamentoBean" %>
<%@ page import="model.agente.AgenteBean" %>
<%@ page import="model.multimedia.MultimediaBean" %>
<%@ page import="UtilityClass.VisualizzazioneImmobile" %><%--
  Created by IntelliJ IDEA.
  User: Luca
  Date: 29/03/2022
  Time: 14:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!-- Created by CodingLab |www.youtube.com/CodingLabYT-->
<html lang="it" dir="ltr">
<head>
    <meta charset="UTF-8">
    <!--<title> Responsive Sidebar Menu  | CodingLab </title>-->
    <link rel="stylesheet" href="css/amministratore-lista-immobili.css">
    <!-- Boxicons CDN Link -->
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">

    <link rel="stylesheet" href="icomoon/style.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <link rel="stylesheet" href="bootstrapcss/owl.carousel.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <title>Gabetti Nocera | Lista Immobili</title>
</head>

<%
    ArrayList<VisualizzazioneImmobile> visualizzazioneImmobili = null;

    UtenteBean admin = (UtenteBean) session.getAttribute("utente");
    if (admin == null) {
        response.sendRedirect(response.encodeRedirectURL("login.jsp"));
        return;
    }
    if (session.getAttribute("entrato-immobili") == null) {
        response.sendRedirect(response.encodeRedirectURL("ServletAppartamentiAdmin"));
        return;
    }
    session.removeAttribute("entrato-immobili");
    visualizzazioneImmobili= (ArrayList<VisualizzazioneImmobile>) session.getAttribute("visualizzazione-immobile");
%>
<body>

<jsp:include page="sidebar.jsp"/>

<section class="home-section">
    <div class="div_property_list">
        <div class="property_list_page_head">
            <h1 class="property_list_page_title">Lista proprietà</h1>
        </div>
        <div class="dashboard_properties">
            <div class="dashboard_properties_list">
                <div class="dashboard_properties_list_head">
                    <div class="large_column_wrap">
                        <div class="column column_picture">
                            <span>Foto</span>
                        </div>
                        <div class="column column_info">
                            <span>Informazioni immobile</span>
                        </div>
                    </div>
                    <div class="small_column_wrap">
                        <div class="column column_data">
                            <span>Aggiunto il</span>
                        </div>
                        <div class="column column_status">
                            <span>Stato immobile</span>
                        </div>
                        <div class="column column_price">
                            <span>Prezzo Immobile</span>
                        </div>
                        <div class="column column_actions">
                            <span>Azioni</span>
                        </div>
                    </div>
                </div>
                <div class="dashboard_properties_list_body">
                    <%for (VisualizzazioneImmobile immobili : visualizzazioneImmobili) {%>
                    <div class="property_column_wrap">
                        <div class="large_column_wrap">
                            <div class="column column_picture">
                                <figure>
                                    <a href="${pageContext.request.contextPath}/ServletDettagliAppartamento?id=<%=immobili.getIdAppartamento()%>">
                                        <img src="data:image/png;base64,<%=immobili.getFoto()%>">
                                    </a>
                                </figure>
                            </div>
                            <div class="column column-info">
                                <div class="property_info_wrap">
                                    <h3 class="property_title">
                                        <a href="${pageContext.request.contextPath}/ServletDettagliAppartamento?id=<%=immobili.getIdAppartamento()%>"></a>
                                    </h3>
                                    <p class="property-description"><%=immobili.getNomeAppartamento()%></p>
                                    <ul class="property_meta">
                                        <li>
                                            <span class="property_meta_label">Camere</span>
                                            <div class="property_meta_icon">
                                                <icon class="icon icon-bed"></icon>
                                                <span class="figure"><%=immobili.getCamereLetto()%></span>
                                            </div>
                                        </li>
                                        <li>
                                            <span class="property_meta_label">Bagni</span>
                                            <div class="property_meta_icon">
                                                <icon class="icon icon-shower"></icon>
                                                <span class="figure"><%=immobili.getBagni()%></span>
                                            </div>
                                        </li>
                                        <li>
                                            <span class="property_meta_label">Superficie</span>
                                            <div class="property_meta_icon">
                                                <icon class="icon icon-square-o"></icon>
                                                <span class="figure"><%=immobili.getSuperficie()%></span>
                                                <span class="figure">mq</span>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="small_column_wrap">
                            <div class="column column_data">
                                <span class="property_date"><%=immobili.getData()%></span>
                            </div>
                            <div class="column column_status">
                                <span class="property_status"><%=immobili.getCategoria()%></span>
                            </div>
                            <div class="column column_price">
                                <span class="property_price">€<%=immobili.getPrezzo()%></span>
                            </div>
                            <div class="column column_price">
                                <div class="property_actions">
                                    <a href="ServletDettagliAppartamento?id=<%=immobili.getIdAppartamento()%>">
                                        <i class="icon-eye"></i>
                                        Visualizza
                                    </a>
                                    <a href="ServletPaginaModificaAppartamento?idImmobile=<%=immobili.getIdAppartamento()%>">
                                        <i class="icon-mode_edit"></i>
                                        Modifica
                                    </a>
                                    <a href="ServletEliminaImmobile?idImmobile=<%=immobili.getIdAppartamento()%>">
                                        <i class="icon-delete"></i>
                                        Elimina
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%}%>
                </div>
            </div>
        </div>
    </div>
</section>

<script>
    let sidebar = document.querySelector(".sidebar");
    let closeBtn = document.querySelector("#btn");
    let searchBtn = document.querySelector(".bx-search");

    closeBtn.addEventListener("click", () => {
        sidebar.classList.toggle("open");
        menuBtnChange();//calling the function(optional)
    });

    searchBtn.addEventListener("click", () => { // Sidebar open when you click on the search iocn
        sidebar.classList.toggle("open");
        menuBtnChange(); //calling the function(optional)
    });

    // following are the code to change sidebar button(optional)
    function menuBtnChange() {
        if (sidebar.classList.contains("open")) {
            closeBtn.classList.replace("bx-menu", "bx-menu-alt-right");//replacing the iocns class
        } else {
            closeBtn.classList.replace("bx-menu-alt-right", "bx-menu");//replacing the iocns class
        }
    }
</script>
<script src="script/index.js"></script>
<script src="bootstrap/js/jquery-3.3.1.min.js"></script>
<script src="bootstrap/js/popper.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="bootstrap/js/jquery.sticky.js"></script>

</body>
</html>
