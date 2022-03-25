<%@ page import="model.utente.UtenteBean" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Luca
  Date: 16/03/2022
  Time: 09:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!-- Created by CodingLab |www.youtube.com/CodingLabYT-->
<html lang="en" dir="ltr">
<head>
    <meta charset="UTF-8">
    <!--<title> Responsive Sidebar Menu  | CodingLab </title>-->
    <link rel="stylesheet" href="css/amministratoreagente.css">
    <!-- Boxicons CDN Link -->
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" >

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">

    <link rel="stylesheet" href="icomoon/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <link rel="stylesheet" href="bootstrapcss/owl.carousel.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
</head>
<%
    UtenteBean utente = (UtenteBean) session.getAttribute("utente");
    if (utente == null) {
        response.sendRedirect(response.encodeRedirectURL("login.jsp"));
        return;
    }
    if (!utente.getRuolo().equals("Admin") && !utente.getRuolo().equals("Segretario")) {
        response.sendRedirect(response.encodeRedirectURL("login.jsp"));
        return;
    }
    ArrayList<UtenteBean> array = (ArrayList<UtenteBean>) session.getAttribute("array");
%>
<body>
<div class="sidebar">
    <div class="logo-details">
        <div class="logo_name">Gabetti</div>
        <i class='bx bx-menu' id="btn" ></i>
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
                <i class='bx bx-home' ></i>
                <span class="links_name">Lista immobili</span>
            </a>
            <span class="tooltip">Lista immobili</span>
        </li>
        <li>
            <a href="aggiungi-immobile-admin.html">
                <i class='bx bx-home-smile' ></i>
                <span class="links_name">Aggiungi immobile</span>
            </a>
            <span class="tooltip">Aggiungi immobile</span>
        </li>
        <li>
            <a href="#">
                <i class='bx bxs-user-detail' ></i>
                <span class="links_name">Lista utenti</span>
            </a>
            <span class="tooltip">Lista utenti</span>
        </li>
        <li>
            <a href="aggiungi-utente.html">
                <i class='bx bx-user-plus' ></i>
                <span class="links_name">Aggiungi utente</span>
            </a>
            <span class="tooltip">Aggiungi utente</span>
        </li>
        <li class="profile">
            <div class="profile-details">
                <img src="images/agente.jpg" alt="profileImg">
                <div class="name_job">
                    <div class="name">Gaetano De Filippo</div>
                    <div class="job">Amministratore</div>
                </div>
            </div>
            <i class='bx bx-log-out' id="log_out" ></i>
        </li>
    </ul>
