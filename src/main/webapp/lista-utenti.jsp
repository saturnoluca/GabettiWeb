<%@ page import="model.utente.UtenteBean" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Luca
  Date: 14/03/2022
  Time: 15:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!-- Created by CodingLab |www.youtube.com/CodingLabYT-->
<html lang="en" dir="ltr">
<head>
    <meta charset="UTF-8">
    <!--<title> Responsive Sidebar Menu  | CodingLab </title>-->
    <link rel="stylesheet" href="css/lista-utenti.css">
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
</head>
<%
    UtenteBean admin = (UtenteBean) session.getAttribute("utente");
    if (admin == null) {
        response.sendRedirect(response.encodeRedirectURL("login.jsp"));
        return;
    }
    ArrayList<UtenteBean> utenti = null;
    if (admin.getRuolo().equals("Admin")) {
        utenti = (ArrayList<UtenteBean>) session.getAttribute("array");
    } else {
        request.getSession(false);
        response.sendRedirect(response.encodeRedirectURL("login.jsp"));
        return;
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
            <a href="#">
                <i class='bx bx-grid-alt'></i>
                <span class="links_name">Dashboard</span>
            </a>
            <span class="tooltip">Dashboard</span>
        </li>
        <li>
            <a href="#">
                <i class='bx bx-user'></i>
                <span class="links_name">Il mio profilo</span>
            </a>
            <span class="tooltip">Il mio profilo</span>
        </li>
        <li>
            <a href="#">
                <i class='bx bx-home'></i>
                <span class="links_name">Lista immobili</span>
            </a>
            <span class="tooltip">Lista immobili</span>
        </li>
        <li>
            <a href="aggiungi-immobile-admin.html">
                <i class='bx bx-home-smile'></i>
                <span class="links_name">Aggiungi immobile</span>
            </a>
            <span class="tooltip">Aggiungi immobile</span>
        </li>
        <li>
            <a href="#">
                <i class='bx bxs-user-detail'></i>
                <span class="links_name">Lista utenti</span>
            </a>
            <span class="tooltip">Lista utenti</span>
        </li>
        <li>
            <a href="aggiungi-utente.html">
                <i class='bx bx-user-plus'></i>
                <span class="links_name">Aggiungi utente</span>
            </a>
            <span class="tooltip">Aggiungi utente</span>
        </li>
        <li class="profile">
            <div class="profile-details">
                <img src="images/agente.jpg" alt="profileImg">
                <div class="name_job">
                    <div class="name"><%=admin.getNome()+" "+admin.getCognome()%></div>
                    <div class="job">Amministratore</div>
                </div>
            </div>
            <i class='bx bx-log-out' id="log_out"></i>
        </li>
    </ul>
</div>
<section class="home-section">
    <div class="div_user_list">
        <div class="user_list_page_head">
            <h1 class="user_list_page_title">Lista Utenti</h1>
        </div>
        <div class="dashboard_users">
            <div class="dashboard_users_list">
                <div class="dashboard_users_list_head">
                    <div class="large_column_wrap">
                        <div class="column column_picture">
                            <span>Foto</span>
                        </div>
                        <div class="column column_info">
                            <span>Nome e cognome</span>
                        </div>
                    </div>
                    <div class="small_column_wrap">
                        <div class="column column_username">
                            <span>Username</span>
                        </div>
                        <div class="column column_email">
                            <span>Email</span>
                        </div>
                        <div class="column column_role">
                            <span>Ruolo</span>
                        </div>
                        <div class="column column_actions">
                            <span>Azioni</span>
                        </div>
                    </div>
                </div>

                <div class="dashboard_users_list_body">
                    <%
                        for (UtenteBean bean : utenti) {
                            if (!bean.getRuolo().equals("Admin")) {
                    %>
                    <div class="user_column_wrap">
                        <div class="large_column_wrap">
                            <div class="column column_picture">
                                <figure>
                                    <a href="">
                                        <%if(bean.getFotoString() == null){%>
                                        <img src="images/agente.jpg">
                                        <%}else{%>
                                        <img src="data:image/png;base64,<%=bean.getFotoString()%>">
                                        <%}%>

                                    </a>
                                </figure>
                            </div>
                            <div class="column column-info">
                                <div class="user_info_wrap">
                                    <h3 class="user_title">
                                        <a href=""><%=bean.getNome()+" "+bean.getCognome()%></a>
                                    </h3>
                                    <p class="user_description">bravo agente</p>
                                </div>
                            </div>
                        </div>
                        <div class="small_column_wrap">
                            <div class="column column_username">
                                <span class="user_username"><%=bean.getUsername()%></span>
                            </div>
                            <div class="column column_email">
                                <span class="user_email"><%=bean.getUsername()%></span>
                            </div>
                            <div class="column column_role">
                                <span class="user_role"><%=bean.getRuolo()%></span>
                            </div>
                            <div class="column column_actions">
                                <div class="user_actions">
                                    <a href="">
                                        <i class="icon-eye"></i>
                                        Visualizza
                                    </a>
                                    <a href="${pageContext.request.contextPath}/ServletControlloModificaUtente?idUtente=<%=bean.getIdUtente()%>">
                                        <i class="icon-mode_edit"></i>
                                        Modifica
                                    </a>
                                    <a href="">
                                        <i class="icon-delete"></i>
                                        Elimina
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%
                            }
                        }%>
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
