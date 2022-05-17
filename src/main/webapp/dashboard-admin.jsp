<%@ page import="UtilityClass.CompositeKeyAgenteCase" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.agente.AgenteBean" %>
<%@ page import="model.utente.UtenteBean" %><%--
  Created by IntelliJ IDEA.
  User: gaeta
  Date: 12/05/2022
  Time: 17:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <!--<title> Responsive Sidebar Menu  | CodingLab </title>-->
    <link rel="stylesheet" href="css/dashboard.css">
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
    <link rel="shortcut icon" type="image/jpg" href="images/favicon-256x256.png"/>
    <title>Gabetti Nocera | Dashboard</title>
</head>
<%
    ArrayList<CompositeKeyAgenteCase> agenteCase = null;
    AgenteBean agente = null;
    UtenteBean admin = (UtenteBean) session.getAttribute("utente");
    if (admin == null) {
        response.sendRedirect(response.encodeRedirectURL("login.jsp"));
        return;
    }
%>
<body>
    <jsp:include page="sidebar.jsp"/>
    <section class="home-section">
        <div class="div_dashboard_page">
            <div class="dashboard_page_head">
                <div class="dashboard_head_title">
                    <h1 class="head_title">Dashboard Agente</h1>
                </div>
            </div>
        </div>
    </section>
</body>
</html>
