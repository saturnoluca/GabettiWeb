<%@ page import="model.agente.AgenteBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.utente.UtenteBean" %>
<%@ page import="UtilityClass.CompositeKeyAgenteCase" %><%--
  Created by IntelliJ IDEA.
  User: Luca
  Date: 23/02/2022
  Time: 14:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%
    ArrayList<CompositeKeyAgenteCase> agentiCase = (ArrayList<CompositeKeyAgenteCase>) request.getAttribute("agentiCase");
    if (agentiCase == null) {
        response.sendRedirect(response.encodeRedirectURL("ServletAgentiPage"));
        return;
    }

    ArrayList<UtenteBean> utente = (ArrayList<UtenteBean>) request.getAttribute("utente");
    if (utente == null) {
        response.sendRedirect(response.encodeRedirectURL("ServletAgentiPage"));
        return;
    }

%>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Gabetti</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Catamaran:100,200,300,400,500,600,700,800,900">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Muli">
    <link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/fonts/ionicons.min.css">
    <link rel="stylesheet" href="assets/fonts/line-awesome.min.css">
    <link rel="stylesheet" href="assets/fonts/material-icons.min.css">
    <link rel="stylesheet" href="assets/fonts/fontawesome5-overrides.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/6.4.8/swiper-bundle.min.css">
    <link rel="stylesheet" href="assets/css/Map-Clean.css">
    <link rel="stylesheet" href="assets/css/MUSA_carousel-extended-1.css">
    <link rel="stylesheet" href="assets/css/MUSA_carousel-extended.css">
    <link rel="stylesheet" href="assets/css/Simple-Slider.css">
    <link rel="stylesheet" href="assets/css/Slider-Range.css">
    <link rel="stylesheet" href="assets/css/style.css">
</head>

<body style="width: 1900px;background: #f7f7f7;">
<header style="height: 300px;background: url(assets/img/sfondo.png) center / cover no-repeat;margin-bottom: 0px;padding-bottom: 0px;">
    <nav class="navbar navbar-light navbar-expand-lg fixed-top" id="mainNav"
         style="padding-bottom: 0px;width: 1920px;margin-bottom: 0px;">
        <div class="container"><a class="navbar-brand" href="#page-top"
                                  style="width: 130px;height: 130px;background: url(assets/img/gabettinocera.png) no-repeat;background-size: contain;padding-top: 0px;padding-bottom: 0px;margin-right: 0px;"></a>
            <button data-bs-toggle="collapse" data-bs-target="#navbarResponsive" class="navbar-toggler float-end"
                    aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><i
                    class="fa fa-bars"></i></button>
            <div class="collapse navbar-collapse" id="navbarResponsive" style="height: 100px;">
                <ul class="navbar-nav d-xl-flex ms-auto align-items-xl-center" style="height: 100px;">
                    <li class="nav-item d-xl-flex"><a class="nav-link d-xl-flex align-items-xl-center" href="#features"
                                                      style="height: 50px;padding: 0px;padding-right: 8px;padding-left: 8px;/*color: rgb(255,255,255);*/font-size: 15px;">Features</a>
                    </li>
                    <li class="nav-item"><a class="nav-link d-xl-flex align-items-xl-center" href="#contact"
                                            style="height: 50px;padding: 0px;padding-right: 8px;padding-left: 8px;/*color: rgb(255,255,255);*/font-size: 15px;">Contact</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</header>
