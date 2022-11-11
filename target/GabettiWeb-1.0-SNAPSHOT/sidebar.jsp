<%--
  Created by IntelliJ IDEA.
  User: gaeta
  Date: 25/03/2022
  Time: 09:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="model.utente.UtenteBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.agente.AgenteBean" %>
<%@ page import="UtilityClass.CompositeKeyAgenteCase" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="css/sidebar.css">
</head>
<%
    CompositeKeyAgenteCase agenteCase = null;
    AgenteBean agente = null;
    UtenteBean admin = (UtenteBean) session.getAttribute("utente");
    if (admin == null) {
        response.sendRedirect(response.encodeRedirectURL("login.jsp"));
        return;
    }
    if (admin.getRuolo().equals("Admin")) {
        ArrayList<UtenteBean> utenti = (ArrayList<UtenteBean>) session.getAttribute("array");
    } else if (admin.getRuolo().equals("Agente")) {
        agente = (AgenteBean) session.getAttribute("agente");
        agenteCase = (CompositeKeyAgenteCase) session.getAttribute("appartamenti");
    }

%>
<body>
<div class="sidebar">
    <div class="logo-details">
        <div class="logo_name">Gabetti</div>
        <i class='bx bx-menu' id="btn"></i>
    </div>
    <ul class="nav-list">
        <li>
            <a href="index.jsp">
                <i class='bx bx-grid-alt'></i>
                <span class="links_name">Pagina Home</span>
            </a>
            <span class="tooltip">Pagina Home</span>
        </li>
        <li>
            <a href="myprofile.jsp">
                <i class='bx bx-user'></i>
                <span class="links_name">Il mio profilo</span>
            </a>
            <span class="tooltip">Il mio profilo</span>
        </li>
        <li>
            <a href="gestione-lista-immobili.jsp">
                <i class='bx bx-home'></i>
                <span class="links_name">Lista immobili</span>
            </a>
            <span class="tooltip">Lista immobili</span>
        </li>
        <li>
            <a href="RedirectAggiungiAppartamento">
                <i class='bx bx-home-smile'></i>
                <span class="links_name">Aggiungi immobile</span>
            </a>
            <span class="tooltip">Aggiungi immobile</span>
        </li>
        <%if(admin.getRuolo().equals("Admin") || admin.getRuolo().equals("Segretario")){%>
        <li>
            <a href="lista-utenti.jsp">
                <i class='bx bxs-user-detail'></i>
                <span class="links_name">Lista utenti</span>
            </a>
            <span class="tooltip">Lista utenti</span>
        </li>
        <%}%>
        <%if(admin.getRuolo().equals("Admin") || admin.getRuolo().equals("Segretario")){%>
        <li>
            <a href="RedirectAggiungiUtente">
                <i class='bx bx-user-plus'></i>
                <span class="links_name">Aggiungi utente</span>
            </a>
            <span class="tooltip">Aggiungi utente</span>
        </li>
        <%}%>
        <li class="profile">
            <div class="profile-details">
                <img src="images/agente.jpg" alt="profileImg">
                <div class="name_job">
                    <div class="name"><%=admin.getNome() + " " + admin.getCognome()%></div>
                    <div class="job"><%=admin.getRuolo()%></div>
                </div>
            </div>
            <a href="Logout">
                <i class='bx bx-log-out' id="log_out"></i>
            </a>
        </li>
    </ul>
</div>

<script>
    let sidebar = document.querySelector(".sidebar");
    let closeBtn = document.querySelector("#btn");
    let searchBtn = document.querySelector(".bx-search");

    closeBtn.addEventListener("click", ()=>{
        sidebar.classList.toggle("open");
        menuBtnChange();//calling the function(optional)
    });

    searchBtn.addEventListener("click", ()=>{ // Sidebar open when you click on the search iocn
        sidebar.classList.toggle("open");
        menuBtnChange(); //calling the function(optional)
    });

    // following are the code to change sidebar button(optional)
    function menuBtnChange() {
        if(sidebar.classList.contains("open")){
            closeBtn.classList.replace("bx-menu", "bx-menu-alt-right");//replacing the iocns class
        }else {
            closeBtn.classList.replace("bx-menu-alt-right","bx-menu");//replacing the iocns class
        }
    }
</script>
</body>
</html>
