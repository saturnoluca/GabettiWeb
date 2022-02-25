<%--
  Created by IntelliJ IDEA.
  User: Luca
  Date: 22/02/2022
  Time: 10:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         import="model.appartamento.AppartamentoBean, java.util.ArrayList" %>
<%@ page import="model.agente.AgenteBean" %>
<%@ page import="model.utente.UtenteBean" %>
<html>
<%
    ArrayList<AppartamentoBean> appartamenti = (ArrayList<AppartamentoBean>) request.getAttribute("appartamenti");
    if (appartamenti == null) {
        response.sendRedirect(response.encodeRedirectURL("IndexServlet"));
        return;
    }

    ArrayList<AgenteBean> agenti = (ArrayList<AgenteBean>) request.getAttribute("agenti");
    if (agenti == null) {
        response.sendRedirect(response.encodeRedirectURL("IndexServlet"));
        return;
    }

    ArrayList<UtenteBean> utente = (ArrayList<UtenteBean>) request.getAttribute("utente");
    if (utente == null) {
        response.sendRedirect(response.encodeRedirectURL("IndexServlet"));
        return;
    }
%>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Gabetti - Home</title>
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

<body id="page-top" data-bs-spy="scroll" data-bs-target="#mainNav" data-bs-offset="56"
      style="width: 1904px;background: #f7f7f7;">
<div style="display: block;top: 150px;z-index: 9999999;width: 115px;position: fixed;height: 50px;right: 0;background: #000;margin-right: 2px;">
    <div class="d-inline-flex align-items-xl-center"
         style="height: 50px;padding-top: 10px;padding-bottom: 10px;padding-right: 14px;padding-left: 14px;"><span
            style="width: 24px;height: 24px;"><i class="material-icons"
                                                 style="width: 24px;height: 24px;font-size: 24px;color: rgb(255,255,255);font-weight: bold;">compare_arrows</i></span><span
            style="margin-right: 10px;margin-left: 10px;width: auto;height: auto;color: rgb(255,255,255);font-weight: bold;font-size: 20px;">(3/4)</span>
    </div>
</div>
<nav class="navbar navbar-light navbar-expand-lg fixed-top" id="mainNav" style="padding-bottom: 0px;width: 1904px;">
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
<header class="masthead" style="background: url(assets/img/sfondo.png) top / auto no-repeat;">
    <div class="container h-100">
        <div class="row h-100">
            <div class="col-lg-7 my-auto">
                <div class="mx-auto header-content"
                     style="height: 510px;padding: 30px;color: rgb(0,0,0);background: #ffffff;border-radius: 7px;">
                    <h1 class="mb-5" style="margin: 0px;margin-bottom: 20px;">Ti chiamiamo noi!</h1>
                    <form class="mx-auto" style="width: 400px;height: 350px;">
                        <div class="row d-xl-flex justify-content-xl-center"
                             style="width: 400px;height: 40px;margin-bottom: 15px;">
                            <div class="col" style="height: 40px;"><input class="form-control" type="text"
                                                                          placeholder="Il tuo nome" name="NameInput">
                            </div>
                            <div class="col" style="height: 40px;"><input class="form-control" type="text"
                                                                          placeholder="Il tuo numero"></div>
                        </div>
                        <div class="row" style="width: 400px;height: 40px;margin-bottom: 15px;">
                            <div class="col" style="height: 40px;"><input class="form-control" type="text"
                                                                          placeholder="La tua e-mail"></div>
                        </div>
                        <div class="row" style="width: 400px;height: 80px;margin-bottom: 15px;">
                            <div class="col" style="height: 80px;"><textarea class="form-control"
                                                                             style="height: 80px;"></textarea></div>
                        </div>
                        <div class="row" style="margin-bottom: 10px;">
                            <div class="col">
                                <div style="margin-bottom: 0px;padding-bottom: 0px;"><span>Accetta le condizioni</span>
                                    <div class="form-check"><input class="form-check-input" type="checkbox"
                                                                   id="formCheck-2"><label class="form-check-label"
                                                                                           for="formCheck-2">I consent
                                        to having this website store my submitted information so they can respond to my
                                        inquiry.<br></label></div>
                                </div>
                            </div>
                        </div>
                        <div class="row" style="margin-bottom: 10px;">
                            <div class="col"><a
                                    class="btn btn-outline-warning d-xl-flex justify-content-xl-center btn-xl"
                                    role="button" href="#download" style="background: #b20135;border-radius: 0px;">Start
                                Now for Free!</a></div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="row" style="height: 95px;">
            <div class="col">
                <form style="height: 95px;margin: 0px;margin-top: -50px;">
                    <div class="row" style="height: 95px;">
                        <div class="col-md-3" style="padding-right: 0px;padding-left: 0px;"><select class="form-select"
                                                                                                    style="height: 95px;">
                            <optgroup label="This is a group">
                                <option value="12" selected="">This is item 1</option>
                                <option value="13">This is item 2</option>
                                <option value="14">This is item 3</option>
                            </optgroup>
                        </select></div>
                        <div class="col-md-3" style="padding-right: 0px;padding-left: 0px;"><select class="form-select"
                                                                                                    style="height: 95px;">
                            <optgroup label="This is a group">
                                <option value="12" selected="">This is item 1</option>
                                <option value="13">This is item 2</option>
                                <option value="14">This is item 3</option>
                            </optgroup>
                        </select></div>
                        <div class="col-md-3" style="padding-right: 0px;padding-left: 0px;"><select class="form-select"
                                                                                                    style="height: 95px;">
                            <optgroup label="This is a group">
                                <option value="12" selected="">This is item 1</option>
                                <option value="13">This is item 2</option>
                                <option value="14">This is item 3</option>
                            </optgroup>
                        </select></div>
                        <div class="col-md-3"
                             style="padding-right: 0px;padding-left: 0px;background: #93002b;width: 100px;">
                            <div class="align-content-center">
                                <button class="btn btn-lg" type="button"
                                        style="border-radius: 0px;width: 100px;height: 95px;padding: 0px;"><i
                                        class="fas fa-search-plus"></i></button>
                            </div>
                        </div>
                        <div class="col" style="padding: 0px;background: #b20135;width: 230px;">
                            <div style="width: 230px;">
                                <button class="btn btn-lg" type="button"
                                        style="height: 95px;width: 230px;border-radius: 0px;border-color: rgba(255,255,255,0);padding: 0px;padding-top: 0px;">
                                    <i class="fa fa-search"></i><span>Cerca</span></button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</header>
