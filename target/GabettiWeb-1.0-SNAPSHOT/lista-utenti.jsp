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
<html lang="it" dir="ltr">
<head>

    <meta charset="UTF-8">
    <!--<title> Responsive Sidebar Menu  | CodingLab </title>-->
    <link rel="stylesheet" href="css/lista-utenti.css">
    <!-- Boxicons CDN Link -->
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">

    <link rel="stylesheet" href="icomoon/style.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <link rel="stylesheet" href="bootstrapcss/owl.carousel.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="shortcut icon" type="image/jpg" href="images/favicon-256x256.png"/>
    <title>Gabetti Nocera | Lista Utenti</title>
</head>
<%
    response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0);
//prevents caching at the proxy server
%>
<%
    ArrayList<UtenteBean> utenti=null;
    UtenteBean admin = (UtenteBean) session.getAttribute("utente");
    if (admin == null) {
        response.sendRedirect(response.encodeRedirectURL("login.jsp"));
        return;
    }
    if ((admin.getRuolo().equals("Admin") || admin.getRuolo().equals("Segretario")) && session.getAttribute("entrato")==null) {
        response.sendRedirect(response.encodeRedirectURL("ListaUtente"));
        return;
    }
    session.removeAttribute("entrato");
    utenti = (ArrayList<UtenteBean>) request.getAttribute("lista-utenti");

    String inviata = (String) request.getSession().getAttribute("inviata");
    request.getSession().setAttribute("inviata","no");
%>
<body>
<jsp:include page="sidebar.jsp" />
<input type="hidden" value="<%=inviata%>" id="inviata">
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
                                    <a>
                                        <%if (bean.getFotoString() == null) {%>
                                        <img src="images/agente.jpg">
                                        <%} else {%>
                                        <img src="data:image/png;base64,<%=bean.getFotoString()%>">
                                        <%}%>

                                    </a>
                                </figure>
                            </div>
                            <div class="column column-info">
                                <div class="user_info_wrap">
                                    <h3 class="user_title">
                                        <a><%=bean.getNome() + " " + bean.getCognome()%>
                                        </a>
                                    </h3>
                                </div>
                            </div>
                        </div>
                        <div class="small_column_wrap">
                            <div class="column column_username">
                                <span class="user_username"><%=bean.getUsername()%></span>
                            </div>
                            <div class="column column_email">
                                <span class="user_email"><%=bean.getEmail()%></span>
                            </div>
                            <div class="column column_role">
                                <span class="user_role"><%=bean.getRuolo()%></span>
                            </div>
                            <div class="column column_actions">
                                <div class="user_actions">
                                    <%if(bean.getRuolo().equals("Agente") || bean.getRuolo().equals("Collaboratore")){%>
                                    <a href="${pageContext.request.contextPath}/AgentePage?id=<%=bean.getIdUtente()%>">
                                        <i class="icon-eye"></i>
                                        Visualizza
                                    </a>
                                    <%}%>
                                    <a href="${pageContext.request.contextPath}/ControlloModificaUtente?idUtente=<%=bean.getIdUtente()%>">
                                        <i class="icon-mode_edit"></i>
                                        Modifica
                                    </a>
                                    <a href="${pageContext.request.contextPath}/EliminaUtente?idUtente=<%=bean.getIdUtente()%>">
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
<script>
    const inviata = document.getElementById("inviata");
    if(inviata.value.trim() == "mod"){
        swal("Successo!", "Utente modificato con successo!", "success");
    }
    else if(inviata.value.trim() == "add"){
        swal("Successo!", "Utente aggiunto con successo!", "success");
    }
    else if(inviata.value.trim() == "ok"){
        swal("Successo!", "Utente rimosso con successo!", "success");
    }

</script>
</body>
</html>