<section class="d-xxl-flex justify-content-xxl-center"
         style="width: 1900px;height: 1200px;margin-top: 0px;padding-right: 0px;padding-left: 0px;padding-bottom: 0px;background: transparent;">
    <div class="container" style="width: 1900px;height: 1200px;">
        <div class="row" style="width: 1440px;height: 1200px;">
            <div class="col-md-12" style="padding: 0px;margin-bottom: 0px;height: 1200px;">
                <div style="height: 1200px;margin-bottom: 0px;">
                    <div style="width: 1440px;height: 50px;margin-bottom: 100px;">
                        <h1 class="text-center" style="color: rgb(178,1,53);">I nostri agenti</h1>
                    </div>
                    <%for (int i = 0; i < agentiCase.size(); i++) {%>
                    <div style="height: 400px;color: #ffffff;margin-bottom: 100px;border-radius: 0px;box-shadow: 0px 0px 20px #dddddd;">
                        <div class="flex-wrap" style="height: 400px;background: #ffffff;padding: 25px;">
                            <div class="d-flex float-start" style="height: 150px;width: 150px;"><img class="order-1"
                                                                                                     style="width: 150px;height: 150px;padding-bottom: 0px;margin: 0px 0px;margin-top: -75px;"
                                                                                                     src="assets/img/image.jpg">
                            </div>
                            <div class="d-block float-start d-xxl-flex"
                                 style="width: 800px;height: 150px;padding: 25px;">
                                <h1 class="d-xxl-flex"
                                    style="color: #b20135;font-size: 35px;height: 40px;width: 800px;"><%
                                    for (UtenteBean u : utente) {
                                        if (u.getIdUtente() == agentiCase.get(i).getBean().getIdUtente()) {
                                %><%=u.getNome() + " " + u.getCognome()%><%
                                        }
                                    }%></h1>
                                <div class="d-block d-xxl-flex align-items-xxl-center"
                                     style="width: 800px;height: 40px;font-size: 20px;"><i class="fa fa-facebook"
                                                                                           style="color: rgb(128,128,128);margin-right: 15px;"></i><i
                                        class="fa fa-twitter" style="color: rgb(128,128,128);margin-right: 15px;"></i><i
                                        class="fa fa-linkedin-square"
                                        style="color: rgb(128,128,128);margin-right: 15px;"></i><i
                                        class="fa fa-instagram" style="color: rgb(128,128,128);margin-right: 15px;"></i><i
                                        class="fa fa-chrome" style="color: rgb(128,128,128);margin-right: 15px;"></i><i
                                        class="fa fa-youtube-play"
                                        style="color: rgb(128,128,128);margin-right: 15px;"></i><i
                                        class="fa fa-pinterest" style="color: rgb(128,128,128);margin-right: 15px;"></i>
                                </div>
                            </div>
                            <div class="float-end" style="width: 400px;height: 150px;">
                                <h1 style="color: rgb(128,128,128);font-size: 15px;font-weight: bold;">Proprietà
                                    possedute</h1>
                                <h1 style="color: rgb(178,1,53);"><%=agentiCase.get(i).getContaCase()%>
                                </h1>
                            </div>
                            <div class="d-inline-flex" style="width: 1390px;height: 100px;">
                                <p style="height: 100px;width: 1390px;color: rgb(128,128,128);"><%=agentiCase.get(i).getBean().getDescrizionePersonale()%>
                                    <br><br></p>
                            </div>
                            <div style="width: 1390px;position: absolute;height: 100px;">
                                <div class="d-inline-flex float-start" style="width: 1090px;height: 100px;">
                                    <div style="width: 300px;height: 25px;margin-right: 15px;">
                                        <h1 class="d-xxl-flex align-items-xxl-center"
                                            style="color: rgb(128,128,128);font-size: 20px;height: 25px;margin-bottom: 0px;margin-right: 0px;width: 300px;">
                                            <br>Ufficio: <%
                                            if (agentiCase.get(i).getBean().getTelefonoFisso() == null) {
                                        %><%="Numero non disponibile"%><%
                                        } else {
                                        %><%=agentiCase.get(i).getBean().getTelefonoFisso()%><%
                                            }%><br><br></h1>
                                    </div>
                                    <div style="width: 300px;height: 25px;margin-right: 15px;">
                                        <h1 class="d-xxl-flex align-items-xxl-center"
                                            style="color: rgb(128,128,128);font-size: 20px;height: 25px;margin-bottom: 0px;margin-right: 0px;width: 300px;">
                                            <br>Cellulare: <%
                                            if (agentiCase.get(i).getBean().getTelefonoCellulare() == null) {
                                        %><%="Numero non disponibile"%><%
                                        } else {
                                        %><%=agentiCase.get(i).getBean().getTelefonoCellulare()%><%
                                            }%><br><br></h1>
                                    </div>
                                    <div style="width: 300px;height: 25px;margin-right: 15px;">
                                        <h1 class="d-xxl-flex align-items-xxl-center"
                                            style="color: rgb(128,128,128);font-size: 20px;height: 25px;margin-bottom: 0px;margin-right: 0px;width: 300px;">
                                            Email: <%
                                            for (UtenteBean u : utente) {
                                                if (u.getIdUtente() == agentiCase.get(i).getBean().getIdUtente()) {
                                        %><%=u.getEmail()%><%
                                                }
                                            }%></h1>
                                    </div>
                                </div>
                                <div class="d-inline-flex float-end justify-content-xxl-center align-items-xxl-center"
                                     style="width: 300px;height: 100px;"><span>Text<a href="#"
                                                                                      style="padding-right: 15px;color: #b20135;">Visualizza la mia lista</a></span><i
                                        class="fa fa-arrow-right" style="color: rgb(178,1,53);font-size: 20px;"></i>
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
<footer data-aos="fade-up" data-aos-once="true"
        style="height: 600px;border-top-left-radius: 0px;border-width: 0px;overflow: hidden;position: relative;padding-top: 0px;padding-bottom: 0px;">
    <div class="diagonalfooteragente"></div>
</footer>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<script src="assets/js/bs-init.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/6.4.8/swiper-bundle.min.js"></script>
<script src="assets/js/move.js"></script>
<script src="assets/js/MUSA_carousel-extended.js"></script>
<script src="assets/js/new-age.js"></script>
<script src="assets/js/Simple-Slider.js"></script>
</body>

</html>