<section data-aos="fade-up" data-aos-once="true" id="features" class="features"
         style="background: rgb(255,255,255);margin-top: 50px;width: 1904px;">
    <div class="container">
        <div class="text-center section-heading" style="margin-bottom: 40px;">
            <h2 style="color: #b20135;">Proprietà</h2>
            <p class="text-muted">Dai un'occhiata ad alcune delle nostre ultime proprietà.<br></p>
            <hr>
        </div>
        <div class="row" style="height: 600px;">
            <%for (int i = 0; i < appartamenti.size(); i++) {%>
            <div class="col-md-4 col-xxl-4 offset-xxl-0"
                 style="height: 580px;padding: 0px;padding-right: 0px;padding-left: 0px;">
                <div style="width: 420px;height: 560px;padding-top: 0px;margin: 10px;margin-top: 10px;">
                    <div class="d-xxl-flex align-items-xxl-end"
                         style="background: url(assets/img/Risorsa1-100.jpg) no-repeat;background-size: contain;height: 237px;">
                        <div style="padding-top: 0px;width: 420px;">
                            <div class="d-inline-block" style="width: 220px;height: 70px;font-size: 45px;"><img
                                    style="height: 60px;margin-left: 10px;margin-top: 0px;padding-bottom: 0px;margin-bottom: 5px;border-radius: 50px;"
                                    src="assets/img/image.jpg">
                                <div class="d-inline float-end"
                                     style="height: 70px;width: 148px;margin-top: 0px;margin-left: 0px;padding-left: 5px;padding-top: 10px;padding-bottom: 0px;">
                                    <span class="d-table-row"
                                          style="font-size: 14px;color: rgb(255,255,255);font-weight: bold;"><%
                                        for (AgenteBean bean : agenti) {
                                            if (bean.getIdAgente() == appartamenti.get(i).getIdAgente()) {
                                                for (UtenteBean utenteBean1 : utente) {
                                                    if (utenteBean1.getIdUtente() == bean.getIdAgente()) {
                                    %><%=utenteBean1.getNome() + " " + utenteBean1.getCognome()%><%
                                                    }
                                                }
                                            }
                                        }%></span><span
                                        class="d-table-row" style="font-size: 14px;color: rgb(255,255,255);">James Estate Agents</span>
                                </div>
                            </div>
                            <div class="text-truncate text-center d-inline-block float-end"
                                 style="height: 70px;padding: 0px;padding-top: 0px;font-size: 40px;padding-left: 0px;width: 160px;margin: 0px;margin-left: 0px;text-align: left;color: rgb(255,255,255);">
                                <span style="font-size: 20px;color: rgb(255,255,255);background: rgba(0,0,0,0.72);border-radius: 4px;border-width: 0px;padding-left: 2px;padding-bottom: 2px;padding-right: 2px;padding-top: 2px;"><%=appartamenti.get(i).getTipoVendita()%></span>
                            </div>
                        </div>
                    </div>
                    <div style="height: 323px;color: rgb(0,0,0);padding: 30px;background: #ffffff;">
                        <h1 style="font-family: Lato, sans-serif;font-size: 19px;font-weight: bold;height: 40px;margin-bottom: 0px;">
                            <a href="${pageContext.request.contextPath}/ServletDettagliAppartamento?id=<%=appartamenti.get(i).getIdAppartamento()%>"><%=appartamenti.get(i).getNomeAppartamento()%></a>
                        </h1>
                        <div style="height: 21px;"><i class="fa fa-map-marker" style="color: rgb(31,121,184);"></i><span
                                style="color: rgb(31,121,184);text-decoration:  underline;">Nocera Inferiore(SA), ITALIA</span>
                        </div>
                        <div style="height: 20px;"><span
                                style="height: 20px;">Data aggiunta: <%=appartamenti.get(i).getData().toString()%></span>
                        </div>
                        <div style="height: 74px;margin-top: 20px;">
                            <div class="d-inline-block float-start"
                                 style="width: 78px;height: 74px;margin-left: 0px;margin-right: 0px;padding-left: 0px;padding-right: 0px;padding-bottom: 0px;">
                                <span class="d-table-row"
                                      style="font-size: 15px;font-weight: bold;margin-bottom: 0px;padding-bottom: 0px;">Letti</span>
                                <div style="width: 78px;height: 30px;padding-top: 0px;"><i class="la la-bed"
                                                                                           style="font-size: 27px;width: 25px;height: 25px;"></i><span
                                        class="d-inline-block float-end"
                                        style="padding-right: 17px;height: 30px;font-weight: bold;"><%=appartamenti.get(i).getCamereLetto()%></span>
                                </div>
                            </div>
                            <div class="d-inline-block float-start" style="width: 84px;height: 74px;"><span
                                    class="d-table-row"
                                    style="font-size: 15px;font-weight: bold;margin-bottom: 0px;padding-bottom: 0px;">Bagni</span>
                                <div style="width: 78px;height: 30px;padding-top: 0px;"><i
                                        class="fas fa-shower d-inline-block"
                                        style="font-size: 27px;width: 25px;height: 25px;"></i><span
                                        class="d-inline-block float-end"
                                        style="padding-right: 17px;height: 30px;font-weight: bold;"><%=appartamenti.get(i).getBagni()%></span>
                                </div>
                            </div>
                            <div class="d-inline-block float-start" style="width: 121px;height: 74px;"><span
                                    class="d-table-row"
                                    style="font-size: 15px;font-weight: bold;margin-bottom: 0px;padding-bottom: 0px;">Area</span>
                                <div class="d-inline-block float-start"
                                     style="width: 121px;height: 30px;padding-top: 0px;"><i
                                        class="icon ion-android-checkbox-outline-blank d-inline-flex float-start"
                                        style="font-size: 27px;width: 25px;height: 25px;"></i><span
                                        class="d-inline-block float-start"
                                        style="padding-right: 17px;height: 30px;font-weight: bold;"><%=appartamenti.get(i).getSuperficie()%></span><span
                                        class="d-inline-block float-start"
                                        style="padding-right: 17px;height: 30px;width: 25.6719px;">mq</span></div>
                            </div>
                        </div>
                        <div style="height: 80px;">
                            <div class="d-inline-block float-start" style="width: 150px;height: 80px;"><span
                                    class="d-table-row"><%=appartamenti.get(i).getTipoVendita()%></span><span
                                    style="font-size: 30px;color: rgb(178,1,53);font-weight: bold;">€ <%=appartamenti.get(i).getPrezzo()%></span>
                            </div>
                            <div class="d-inline-block float-end d-xxl-flex align-items-xxl-center"
                                 style="width: 87px;height: 80px;"><i class="fa fa-heart d-inline-block float-start"
                                                                      style="font-size: 35px;color: rgb(128,128,128);"></i><i
                                    class="material-icons d-inline-block float-end"
                                    style="font-size: 35px;padding-left: 17px;color: rgb(128,128,128);">compare_arrows</i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%}%>
        </div>
    </div>