</div>
<section class="home-section">
    <div class="div_addUser_page">
        <div class="addUser_page_head">
            <div class="addUser_head_title">
                <h1 class="head_title">Aggiungi Utente</h1>
            </div>
        </div>
        <div class="addUser_page_content">
            <form method="post" action="ServletAggiungiUtente" class="form_addUser" enctype="multipart/form-data">
                <div class="addUser_tab">
                    <h3 class="tab_title">Informazioni generali</h3>
                </div>
                <div class="addUser_content">
                    <div class="form_content_fields">
                        <div class="content_fields_row">
                            <div class="user_general">
                                <div class="content_fields_column half_size">
                                    <label class="label_user_title">Nome*</label>
                                    <input type="text" required placeholder="Inserisci il nome" name="nome">
                                </div>
                                <div class="content_fields_column half_size">
                                    <label class="label_user_title">Cognome*</label>
                                    <input type="text" required placeholder="Inserisci il cognome" name="cognome">
                                </div>
                                <div class="content_fields_column half_size">
                                    <label class="label_user_title">Email*</label>
                                    <input type="text" required placeholder="Inserisci l'email" name="email">
                                </div>
                                <div class="content_fields_column half_size">
                                    <label class="label_user_title">Username</label>
                                    <input type="text" placeholder="Inserisci un username" name="username">
                                </div>
                                <div class="content_fields_column half_size">
                                    <label class="label_user_title">Password</label>
                                    <input type="password" required placeholder="Inserisci la password" name="password">
                                </div>
                                <div class="content_fields_column half_size">
                                    <label class="label_user_title">Ruolo</label>
                                    <select required id="Selector" name="ruolo">
                                        <option value="" selected disabled>Seleziona ruolo utente</option>
                                        <option value="Admin">Admin</option>
                                        <option value="Segretario">Segretario</option>
                                        <option value="Agente">Agente</option>
                                        <option value="Collaboratore">Collaboratore</option>
                                    </select>
                                </div>
                                <div class="content_fields_column half_size" id="div_agente" style="display: none;">
                                    <label class="label_user_title">Collaborazione agente</label>
                                    <select name="agente">
                                        <option value="" selected disabled>Seleziona collaborazione agente</option>
                                        <%
                                            for (UtenteBean bean : array) {
                                                if (bean.getRuolo().equals("Agente")) {
                                        %>
                                        <option value="<%=bean.getIdUtente()%>"><%=bean.getNome()+" "+bean.getCognome()%></option>
                                        <%
                                                }
                                               }
                                        %>
                                    </select>
                                </div>
                            </div>
                            <div class="user_otherInfo" id="info_agente" style="display: none;">
                                <h3 class="tab_title" style="margin-bottom:50px;">Informazioni Agente</h3>
                                <div class="content_fields_column full_size">
                                    <label class="label_property_title">Descrizione*</label>
                                    <textarea rows="10" placeholder="Scrivi una descrizione"
                                              name="descrizione"></textarea>
                                </div>
                                <div class="content_fields_column half_size">
                                    <label class="label_user_title">Link Facebook</label>
                                    <input type="text" placeholder="Inserisci link profilo facebook" name="facebook">
                                </div>
                                <div class="content_fields_column half_size">
                                    <label class="label_user_title">Link Instagram</label>
                                    <input type="text" placeholder="Inserisci link profilo instagram" name="instagram">
                                </div>
                            </div>

                            <div class="property_multimedia">
                                <h3 class="tab_title">Multimedia</h3>
                                <div class="container_gallery">
                                    <div class="wrapper">
                                        <div class="image">
                                            <img id="preview" src="" alt="">
                                        </div>
                                        <div class="content">
                                            <div class="icon">
                                                <i class="fas fa-cloud-upload-alt"></i>
                                            </div>
                                            <div class="text">
                                                Nessuna immagine selezionata
                                            </div>
                                        </div>
                                        <div id="cancel-btn">
                                            <i class="fas fa-times"></i>
                                        </div>
                                    </div>
                                    <button type="button" onclick="defaultBtnActive()" id="custom-btn">Seleziona un'immagine</button>
                                    <input id="default-btn" type="file" hidden>
                                </div>
                            </div>
                        </div>
                        <div class="div_button_submit">
                            <input type="submit" value="Aggiungi Utente">
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</section>

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

<script>
    const wrapper = document.querySelector(".wrapper");
    const fileName = document.querySelector(".file-name");
    const defaultBtn = document.querySelector("#default-btn");
    const customBtn = document.querySelector("#custom-btn");
    const cancelBtn = document.querySelector("#cancel-btn i");
    const img = document.querySelector("#preview");
    let divText = document.querySelector(".text");
    let regExp = /[0-9a-zA-Z\^\&\'\@\{\}\[\]\,\$\=\!\-\#\(\)\.\%\+\~\_ ]+$/;
    function defaultBtnActive() {
        defaultBtn.click();
    }
    defaultBtn.addEventListener("change", function(){
        const file = this.files[0];
        if(file) {
            console.log("SIUM");
            const reader = new FileReader();
            reader.onload = function () {
                const result = reader.result;
                img.src = result;
                wrapper.classList.add("active");
                divText.style.display = "none";
            }
            cancelBtn.addEventListener("click", function () {
                img.src = "";
                wrapper.classList.remove("active");
                divText.style.display = "block";
            })
            reader.readAsDataURL(file);
        }
    });
</script>

<script>
    document.getElementById("Selector").onchange = changeListener;

    function changeListener(){
        var value = this.value
        console.log(value);

        if ((value == "Agente") || (value == "Collaboratore")){
            $('#info_agente').slideDown();
        }else {
            $('#info_agente').slideUp();
        }

        if (value == "Collaboratore"){
            $('#div_agente').slideDown();
        }else {
            $('#div_agente').slideUp();
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