</section>
<section class="d-xxl-flex sfondo" data-aos="fade-up" data-aos-once="true" id="compravendi"
         style="overflow: hidden;position: relative;padding-top: 0px;padding-bottom: 0px;width: 1904px;">
    <div class="diagonaltop"></div>
    <div class="compra" style="width: 1920px;height: 700px;">
        <div class="justify-content-center align-items-center align-content-center align-self-center"
             style="width: 1000px;height: 250px;">
            <h1 class="align-self-center" style="margin-bottom: 10px;">Vuoi acquistare una nuova proprietà o venderne
                una esistente?&nbsp; </h1>
            <h1 class="align-self-center" style="margin-top: 10px;margin-bottom: 10px;">Gabetti fa al caso tuo!</h1>
            <div class="d-flex d-lg-flex justify-content-lg-center" style="height: 60px;margin-top: 20px;">
                <button class="btn btn-primary" type="button"
                        style="background: #b20135;border-width: 0px;border-radius: 0px;margin-right: 10px;">richiesta
                    valutazione
                </button>
                <button class="btn btn-primary" type="button"
                        style="background: rgba(178,1,53,0);border-radius: 0px;margin-right: 0px;margin-left: 10px;border-width: 2px;border-color: #b20135;width: 258.219px;">
                    cerca appartamenti
                </button>
            </div>
        </div>
    </div>
    <div class="diagonalbot" style="position: absolute;bottom: 0;"></div>
</section>
<section data-aos="fade-up" data-aos-once="true" id="features-1" class="features"
         style="background: rgb(255,255,255);position: relative;overflow: hidden;">
    <div class="diagonalsale"></div>
    <div class="container">
        <div class="text-center section-heading" style="margin-bottom: 40px;">
            <h2 style="color: #b20135;">Proprietà in vendita</h2>
            <p class="text-muted">Dai un'occhiata ad alcune delle nostre ultime proprietà in vendita.<br></p>
            <hr>
        </div>
        <div class="row" style="height: 600px;">
            <div class="col-md-4 col-xxl-4 offset-xxl-0"
                 style="height: 580px;padding: 0px;padding-right: 0px;padding-left: 0px;">
                <div style="width: 420px;height: 560px;padding-top: 0px;margin: 10px;margin-top: 10px;">
                    <div class="d-xxl-flex align-items-xxl-end"
                         style="background: url(assets/img/Risorsa1-100.jpg) no-repeat;background-size: contain;height: 237px;">
                        <div style="padding-top: 0px;width: 420px;">
                            <div class="d-inline-block" style="width: 220px;height: 70px;font-size: 45px;"><img
                                    style="height: 60px;margin-left: 10px;margin-top: 0px;padding-bottom: 0px;margin-bottom: 5px;border-radius: 50px;"
                                    src="assets/img/image.jpg">
                                <div class="d-inline float-end"
                                     style="height: 70px;width: 148px;margin-top: 0px;margin-left: 0px;padding-left: 5px;padding-top: 10px;padding-bottom: 0px;">
                                    <span class="d-table-row"
                                          style="font-size: 14px;color: rgb(255,255,255);font-weight: bold;">Nathan James</span><span
                                        class="d-table-row" style="font-size: 14px;color: rgb(255,255,255);">James Estate Agents</span>
                                </div>
                            </div>
                            <div class="text-truncate text-center d-inline-block float-end"
                                 style="height: 70px;padding: 0px;padding-top: 0px;font-size: 40px;padding-left: 0px;width: 160px;margin: 0px;margin-left: 0px;text-align: left;color: rgb(255,255,255);">
                                <span style="font-size: 20px;color: rgb(255,255,255);background: rgba(0,0,0,0.72);border-radius: 4px;border-width: 0px;padding-left: 2px;padding-bottom: 2px;padding-right: 2px;padding-top: 2px;">In Vendita</span>
                            </div>
                        </div>
                    </div>
                    <div style="height: 323px;color: rgb(0,0,0);padding: 30px;background: #ffffff;">
                        <h1 style="font-family: Lato, sans-serif;font-size: 19px;font-weight: bold;height: 40px;margin-bottom: 0px;">
                            Villa in Coral Gables</h1>
                        <div style="height: 21px;"><i class="fa fa-map-marker" style="color: rgb(31,121,184);"></i><span
                                style="color: rgb(31,121,184);text-decoration:  underline;">Nocera Inferiore(SA), ITALIA</span>
                        </div>
                        <div style="height: 20px;"><span style="height: 20px;">Data aggiunta: 02/02/2022</span></div>
                        <div style="height: 74px;margin-top: 20px;">
                            <div class="d-inline-block float-start"
                                 style="width: 78px;height: 74px;margin-left: 0px;margin-right: 0px;padding-left: 0px;padding-right: 0px;padding-bottom: 0px;">
                                <span class="d-table-row"
                                      style="font-size: 15px;font-weight: bold;margin-bottom: 0px;padding-bottom: 0px;">Letti</span>
                                <div style="width: 78px;height: 30px;padding-top: 0px;"><i class="la la-bed"
                                                                                           style="font-size: 27px;width: 25px;height: 25px;"></i><span
                                        class="d-inline-block float-end"
                                        style="padding-right: 17px;height: 30px;font-weight: bold;">3</span></div>
                            </div>
                            <div class="d-inline-block float-start" style="width: 84px;height: 74px;"><span
                                    class="d-table-row"
                                    style="font-size: 15px;font-weight: bold;margin-bottom: 0px;padding-bottom: 0px;">Bagni</span>
                                <div style="width: 78px;height: 30px;padding-top: 0px;"><i
                                        class="fas fa-shower d-inline-block"
                                        style="font-size: 27px;width: 25px;height: 25px;"></i><span
                                        class="d-inline-block float-end"
                                        style="padding-right: 17px;height: 30px;font-weight: bold;">3</span></div>
                            </div>
                            <div class="d-inline-block float-start" style="width: 121px;height: 74px;"><span
                                    class="d-table-row"
                                    style="font-size: 15px;font-weight: bold;margin-bottom: 0px;padding-bottom: 0px;">Area</span>
                                <div class="d-inline-block float-start"
                                     style="width: 121px;height: 30px;padding-top: 0px;"><i
                                        class="icon ion-android-checkbox-outline-blank d-inline-flex float-start"
                                        style="font-size: 27px;width: 25px;height: 25px;"></i><span
                                        class="d-inline-block float-start"
                                        style="padding-right: 17px;height: 30px;font-weight: bold;">100</span><span
                                        class="d-inline-block float-start"
                                        style="padding-right: 17px;height: 30px;width: 25.6719px;">mq</span></div>
                            </div>
                        </div>
                        <div style="height: 80px;">
                            <div class="d-inline-block float-start" style="width: 150px;height: 80px;"><span
                                    class="d-table-row">In vendita</span><span
                                    style="font-size: 30px;color: rgb(178,1,53);font-weight: bold;">€ 100.000</span>
                            </div>
                            <div class="d-inline-block float-end d-xxl-flex align-items-xxl-center"
                                 style="width: 87px;height: 80px;"><i class="fa fa-heart d-inline-block float-start"
                                                                      style="font-size: 35px;color: rgb(128,128,128);"></i><i
                                    class="material-icons d-inline-block float-end"
                                    style="font-size: 35px;padding-left: 17px;color: rgb(128,128,128);">compare_arrows</i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4" style="height: 580px;padding: 0px;">
                <div style="width: 420px;height: 560px;padding-top: 0px;margin: 10px;margin-top: 10px;">
                    <div class="d-xxl-flex align-items-xxl-end"
                         style="background: url(assets/img/Risorsa1-100.jpg) no-repeat;background-size: contain;height: 237px;">
                        <div style="padding-top: 0px;width: 420px;">
                            <div class="d-inline-block" style="width: 220px;height: 70px;font-size: 45px;"><img
                                    style="height: 60px;margin-left: 10px;margin-top: 0px;padding-bottom: 0px;margin-bottom: 5px;border-radius: 50px;"
                                    src="assets/img/image.jpg">
                                <div class="d-inline float-end"
                                     style="height: 70px;width: 148px;margin-top: 0px;margin-left: 0px;padding-left: 5px;padding-top: 10px;padding-bottom: 0px;">
                                    <span class="d-table-row"
                                          style="font-size: 14px;color: rgb(255,255,255);font-weight: bold;">Nathan James</span><span
                                        class="d-table-row" style="font-size: 14px;color: rgb(255,255,255);">James Estate Agents</span>
                                </div>
                            </div>
                            <div class="text-truncate text-center d-inline-block float-end"
                                 style="height: 70px;padding: 0px;padding-top: 0px;font-size: 40px;padding-left: 0px;width: 160px;margin: 0px;margin-left: 0px;text-align: left;color: rgb(255,255,255);">
                                <span style="font-size: 20px;color: rgb(255,255,255);background: rgba(0,0,0,0.72);border-radius: 4px;border-width: 0px;padding-left: 2px;padding-bottom: 2px;padding-right: 2px;padding-top: 2px;">In Vendita</span>
                            </div>
                        </div>
                    </div>
                    <div style="height: 323px;color: rgb(0,0,0);padding: 30px;background: #ffffff;">
                        <h1 style="font-family: Lato, sans-serif;font-size: 19px;font-weight: bold;height: 40px;margin-bottom: 0px;">
                            Villa in Coral Gables</h1>
                        <div style="height: 21px;"><i class="fa fa-map-marker" style="color: rgb(31,121,184);"></i><span
                                style="color: rgb(31,121,184);text-decoration:  underline;">Nocera Inferiore(SA), ITALIA</span>
                        </div>
                        <div style="height: 20px;"><span style="height: 20px;">Data aggiunta: 02/02/2022</span></div>
                        <div style="height: 74px;margin-top: 20px;">
                            <div class="d-inline-block float-start"
                                 style="width: 78px;height: 74px;margin-left: 0px;margin-right: 0px;padding-left: 0px;padding-right: 0px;padding-bottom: 0px;">
                                <span class="d-table-row"
                                      style="font-size: 15px;font-weight: bold;margin-bottom: 0px;padding-bottom: 0px;">Letti</span>
                                <div style="width: 78px;height: 30px;padding-top: 0px;"><i class="la la-bed"
                                                                                           style="font-size: 27px;width: 25px;height: 25px;"></i><span
                                        class="d-inline-block float-end"
                                        style="padding-right: 17px;height: 30px;font-weight: bold;">3</span></div>
                            </div>
                            <div class="d-inline-block float-start" style="width: 84px;height: 74px;"><span
                                    class="d-table-row"
                                    style="font-size: 15px;font-weight: bold;margin-bottom: 0px;padding-bottom: 0px;">Bagni</span>
                                <div style="width: 78px;height: 30px;padding-top: 0px;"><i
                                        class="fas fa-shower d-inline-block"
                                        style="font-size: 27px;width: 25px;height: 25px;"></i><span
                                        class="d-inline-block float-end"
                                        style="padding-right: 17px;height: 30px;font-weight: bold;">3</span></div>
                            </div>
                            <div class="d-inline-block float-start" style="width: 121px;height: 74px;"><span
                                    class="d-table-row"
                                    style="font-size: 15px;font-weight: bold;margin-bottom: 0px;padding-bottom: 0px;">Area</span>
                                <div class="d-inline-block float-start"
                                     style="width: 121px;height: 30px;padding-top: 0px;"><i
                                        class="icon ion-android-checkbox-outline-blank d-inline-flex float-start"
                                        style="font-size: 27px;width: 25px;height: 25px;"></i><span
                                        class="d-inline-block float-start"
                                        style="padding-right: 17px;height: 30px;font-weight: bold;">100</span><span
                                        class="d-inline-block float-start"
                                        style="padding-right: 17px;height: 30px;width: 25.6719px;">mq</span></div>
                            </div>
                        </div>
                        <div style="height: 80px;">
                            <div class="d-inline-block float-start" style="width: 150px;height: 80px;"><span
                                    class="d-table-row">In vendita</span><span
                                    style="font-size: 30px;color: rgb(178,1,53);font-weight: bold;">€ 100.000</span>
                            </div>
                            <div class="d-inline-block float-end d-xxl-flex align-items-xxl-center"
                                 style="width: 87px;height: 80px;"><i class="fa fa-heart d-inline-block float-start"
                                                                      style="font-size: 35px;color: rgb(128,128,128);"></i><i
                                    class="material-icons d-inline-block float-end"
                                    style="font-size: 35px;padding-left: 17px;color: rgb(128,128,128);">compare_arrows</i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4" style="height: 580px;padding: 0px;">
                <div style="width: 420px;height: 560px;padding-top: 0px;margin: 10px;margin-top: 10px;">
                    <div class="d-xxl-flex align-items-xxl-end"
                         style="background: url(assets/img/Risorsa1-100.jpg) no-repeat;background-size: contain;height: 237px;">
                        <div style="padding-top: 0px;width: 420px;">
                            <div class="d-inline-block" style="width: 220px;height: 70px;font-size: 45px;"><img
                                    style="height: 60px;margin-left: 10px;margin-top: 0px;padding-bottom: 0px;margin-bottom: 5px;border-radius: 50px;"
                                    src="assets/img/image.jpg">
                                <div class="d-inline float-end"
                                     style="height: 70px;width: 148px;margin-top: 0px;margin-left: 0px;padding-left: 5px;padding-top: 10px;padding-bottom: 0px;">
                                    <span class="d-table-row"
                                          style="font-size: 14px;color: rgb(255,255,255);font-weight: bold;">Nathan James</span><span
                                        class="d-table-row" style="font-size: 14px;color: rgb(255,255,255);">James Estate Agents</span>
                                </div>
                            </div>
                            <div class="text-truncate text-center d-inline-block float-end"
                                 style="height: 70px;padding: 0px;padding-top: 0px;font-size: 40px;padding-left: 0px;width: 160px;margin: 0px;margin-left: 0px;text-align: left;color: rgb(255,255,255);">
                                <span style="font-size: 20px;color: rgb(255,255,255);background: rgba(0,0,0,0.72);border-radius: 4px;border-width: 0px;padding-left: 2px;padding-bottom: 2px;padding-right: 2px;padding-top: 2px;">In Vendita</span>
                            </div>
                        </div>
                    </div>
                    <div style="height: 323px;color: rgb(0,0,0);padding: 30px;background: #ffffff;">
                        <h1 style="font-family: Lato, sans-serif;font-size: 19px;font-weight: bold;height: 40px;margin-bottom: 0px;">
                            Villa in Coral Gables</h1>
                        <div style="height: 21px;"><i class="fa fa-map-marker" style="color: rgb(31,121,184);"></i><span
                                style="color: rgb(31,121,184);text-decoration:  underline;">Nocera Inferiore(SA), ITALIA</span>
                        </div>
                        <div style="height: 20px;"><span style="height: 20px;">Data aggiunta: 02/02/2022</span></div>
                        <div style="height: 74px;margin-top: 20px;">
                            <div class="d-inline-block float-start"
                                 style="width: 78px;height: 74px;margin-left: 0px;margin-right: 0px;padding-left: 0px;padding-right: 0px;padding-bottom: 0px;">
                                <span class="d-table-row"
                                      style="font-size: 15px;font-weight: bold;margin-bottom: 0px;padding-bottom: 0px;">Letti</span>
                                <div style="width: 78px;height: 30px;padding-top: 0px;"><i class="la la-bed"
                                                                                           style="font-size: 27px;width: 25px;height: 25px;"></i><span
                                        class="d-inline-block float-end"
                                        style="padding-right: 17px;height: 30px;font-weight: bold;">3</span></div>
                            </div>
                            <div class="d-inline-block float-start" style="width: 84px;height: 74px;"><span
                                    class="d-table-row"
                                    style="font-size: 15px;font-weight: bold;margin-bottom: 0px;padding-bottom: 0px;">Bagni</span>
                                <div style="width: 78px;height: 30px;padding-top: 0px;"><i
                                        class="fas fa-shower d-inline-block"
                                        style="font-size: 27px;width: 25px;height: 25px;"></i><span
                                        class="d-inline-block float-end"
                                        style="padding-right: 17px;height: 30px;font-weight: bold;">3</span></div>
                            </div>
                            <div class="d-inline-block float-start" style="width: 121px;height: 74px;"><span
                                    class="d-table-row"
                                    style="font-size: 15px;font-weight: bold;margin-bottom: 0px;padding-bottom: 0px;">Area</span>
                                <div class="d-inline-block float-start"
                                     style="width: 121px;height: 30px;padding-top: 0px;"><i
                                        class="icon ion-android-checkbox-outline-blank d-inline-flex float-start"
                                        style="font-size: 27px;width: 25px;height: 25px;"></i><span
                                        class="d-inline-block float-start"
                                        style="padding-right: 17px;height: 30px;font-weight: bold;">100</span><span
                                        class="d-inline-block float-start"
                                        style="padding-right: 17px;height: 30px;width: 25.6719px;">mq</span></div>
                            </div>
                        </div>
                        <div style="height: 80px;">
                            <div class="d-inline-block float-start" style="width: 150px;height: 80px;"><span
                                    class="d-table-row">In vendita</span><span
                                    style="font-size: 30px;color: rgb(178,1,53);font-weight: bold;">€ 100.000</span>
                            </div>
                            <div class="d-inline-block float-end d-xxl-flex align-items-xxl-center"
                                 style="width: 87px;height: 80px;"><i class="fa fa-heart d-inline-block float-start"
                                                                      style="font-size: 35px;color: rgb(128,128,128);"></i><i
                                    class="material-icons d-inline-block float-end"
                                    style="font-size: 35px;padding-left: 17px;color: rgb(128,128,128);">compare_arrows</i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<section data-aos="fade-up" data-aos-once="true" id="features-2" class="features"
         style="background: #f7f7f7;border-top-right-radius: 0px;color: #212529;position: relative;overflow: hidden;padding-top: 0px;">
    <div class="diagonalrent"></div>
    <div class="container" style="padding-top: 100px;">
        <div class="text-center section-heading" style="margin-bottom: 40px;">
            <h2 style="color: #b20135;">Proprietà in affitto</h2>
            <p class="text-muted">Dai un'occhiata ad alcune delle nostre ultime proprietà in affitto.<br></p>
            <hr>
        </div>
        <div class="row" style="height: 600px;">
            <div class="col-md-4 col-xxl-4 offset-xxl-0"
                 style="height: 580px;padding: 0px;padding-right: 0px;padding-left: 0px;">
                <div style="width: 420px;height: 560px;padding-top: 0px;margin: 10px;margin-top: 10px;">
                    <div class="d-xxl-flex align-items-xxl-end"
                         style="background: url(assets/img/Risorsa1-100.jpg) no-repeat;background-size: contain;height: 237px;">
                        <div style="padding-top: 0px;width: 420px;">
                            <div class="d-inline-block" style="width: 220px;height: 70px;font-size: 45px;"><img
                                    style="height: 60px;margin-left: 10px;margin-top: 0px;padding-bottom: 0px;margin-bottom: 5px;border-radius: 50px;"
                                    src="assets/img/image.jpg">
                                <div class="d-inline float-end"
                                     style="height: 70px;width: 148px;margin-top: 0px;margin-left: 0px;padding-left: 5px;padding-top: 10px;padding-bottom: 0px;">
                                    <span class="d-table-row"
                                          style="font-size: 14px;color: rgb(255,255,255);font-weight: bold;">Nathan James</span><span
                                        class="d-table-row" style="font-size: 14px;color: rgb(255,255,255);">James Estate Agents</span>
                                </div>
                            </div>
                            <div class="text-truncate text-center d-inline-block float-end"
                                 style="height: 70px;padding: 0px;padding-top: 0px;font-size: 40px;padding-left: 0px;width: 160px;margin: 0px;margin-left: 0px;text-align: left;color: rgb(255,255,255);">
                                <span style="font-size: 20px;color: rgb(255,255,255);background: rgba(0,0,0,0.72);border-radius: 4px;border-width: 0px;padding-left: 2px;padding-bottom: 2px;padding-right: 2px;padding-top: 2px;">In Vendita</span>
                            </div>
                        </div>
                    </div>
                    <div style="height: 323px;color: rgb(0,0,0);padding: 30px;background: #ffffff;">
                        <h1 style="font-family: Lato, sans-serif;font-size: 19px;font-weight: bold;height: 40px;margin-bottom: 0px;">
                            Villa in Coral Gables</h1>
                        <div style="height: 21px;"><i class="fa fa-map-marker" style="color: rgb(31,121,184);"></i><span
                                style="color: rgb(31,121,184);text-decoration:  underline;">Nocera Inferiore(SA), ITALIA</span>
                        </div>
                        <div style="height: 20px;"><span style="height: 20px;">Data aggiunta: 02/02/2022</span></div>
                        <div style="height: 74px;margin-top: 20px;">
                            <div class="d-inline-block float-start"
                                 style="width: 78px;height: 74px;margin-left: 0px;margin-right: 0px;padding-left: 0px;padding-right: 0px;padding-bottom: 0px;">
                                <span class="d-table-row"
                                      style="font-size: 15px;font-weight: bold;margin-bottom: 0px;padding-bottom: 0px;">Letti</span>
                                <div style="width: 78px;height: 30px;padding-top: 0px;"><i class="la la-bed"
                                                                                           style="font-size: 27px;width: 25px;height: 25px;"></i><span
                                        class="d-inline-block float-end"
                                        style="padding-right: 17px;height: 30px;font-weight: bold;">3</span></div>
                            </div>
                            <div class="d-inline-block float-start" style="width: 84px;height: 74px;"><span
                                    class="d-table-row"
                                    style="font-size: 15px;font-weight: bold;margin-bottom: 0px;padding-bottom: 0px;">Bagni</span>
                                <div style="width: 78px;height: 30px;padding-top: 0px;"><i
                                        class="fas fa-shower d-inline-block"
                                        style="font-size: 27px;width: 25px;height: 25px;"></i><span
                                        class="d-inline-block float-end"
                                        style="padding-right: 17px;height: 30px;font-weight: bold;">3</span></div>
                            </div>
                            <div class="d-inline-block float-start" style="width: 121px;height: 74px;"><span
                                    class="d-table-row"
                                    style="font-size: 15px;font-weight: bold;margin-bottom: 0px;padding-bottom: 0px;">Area</span>
                                <div class="d-inline-block float-start"
                                     style="width: 121px;height: 30px;padding-top: 0px;"><i
                                        class="icon ion-android-checkbox-outline-blank d-inline-flex float-start"
                                        style="font-size: 27px;width: 25px;height: 25px;"></i><span
                                        class="d-inline-block float-start"
                                        style="padding-right: 17px;height: 30px;font-weight: bold;">100</span><span
                                        class="d-inline-block float-start"
                                        style="padding-right: 17px;height: 30px;width: 25.6719px;">mq</span></div>
                            </div>
                        </div>
                        <div style="height: 80px;">
                            <div class="d-inline-block float-start" style="width: 150px;height: 80px;"><span
                                    class="d-table-row">In vendita</span><span
                                    style="font-size: 30px;color: rgb(178,1,53);font-weight: bold;">€ 100.000</span>
                            </div>
                            <div class="d-inline-block float-end d-xxl-flex align-items-xxl-center"
                                 style="width: 87px;height: 80px;"><i class="fa fa-heart d-inline-block float-start"
                                                                      style="font-size: 35px;color: rgb(128,128,128);"></i><i
                                    class="material-icons d-inline-block float-end"
                                    style="font-size: 35px;padding-left: 17px;color: rgb(128,128,128);">compare_arrows</i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4" style="height: 580px;padding: 0px;">
                <div style="width: 420px;height: 560px;padding-top: 0px;margin: 10px;margin-top: 10px;">
                    <div class="d-xxl-flex align-items-xxl-end"
                         style="background: url(assets/img/Risorsa1-100.jpg) no-repeat;background-size: contain;height: 237px;">
                        <div style="padding-top: 0px;width: 420px;">
                            <div class="d-inline-block" style="width: 220px;height: 70px;font-size: 45px;"><img
                                    style="height: 60px;margin-left: 10px;margin-top: 0px;padding-bottom: 0px;margin-bottom: 5px;border-radius: 50px;"
                                    src="assets/img/image.jpg">
                                <div class="d-inline float-end"
                                     style="height: 70px;width: 148px;margin-top: 0px;margin-left: 0px;padding-left: 5px;padding-top: 10px;padding-bottom: 0px;">
                                    <span class="d-table-row"
                                          style="font-size: 14px;color: rgb(255,255,255);font-weight: bold;">Nathan James</span><span
                                        class="d-table-row" style="font-size: 14px;color: rgb(255,255,255);">James Estate Agents</span>
                                </div>
                            </div>
                            <div class="text-truncate text-center d-inline-block float-end"
                                 style="height: 70px;padding: 0px;padding-top: 0px;font-size: 40px;padding-left: 0px;width: 160px;margin: 0px;margin-left: 0px;text-align: left;color: rgb(255,255,255);">
                                <span style="font-size: 20px;color: rgb(255,255,255);background: rgba(0,0,0,0.72);border-radius: 4px;border-width: 0px;padding-left: 2px;padding-bottom: 2px;padding-right: 2px;padding-top: 2px;">In Vendita</span>
                            </div>
                        </div>
                    </div>
                    <div style="height: 323px;color: rgb(0,0,0);padding: 30px;background: #ffffff;">
                        <h1 style="font-family: Lato, sans-serif;font-size: 19px;font-weight: bold;height: 40px;margin-bottom: 0px;">
                            Villa in Coral Gables</h1>
                        <div style="height: 21px;"><i class="fa fa-map-marker" style="color: rgb(31,121,184);"></i><span
                                style="color: rgb(31,121,184);text-decoration:  underline;">Nocera Inferiore(SA), ITALIA</span>
                        </div>
                        <div style="height: 20px;"><span style="height: 20px;">Data aggiunta: 02/02/2022</span></div>
                        <div style="height: 74px;margin-top: 20px;">
                            <div class="d-inline-block float-start"
                                 style="width: 78px;height: 74px;margin-left: 0px;margin-right: 0px;padding-left: 0px;padding-right: 0px;padding-bottom: 0px;">
                                <span class="d-table-row"
                                      style="font-size: 15px;font-weight: bold;margin-bottom: 0px;padding-bottom: 0px;">Letti</span>
                                <div style="width: 78px;height: 30px;padding-top: 0px;"><i class="la la-bed"
                                                                                           style="font-size: 27px;width: 25px;height: 25px;"></i><span
                                        class="d-inline-block float-end"
                                        style="padding-right: 17px;height: 30px;font-weight: bold;">3</span></div>
                            </div>
                            <div class="d-inline-block float-start" style="width: 84px;height: 74px;"><span
                                    class="d-table-row"
                                    style="font-size: 15px;font-weight: bold;margin-bottom: 0px;padding-bottom: 0px;">Bagni</span>
                                <div style="width: 78px;height: 30px;padding-top: 0px;"><i
                                        class="fas fa-shower d-inline-block"
                                        style="font-size: 27px;width: 25px;height: 25px;"></i><span
                                        class="d-inline-block float-end"
                                        style="padding-right: 17px;height: 30px;font-weight: bold;">3</span></div>
                            </div>
                            <div class="d-inline-block float-start" style="width: 121px;height: 74px;"><span
                                    class="d-table-row"
                                    style="font-size: 15px;font-weight: bold;margin-bottom: 0px;padding-bottom: 0px;">Area</span>
                                <div class="d-inline-block float-start"
                                     style="width: 121px;height: 30px;padding-top: 0px;"><i
                                        class="icon ion-android-checkbox-outline-blank d-inline-flex float-start"
                                        style="font-size: 27px;width: 25px;height: 25px;"></i><span
                                        class="d-inline-block float-start"
                                        style="padding-right: 17px;height: 30px;font-weight: bold;">100</span><span
                                        class="d-inline-block float-start"
                                        style="padding-right: 17px;height: 30px;width: 25.6719px;">mq</span></div>
                            </div>
                        </div>
                        <div style="height: 80px;">
                            <div class="d-inline-block float-start" style="width: 150px;height: 80px;"><span
                                    class="d-table-row">In vendita</span><span
                                    style="font-size: 30px;color: rgb(178,1,53);font-weight: bold;">€ 100.000</span>
                            </div>
                            <div class="d-inline-block float-end d-xxl-flex align-items-xxl-center"
                                 style="width: 87px;height: 80px;"><i class="fa fa-heart d-inline-block float-start"
                                                                      style="font-size: 35px;color: rgb(128,128,128);"></i><i
                                    class="material-icons d-inline-block float-end"
                                    style="font-size: 35px;padding-left: 17px;color: rgb(128,128,128);">compare_arrows</i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4" style="height: 580px;padding: 0px;">
                <div style="width: 420px;height: 560px;padding-top: 0px;margin: 10px;margin-top: 10px;">
                    <div class="d-xxl-flex align-items-xxl-end"
                         style="background: url(assets/img/Risorsa1-100.jpg) no-repeat;background-size: contain;height: 237px;">
                        <div style="padding-top: 0px;width: 420px;">
                            <div class="d-inline-block" style="width: 220px;height: 70px;font-size: 45px;"><img
                                    style="height: 60px;margin-left: 10px;margin-top: 0px;padding-bottom: 0px;margin-bottom: 5px;border-radius: 50px;"
                                    src="assets/img/image.jpg">
                                <div class="d-inline float-end"
                                     style="height: 70px;width: 148px;margin-top: 0px;margin-left: 0px;padding-left: 5px;padding-top: 10px;padding-bottom: 0px;">
                                    <span class="d-table-row"
                                          style="font-size: 14px;color: rgb(255,255,255);font-weight: bold;">Nathan James</span><span
                                        class="d-table-row" style="font-size: 14px;color: rgb(255,255,255);">James Estate Agents</span>
                                </div>
                            </div>
                            <div class="text-truncate text-center d-inline-block float-end"
                                 style="height: 70px;padding: 0px;padding-top: 0px;font-size: 40px;padding-left: 0px;width: 160px;margin: 0px;margin-left: 0px;text-align: left;color: rgb(255,255,255);">
                                <span style="font-size: 20px;color: rgb(255,255,255);background: rgba(0,0,0,0.72);border-radius: 4px;border-width: 0px;padding-left: 2px;padding-bottom: 2px;padding-right: 2px;padding-top: 2px;">In Vendita</span>
                            </div>
                        </div>
                    </div>
                    <div style="height: 323px;color: rgb(0,0,0);padding: 30px;background: #ffffff;">
                        <h1 style="font-family: Lato, sans-serif;font-size: 19px;font-weight: bold;height: 40px;margin-bottom: 0px;">
                            Villa in Coral Gables</h1>
                        <div style="height: 21px;"><i class="fa fa-map-marker" style="color: rgb(31,121,184);"></i><span
                                style="color: rgb(31,121,184);text-decoration:  underline;">Nocera Inferiore(SA), ITALIA</span>
                        </div>
                        <div style="height: 20px;"><span style="height: 20px;">Data aggiunta: 02/02/2022</span></div>
                        <div style="height: 74px;margin-top: 20px;">
                            <div class="d-inline-block float-start"
                                 style="width: 78px;height: 74px;margin-left: 0px;margin-right: 0px;padding-left: 0px;padding-right: 0px;padding-bottom: 0px;">
                                <span class="d-table-row"
                                      style="font-size: 15px;font-weight: bold;margin-bottom: 0px;padding-bottom: 0px;">Letti</span>
                                <div style="width: 78px;height: 30px;padding-top: 0px;"><i class="la la-bed"
                                                                                           style="font-size: 27px;width: 25px;height: 25px;"></i><span
                                        class="d-inline-block float-end"
                                        style="padding-right: 17px;height: 30px;font-weight: bold;">3</span></div>
                            </div>
                            <div class="d-inline-block float-start" style="width: 84px;height: 74px;"><span
                                    class="d-table-row"
                                    style="font-size: 15px;font-weight: bold;margin-bottom: 0px;padding-bottom: 0px;">Bagni</span>
                                <div style="width: 78px;height: 30px;padding-top: 0px;"><i
                                        class="fas fa-shower d-inline-block"
                                        style="font-size: 27px;width: 25px;height: 25px;"></i><span
                                        class="d-inline-block float-end"
                                        style="padding-right: 17px;height: 30px;font-weight: bold;">3</span></div>
                            </div>
                            <div class="d-inline-block float-start" style="width: 121px;height: 74px;"><span
                                    class="d-table-row"
                                    style="font-size: 15px;font-weight: bold;margin-bottom: 0px;padding-bottom: 0px;">Area</span>
                                <div class="d-inline-block float-start"
                                     style="width: 121px;height: 30px;padding-top: 0px;"><i
                                        class="icon ion-android-checkbox-outline-blank d-inline-flex float-start"
                                        style="font-size: 27px;width: 25px;height: 25px;"></i><span
                                        class="d-inline-block float-start"
                                        style="padding-right: 17px;height: 30px;font-weight: bold;">100</span><span
                                        class="d-inline-block float-start"
                                        style="padding-right: 17px;height: 30px;width: 25.6719px;">mq</span></div>
                            </div>
                        </div>
                        <div style="height: 80px;">
                            <div class="d-inline-block float-start" style="width: 150px;height: 80px;"><span
                                    class="d-table-row">In vendita</span><span
                                    style="font-size: 30px;color: rgb(178,1,53);font-weight: bold;">€ 100.000</span>
                            </div>
                            <div class="d-inline-block float-end d-xxl-flex align-items-xxl-center"
                                 style="width: 87px;height: 80px;"><i class="fa fa-heart d-inline-block float-start"
                                                                      style="font-size: 35px;color: rgb(128,128,128);"></i><i
                                    class="material-icons d-inline-block float-end"
                                    style="font-size: 35px;padding-left: 17px;color: rgb(128,128,128);">compare_arrows</i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<section id="features-3" class="features"
         style="background: rgb(255,255,255);position: relative;border-top-right-radius: 0px;padding-top: 0px;padding-bottom: 100px;overflow: hidden;color: #212529;">
    <div class="diagonalagents" style="height: 0px;padding-top: 0px;width: 0px;"></div>
    <div class="container" style="padding-top: 100px;padding-bottom: 100px;">
        <div class="text-center section-heading" style="margin-bottom: 40px;">
            <h2 style="color: #b20135;">I nostri agenti</h2>
            <p class="text-muted">Mettiti in contatto con i nostri esperti immobiliari.<br></p>
            <hr>
        </div>
        <div class="row" style="height: 307px;margin-left: 0px;margin-right: 0px;">
            <div class="col-md-4 col-xxl-4 offset-xxl-0 d-xxl-flex justify-content-xxl-center"
                 style="height: 385px;padding: 0px;padding-right: 0px;padding-left: 0px;width: 320px;">
                <article
                        style="width: 320px;padding-top: 40px;padding-right: 15px;padding-bottom: 40px;padding-left: 15px;">
                    <div class="text-center d-xxl-flex justify-content-center align-items-start order-first"
                         style="height: 302px;box-shadow: 0px 0px 3px 1px rgba(33,37,41,0.43);">
                        <div class="d-xxl-flex wrap"
                             style="width: 128px;height: 128px;margin-top: -64px;background: url(assets/img/image.jpg) no-repeat;background-size: contain;"></div>
                        <div class="wrap" style="width: 288px;height: 200px;margin-top: 100px;">
                            <h3>Nathan James</h3>
                            <h6 style="font-size: 19px;text-decoration: underline;color: rgb(178,1,53);">
                                333.239.33.33</h6>
                            <h6 style="font-size: 19px;">example@gmail.com</h6>
                            <div class="d-inline-block" style="width: 250px;height: 60px;"><span
                                    class="d-xxl-flex justify-content-xxl-center"
                                    style="font-size: 24px;color: rgb(178,1,53);font-weight: bold;">3</span><span
                                    style="font-weight: bold;">Proprietà di appartenenza</span></div>
                        </div>
                    </div>
                </article>
            </div>
            <div class="col" style="width: 320px;height: 385px;">
                <article
                        style="width: 320px;padding-top: 40px;padding-right: 15px;padding-bottom: 40px;padding-left: 15px;">
                    <div class="text-center d-xxl-flex justify-content-center align-items-start order-first"
                         style="height: 302px;box-shadow: 0px 0px 3px 1px rgba(33,37,41,0.43);">
                        <div class="d-xxl-flex wrap"
                             style="width: 128px;height: 128px;margin-top: -64px;background: url(assets/img/image.jpg) no-repeat;background-size: contain;"></div>
                        <div class="wrap" style="width: 288px;height: 200px;margin-top: 100px;">
                            <h3>Nathan James</h3>
                            <h6 style="font-size: 19px;text-decoration: underline;color: rgb(178,1,53);">
                                333.239.33.33</h6>
                            <h6 style="font-size: 19px;">example@gmail.com</h6>
                            <div class="d-inline-block" style="width: 250px;height: 60px;"><span
                                    class="d-xxl-flex justify-content-xxl-center"
                                    style="font-size: 24px;color: rgb(178,1,53);font-weight: bold;">3</span><span
                                    style="font-weight: bold;">Proprietà di appartenenza</span></div>
                        </div>
                    </div>
                </article>
            </div>
            <div class="col-md-4" style="height: 385px;padding: 0px;width: 320px;">
                <article
                        style="width: 320px;padding-top: 40px;padding-right: 15px;padding-bottom: 40px;padding-left: 15px;">
                    <div class="text-center d-xxl-flex justify-content-center align-items-start order-first"
                         style="height: 302px;box-shadow: 0px 0px 3px 1px rgba(33,37,41,0.43);">
                        <div class="d-xxl-flex wrap"
                             style="width: 128px;height: 128px;margin-top: -64px;background: url(assets/img/image.jpg) no-repeat;background-size: contain;"></div>
                        <div class="wrap" style="width: 288px;height: 200px;margin-top: 100px;">
                            <h3>Nathan James</h3>
                            <h6 style="font-size: 19px;text-decoration: underline;color: rgb(178,1,53);">
                                333.239.33.33</h6>
                            <h6 style="font-size: 19px;">example@gmail.com</h6>
                            <div class="d-inline-block" style="width: 250px;height: 60px;"><span
                                    class="d-xxl-flex justify-content-xxl-center"
                                    style="font-size: 24px;color: rgb(178,1,53);font-weight: bold;">3</span><span
                                    style="font-weight: bold;">Proprietà di appartenenza</span></div>
                        </div>
                    </div>
                </article>
            </div>
            <div class="col-md-4" style="height: 385px;padding: 0px;width: 320px;">
                <article
                        style="width: 320px;padding-top: 40px;padding-right: 15px;padding-bottom: 40px;padding-left: 15px;">
                    <div class="text-center d-xxl-flex justify-content-center align-items-start order-first"
                         style="height: 302px;box-shadow: 0px 0px 3px 1px rgba(33,37,41,0.43);">
                        <div class="d-xxl-flex wrap"
                             style="width: 128px;height: 128px;margin-top: -64px;background: url(assets/img/image.jpg) no-repeat;background-size: contain;"></div>
                        <div class="wrap" style="width: 288px;height: 200px;margin-top: 100px;">
                            <h3>Nathan James</h3>
                            <h6 style="font-size: 19px;text-decoration: underline;color: rgb(178,1,53);">
                                333.239.33.33</h6>
                            <h6 style="font-size: 19px;">example@gmail.com</h6>
                            <div class="d-inline-block" style="width: 250px;height: 60px;"><span
                                    class="d-xxl-flex justify-content-xxl-center"
                                    style="font-size: 24px;color: rgb(178,1,53);font-weight: bold;">3</span><span
                                    style="font-weight: bold;">Proprietà di appartenenza</span></div>
                        </div>
                    </div>
                </article>
            </div>
        </div>
    </div>
</section>
<footer data-aos="fade-up" data-aos-once="true"
        style="height: 600px;border-top-left-radius: 0px;border-width: 0px;overflow: hidden;position: relative;padding-top: 0px;padding-bottom: 0px;">
    <div class="diagonalfooter"></div>
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
