<%@ page import="model.appartamento.AppartamentoBean" %>
<%@ page import="model.agente.AgenteBean" %>
<%@ page import="model.utente.UtenteBean" %>
<%@ page import="model.indirizzo.IndirizzoBean" %>
<%@ page import="model.multimedia.MultimediaBean" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Luca
  Date: 25/02/2022
  Time: 16:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%
    ArrayList<AppartamentoBean> arrayAppartamento = (ArrayList<AppartamentoBean>) request.getAttribute("arrayAppartamento");
    AgenteBean agenteBean = (AgenteBean) request.getAttribute("agente");
    UtenteBean utenteBean = (UtenteBean) request.getAttribute("utente");
    ArrayList<IndirizzoBean> arrayIndirizzo = (ArrayList<IndirizzoBean>)  request.getAttribute("arrayIndirizzo");
    ArrayList<MultimediaBean> arrayMultimedia = (ArrayList<MultimediaBean>) request.getAttribute("arrayMultimedia");
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

<body style="background: #f7f7f7;">
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
<section style="padding-bottom: 50px;height: 2600px;">
    <div class="container">
        <div class="row">
            <div class="col-md-8" style="height: 2600px;">
                <div style="height: 2600px;">
                    <div class="flex-wrap"
                         style="height: 1200px;padding: 25px;background: #ffffff;box-shadow: 0px 0px 20px #dddddd;margin-bottom: 50px;">
                        <div class="d-inline-flex" style="height: 150px;width: 806px;"><img
                                style="width: 150px;height: 150px;padding-bottom: 0px;margin: 0px 0px;margin-top: -60px;"
                                src="assets/img/image.jpg">
                            <div style="width: 450px;height: 60px;padding: 0px;margin-left: 20px;">
                                <h1 class="d-xxl-flex"
                                    style="color: #b20135;font-size: 35px;height: 40px;width: 300px;margin-bottom: 0px;">
                                    Nathan James</h1>
                                <div style="width: 400px;height: 20px;"><span
                                        style="color: rgb(178,1,53);padding-left: 0px;padding-right: 20px;">3</span><span
                                        style="color: #808080;height: 20px;">Proprietà possedute</span></div>
                            </div>
                            <div class="text-center float-end d-xxl-flex justify-content-xxl-end align-items-xxl-center"
                                 style="width: 299px;height: 60px;font-size: 20px;"><i class="fa fa-facebook"
                                                                                       style="color: rgb(128,128,128);margin-right: 15px;"></i><i
                                    class="fa fa-twitter" style="color: rgb(128,128,128);margin-right: 15px;"></i><i
                                    class="fa fa-linkedin-square"
                                    style="color: rgb(128,128,128);margin-right: 15px;"></i><i class="fa fa-instagram"
                                                                                               style="color: rgb(128,128,128);margin-right: 15px;"></i><i
                                    class="fa fa-chrome" style="color: rgb(128,128,128);margin-right: 15px;"></i><i
                                    class="fa fa-youtube-play"
                                    style="color: rgb(128,128,128);margin-right: 15px;"></i><i class="fa fa-pinterest"
                                                                                               style="color: rgb(128,128,128);margin-right: 15px;"></i>
                            </div>
                        </div>
                        <div class="d-inline-flex" style="width: 806px;height: 350px;">
                            <p style="height: 350px;width: 806px;color: rgb(128,128,128);padding: 0px;">Donec
                                ullamcorper nulla non metus auctor fringilla. Curabitur blandit tempus porttitor. Duis
                                mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec
                                elit. Cras mattis consectetur purus sit amet fermentum. Vivamus sagittis lacus vel augue
                                laoreet rutrum faucibus dolor auctor. Morbi leo risus, porta ac consectetur ac,
                                vestibulum at eros. Cras mattis consectetur purus sit amet fermentum.Lorem ipsum dolor
                                sit amet, consectetur adipiscing elit. Maecenas faucibus mollis interdum. Cum sociis
                                natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Curabitur
                                blandit tempus porttitor. Maecenas faucibus mollis interdum. Nullam id dolor id nibh
                                ultricies vehicula ut id elit.Nullam quis risus eget urna mollis ornare vel eu leo.
                                Curabitur blandit tempus porttitor. Aenean eu leo quam. Pellentesque ornare sem lacinia
                                quam venenatis vestibulum. Etiam porta sem malesuada magna mollis euismod. Curabitur
                                blandit tempus porttitor.<br><br><br></p>
                        </div>
                        <div class="d-inline-flex" style="width: 809px;height: 80px;">
                            <div style="width: 300px;height: 25px;margin-right: 15px;">
                                <h1 class="d-xxl-flex align-items-xxl-center"
                                    style="color: rgb(128,128,128);font-size: 20px;height: 25px;margin-bottom: 0px;margin-right: 0px;width: 200px;">
                                    <br>Ufficio: 0818276445<br><br></h1>
                            </div>
                            <div style="width: 300px;height: 25px;margin-right: 15px;">
                                <h1 class="d-xxl-flex align-items-xxl-center"
                                    style="color: rgb(128,128,128);font-size: 20px;height: 25px;margin-bottom: 0px;margin-right: 0px;width: 200px;">
                                    <br>Cellulare: 0818276445<br><br></h1>
                            </div>
                            <div style="width: 300px;height: 25px;margin-right: 15px;">
                                <h1 class="d-xxl-flex align-items-xxl-center"
                                    style="color: rgb(128,128,128);font-size: 20px;height: 25px;margin-bottom: 0px;margin-right: 0px;width: 300px;">
                                    Email: example@gmail.com</h1>
                            </div>
                        </div>
                        <div style="height: 1px;border: 1px solid rgba(128,128,128,.2);margin-bottom: 20px;"></div>
                        <div style="height: 540px;">
                            <form style="height: 540px;">
                                <div class="d-inline-block" style="width: 380px;height: 90px;margin-bottom: 15px;">
                                    <label class="form-label">Nome</label><input class="form-control" type="text"
                                                                                 style="height: 50px;border-width: 1px;border-radius: 0px;"
                                                                                 placeholder="Il tuo Nome"></div>
                                <div class="d-inline-block float-end" style="width: 380px;height: 90px;"><label
                                        class="form-label">Email</label><input class="form-control" type="text"
                                                                               style="height: 50px;border-width: 1px;border-radius: 0px;"
                                                                               placeholder="La tua Email"></div>
                                <div class="d-inline-block float-start"
                                     style="width: 380px;height: 90px;margin-bottom: 15px;"><label class="form-label">Telefono</label><input
                                        class="form-control" type="text"
                                        style="height: 50px;border-width: 1px;border-radius: 0px;"
                                        placeholder="Il tuo Telefono"></div>
                                <div class="d-inline-block" style="width: 806px;height: 170px;"><label
                                        class="form-label">Messaggio</label><textarea class="form-control"
                                                                                      style="height: 130px;padding-top: 0px;padding-bottom: 0px;border-radius: 0px;"
                                                                                      placeholder="Scrivi il tuo messaggio"></textarea>
                                </div>
                                <div style="height: 50px;margin-bottom: 20px;"><label class="form-label"
                                                                                      style="height: 24px;width: 161px;">Accordo
                                    sulla privacy</label>
                                    <div class="form-check"><input class="form-check-input" type="radio"
                                                                   id="formCheck-1" style="border-radius: 30%;"><label
                                            class="form-check-label" for="formCheck-1">I consent to having this website
                                        store my submitted information so they can respond to my inquiry.<br></label>
                                    </div>
                                </div>
                                <div style="height: 50px;">
                                    <button class="btn btn-primary btn-lg" type="button"
                                            style="background: #b20135;border-radius: 0px;">Invia messaggio
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div style="height: 80px;">
                        <h1 style="color: rgb(178,1,53);">Le mie proprietà</h1>
                    </div>
                    <div style="height: 210px;padding-bottom: 20px;background: #ffffff;box-shadow: 0px 0px 20px #dddddd;margin-bottom: 50px;">
                        <article class="d-inline-block float-start" style="height: 210px;">
                            <figure class="figure"
                                    style="background: url(assets/img/Risorsa1-100.jpg) center / cover no-repeat;height: 210px;width: 280px;"></figure>
                        </article>
                        <div class="d-inline-block"
                             style="height: 210px;width: 576px;padding-top: 20px;padding-right: 25px;padding-bottom: 20px;padding-left: 25px;">
                            <div class="d-inline-block float-start" style="width: 350px;height: 170px;">
                                <h1 style="font-size: 25px;color: #b20135;font-weight: bold;">Home in Merrick Way</h1>
                                <p>Enchanting three bedroom, three bath…<br></p>
                                <div style="height: 74px;margin-top: 20px;">
                                    <div class="d-inline-block float-start"
                                         style="width: 78px;height: 74px;margin-left: 0px;margin-right: 0px;padding-left: 0px;padding-right: 0px;padding-bottom: 0px;">
                                        <span class="d-table-row"
                                              style="font-size: 15px;font-weight: bold;margin-bottom: 0px;padding-bottom: 0px;">Letti</span>
                                        <div style="width: 78px;height: 30px;padding-top: 0px;"><i class="la la-bed"
                                                                                                   style="font-size: 27px;width: 25px;height: 25px;"></i><span
                                                class="d-inline-block float-end"
                                                style="padding-right: 17px;height: 30px;font-weight: bold;">3</span>
                                        </div>
                                    </div>
                                    <div class="d-inline-block float-start" style="width: 84px;height: 74px;"><span
                                            class="d-table-row"
                                            style="font-size: 15px;font-weight: bold;margin-bottom: 0px;padding-bottom: 0px;">Bagni</span>
                                        <div style="width: 78px;height: 30px;padding-top: 0px;"><i
                                                class="fas fa-shower d-inline-block"
                                                style="font-size: 27px;width: 25px;height: 25px;"></i><span
                                                class="d-inline-block float-end"
                                                style="padding-right: 17px;height: 30px;font-weight: bold;">3</span>
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
                                                style="padding-right: 17px;height: 30px;font-weight: bold;">100</span><span
                                                class="d-inline-block float-start"
                                                style="padding-right: 17px;height: 30px;width: 25.6719px;">mq</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="d-inline-block"
                                 style="width: 1px;height: 170px;border: 1px solid rgba(128,128,128,.2) ;"></div>
                            <div class="float-end"
                                 style="width: 170px;height: 170px;margin-left: 0px;padding-left: 10px;">
                                <div style="height: 75px;"><span>In Vendita</span>
                                    <p style="height: 30px;font-size: 25px;color: #b20135;font-weight: bold;">
                                        €500.000</p>
                                </div>
                                <div style="height: 74px;margin-top: 20px;">
                                    <p style="margin-bottom: 0px;">Di</p>
                                    <p style="margin-bottom: 10px;">Nathan James</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div style="height: 210px;padding-bottom: 20px;background: #ffffff;box-shadow: 0px 0px 20px #dddddd;margin-bottom: 50px;">
                        <article class="d-inline-block float-start" style="height: 210px;">
                            <figure class="figure"
                                    style="background: url(assets/img/Risorsa1-100.jpg) center / cover no-repeat;height: 210px;width: 280px;"></figure>
                        </article>
                        <div class="d-inline-block"
                             style="height: 210px;width: 576px;padding-top: 20px;padding-right: 25px;padding-bottom: 20px;padding-left: 25px;">
                            <div class="d-inline-block float-start" style="width: 350px;height: 170px;">
                                <h1 style="font-size: 25px;color: #b20135;font-weight: bold;">Home in Merrick Way</h1>
                                <p>Enchanting three bedroom, three bath…<br></p>
                                <div style="height: 74px;margin-top: 20px;">
                                    <div class="d-inline-block float-start"
                                         style="width: 78px;height: 74px;margin-left: 0px;margin-right: 0px;padding-left: 0px;padding-right: 0px;padding-bottom: 0px;">
                                        <span class="d-table-row"
                                              style="font-size: 15px;font-weight: bold;margin-bottom: 0px;padding-bottom: 0px;">Letti</span>
                                        <div style="width: 78px;height: 30px;padding-top: 0px;"><i class="la la-bed"
                                                                                                   style="font-size: 27px;width: 25px;height: 25px;"></i><span
                                                class="d-inline-block float-end"
                                                style="padding-right: 17px;height: 30px;font-weight: bold;">3</span>
                                        </div>
                                    </div>
                                    <div class="d-inline-block float-start" style="width: 84px;height: 74px;"><span
                                            class="d-table-row"
                                            style="font-size: 15px;font-weight: bold;margin-bottom: 0px;padding-bottom: 0px;">Bagni</span>
                                        <div style="width: 78px;height: 30px;padding-top: 0px;"><i
                                                class="fas fa-shower d-inline-block"
                                                style="font-size: 27px;width: 25px;height: 25px;"></i><span
                                                class="d-inline-block float-end"
                                                style="padding-right: 17px;height: 30px;font-weight: bold;">3</span>
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
                                                style="padding-right: 17px;height: 30px;font-weight: bold;">100</span><span
                                                class="d-inline-block float-start"
                                                style="padding-right: 17px;height: 30px;width: 25.6719px;">mq</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="d-inline-block" style="width: 1px;height: 170px;"></div>
                            <div class="float-end"
                                 style="width: 170px;height: 170px;margin-left: 0px;padding-left: 10px;">
                                <div style="height: 75px;"><span>In Vendita</span>
                                    <p style="height: 30px;font-size: 25px;color: #b20135;font-weight: bold;">
                                        €500.000</p>
                                </div>
                                <div style="height: 74px;margin-top: 20px;">
                                    <p style="margin-bottom: 0px;">Di</p>
                                    <p style="margin-bottom: 10px;">Nathan James</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div style="height: 210px;padding-bottom: 20px;background: #ffffff;box-shadow: 0px 0px 20px #dddddd;margin-bottom: 50px;">
                        <article class="d-inline-block float-start" style="height: 210px;">
                            <figure class="figure"
                                    style="background: url(assets/img/Risorsa1-100.jpg) center / cover no-repeat;height: 210px;width: 280px;"></figure>
                        </article>
                        <div class="d-inline-block"
                             style="height: 210px;width: 576px;padding-top: 20px;padding-right: 25px;padding-bottom: 20px;padding-left: 25px;">
                            <div class="d-inline-block float-start" style="width: 350px;height: 170px;">
                                <h1 style="font-size: 25px;color: #b20135;font-weight: bold;">Home in Merrick Way</h1>
                                <p>Enchanting three bedroom, three bath…<br></p>
                                <div style="height: 74px;margin-top: 20px;">
                                    <div class="d-inline-block float-start"
                                         style="width: 78px;height: 74px;margin-left: 0px;margin-right: 0px;padding-left: 0px;padding-right: 0px;padding-bottom: 0px;">
                                        <span class="d-table-row"
                                              style="font-size: 15px;font-weight: bold;margin-bottom: 0px;padding-bottom: 0px;">Letti</span>
                                        <div style="width: 78px;height: 30px;padding-top: 0px;"><i class="la la-bed"
                                                                                                   style="font-size: 27px;width: 25px;height: 25px;"></i><span
                                                class="d-inline-block float-end"
                                                style="padding-right: 17px;height: 30px;font-weight: bold;">3</span>
                                        </div>
                                    </div>
                                    <div class="d-inline-block float-start" style="width: 84px;height: 74px;"><span
                                            class="d-table-row"
                                            style="font-size: 15px;font-weight: bold;margin-bottom: 0px;padding-bottom: 0px;">Bagni</span>
                                        <div style="width: 78px;height: 30px;padding-top: 0px;"><i
                                                class="fas fa-shower d-inline-block"
                                                style="font-size: 27px;width: 25px;height: 25px;"></i><span
                                                class="d-inline-block float-end"
                                                style="padding-right: 17px;height: 30px;font-weight: bold;">3</span>
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
                                                style="padding-right: 17px;height: 30px;font-weight: bold;">100</span><span
                                                class="d-inline-block float-start"
                                                style="padding-right: 17px;height: 30px;width: 25.6719px;">mq</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="d-inline-block"
                                 style="width: 1px;height: 170px;border: 1px solid rgba(128,128,128,.2) ;"></div>
                            <div class="float-end"
                                 style="width: 170px;height: 170px;margin-left: 0px;padding-left: 10px;">
                                <div style="height: 75px;"><span>In Vendita</span>
                                    <p style="height: 30px;font-size: 25px;color: #b20135;font-weight: bold;">
                                        €500.000</p>
                                </div>
                                <div style="height: 74px;margin-top: 20px;">
                                    <p style="margin-bottom: 0px;">Di</p>
                                    <p style="margin-bottom: 10px;">Nathan James</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div style="height: 210px;padding-bottom: 20px;background: #ffffff;box-shadow: 0px 0px 20px #dddddd;margin-bottom: 50px;">
                        <article class="d-inline-block float-start" style="height: 210px;">
                            <figure class="figure"
                                    style="background: url(assets/img/Risorsa1-100.jpg) center / cover no-repeat;height: 210px;width: 280px;"></figure>
                        </article>
                        <div class="d-inline-block"
                             style="height: 210px;width: 576px;padding-top: 20px;padding-right: 25px;padding-bottom: 20px;padding-left: 25px;">
                            <div class="d-inline-block float-start" style="width: 350px;height: 170px;">
                                <h1 style="font-size: 25px;color: #b20135;font-weight: bold;">Home in Merrick Way</h1>
                                <p>Enchanting three bedroom, three bath…<br></p>
                                <div style="height: 74px;margin-top: 20px;">
                                    <div class="d-inline-block float-start"
                                         style="width: 78px;height: 74px;margin-left: 0px;margin-right: 0px;padding-left: 0px;padding-right: 0px;padding-bottom: 0px;">
                                        <span class="d-table-row"
                                              style="font-size: 15px;font-weight: bold;margin-bottom: 0px;padding-bottom: 0px;">Letti</span>
                                        <div style="width: 78px;height: 30px;padding-top: 0px;"><i class="la la-bed"
                                                                                                   style="font-size: 27px;width: 25px;height: 25px;"></i><span
                                                class="d-inline-block float-end"
                                                style="padding-right: 17px;height: 30px;font-weight: bold;">3</span>
                                        </div>
                                    </div>
                                    <div class="d-inline-block float-start" style="width: 84px;height: 74px;"><span
                                            class="d-table-row"
                                            style="font-size: 15px;font-weight: bold;margin-bottom: 0px;padding-bottom: 0px;">Bagni</span>
                                        <div style="width: 78px;height: 30px;padding-top: 0px;"><i
                                                class="fas fa-shower d-inline-block"
                                                style="font-size: 27px;width: 25px;height: 25px;"></i><span
                                                class="d-inline-block float-end"
                                                style="padding-right: 17px;height: 30px;font-weight: bold;">3</span>
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
                                                style="padding-right: 17px;height: 30px;font-weight: bold;">100</span><span
                                                class="d-inline-block float-start"
                                                style="padding-right: 17px;height: 30px;width: 25.6719px;">mq</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="d-inline-block"
                                 style="width: 1px;height: 170px;border: 1px solid rgba(128,128,128,.2) ;"></div>
                            <div class="float-end"
                                 style="width: 170px;height: 170px;margin-left: 0px;padding-left: 10px;">
                                <div style="height: 75px;"><span>In Vendita</span>
                                    <p style="height: 30px;font-size: 25px;color: #b20135;font-weight: bold;">
                                        €500.000</p>
                                </div>
                                <div style="height: 74px;margin-top: 20px;">
                                    <p style="margin-bottom: 0px;">Di</p>
                                    <p style="margin-bottom: 10px;">Nathan James</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4" style="height: 2600px;">
                <aside>
                    <div style="height: 1200px;background: #f7f7f7;">
                        <div style="height: 30px;margin-top: -30px;margin-bottom: 0px;">
                            <h1 style="font-size: 25px;margin-bottom: 0px;padding-bottom: 0px;height: 30px;font-weight: bold;">
                                Proprietà in evidenza</h1>
                        </div>
                        <div style="width: 416px;height: 560px;padding-top: 0px;margin: 0px;margin-top: 0px;margin-bottom: 30px;background: #ffffff;box-shadow: 0px 0px 20px #dddddd;">
                            <div class="d-xxl-flex align-items-xxl-end"
                                 style="background: url(assets/img/Risorsa1-100.jpg) no-repeat;background-size: contain;height: 237px;">
                                <div style="padding-top: 0px;width: 420px;">
                                    <div class="text-truncate text-center d-inline-block float-end"
                                         style="height: 70px;padding: 0px;padding-top: 0px;font-size: 40px;padding-left: 0px;width: 160px;margin: 0px;margin-left: 0px;text-align: left;color: rgb(255,255,255);">
                                        <span style="font-size: 20px;color: rgb(255,255,255);background: rgba(0,0,0,0.72);border-radius: 4px;border-width: 0px;padding-left: 2px;padding-bottom: 2px;padding-right: 2px;padding-top: 2px;">In Vendita</span>
                                    </div>
                                </div>
                            </div>
                            <div style="height: 323px;color: rgb(0,0,0);padding: 30px;background: #ffffff;">
                                <h1 style="font-family: Lato, sans-serif;font-size: 19px;font-weight: bold;height: 40px;margin-bottom: 0px;">
                                    Villa in Coral Gables</h1>
                                <div style="height: 21px;"><i class="fa fa-map-marker"
                                                              style="color: rgb(31,121,184);"></i><span
                                        style="color: rgb(31,121,184);text-decoration:  underline;">Nocera Inferiore(SA), ITALIA</span>
                                </div>
                                <div style="height: 20px;"><span style="height: 20px;">Data aggiunta: 02/02/2022</span>
                                </div>
                                <div style="height: 74px;margin-top: 20px;">
                                    <div class="d-inline-block float-start"
                                         style="width: 78px;height: 74px;margin-left: 0px;margin-right: 0px;padding-left: 0px;padding-right: 0px;padding-bottom: 0px;">
                                        <span class="d-table-row"
                                              style="font-size: 15px;font-weight: bold;margin-bottom: 0px;padding-bottom: 0px;">Letti</span>
                                        <div style="width: 78px;height: 30px;padding-top: 0px;"><i class="la la-bed"
                                                                                                   style="font-size: 27px;width: 25px;height: 25px;"></i><span
                                                class="d-inline-block float-end"
                                                style="padding-right: 17px;height: 30px;font-weight: bold;">3</span>
                                        </div>
                                    </div>
                                    <div class="d-inline-block float-start" style="width: 84px;height: 74px;"><span
                                            class="d-table-row"
                                            style="font-size: 15px;font-weight: bold;margin-bottom: 0px;padding-bottom: 0px;">Bagni</span>
                                        <div style="width: 78px;height: 30px;padding-top: 0px;"><i
                                                class="fas fa-shower d-inline-block"
                                                style="font-size: 27px;width: 25px;height: 25px;"></i><span
                                                class="d-inline-block float-end"
                                                style="padding-right: 17px;height: 30px;font-weight: bold;">3</span>
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
                                                style="padding-right: 17px;height: 30px;font-weight: bold;">100</span><span
                                                class="d-inline-block float-start"
                                                style="padding-right: 17px;height: 30px;width: 25.6719px;">mq</span>
                                        </div>
                                    </div>
                                </div>
                                <div style="height: 80px;">
                                    <div class="d-inline-block float-start" style="width: 150px;height: 80px;"><span
                                            class="d-table-row">In vendita</span><span
                                            style="font-size: 30px;color: rgb(178,1,53);font-weight: bold;">€ 100.000</span>
                                    </div>
                                    <div class="d-inline-block float-end d-xxl-flex align-items-xxl-center"
                                         style="width: 87px;height: 80px;"><i
                                            class="fa fa-heart d-inline-block float-start"
                                            style="font-size: 35px;color: rgb(128,128,128);"></i><i
                                            class="material-icons d-inline-block float-end"
                                            style="font-size: 35px;padding-left: 17px;color: rgb(128,128,128);">compare_arrows</i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div style="width: 416px;height: 560px;padding-top: 0px;margin: 0px;margin-top: 0px;margin-bottom: 30px;background: #ffffff;box-shadow: 0px 0px 20px #dddddd;">
                            <div class="d-xxl-flex align-items-xxl-end"
                                 style="background: url(assets/img/Risorsa1-100.jpg) no-repeat;background-size: contain;height: 237px;">
                                <div style="padding-top: 0px;width: 420px;">
                                    <div class="text-truncate text-center d-inline-block float-end"
                                         style="height: 70px;padding: 0px;padding-top: 0px;font-size: 40px;padding-left: 0px;width: 160px;margin: 0px;margin-left: 0px;text-align: left;color: rgb(255,255,255);">
                                        <span style="font-size: 20px;color: rgb(255,255,255);background: rgba(0,0,0,0.72);border-radius: 4px;border-width: 0px;padding-left: 2px;padding-bottom: 2px;padding-right: 2px;padding-top: 2px;">In Vendita</span>
                                    </div>
                                </div>
                            </div>
                            <div style="height: 323px;color: rgb(0,0,0);padding: 30px;background: #ffffff;">
                                <h1 style="font-family: Lato, sans-serif;font-size: 19px;font-weight: bold;height: 40px;margin-bottom: 0px;">
                                    Villa in Coral Gables</h1>
                                <div style="height: 21px;"><i class="fa fa-map-marker"
                                                              style="color: rgb(31,121,184);"></i><span
                                        style="color: rgb(31,121,184);text-decoration:  underline;">Nocera Inferiore(SA), ITALIA</span>
                                </div>
                                <div style="height: 20px;"><span style="height: 20px;">Data aggiunta: 02/02/2022</span>
                                </div>
                                <div style="height: 74px;margin-top: 20px;">
                                    <div class="d-inline-block float-start"
                                         style="width: 78px;height: 74px;margin-left: 0px;margin-right: 0px;padding-left: 0px;padding-right: 0px;padding-bottom: 0px;">
                                        <span class="d-table-row"
                                              style="font-size: 15px;font-weight: bold;margin-bottom: 0px;padding-bottom: 0px;">Letti</span>
                                        <div style="width: 78px;height: 30px;padding-top: 0px;"><i class="la la-bed"
                                                                                                   style="font-size: 27px;width: 25px;height: 25px;"></i><span
                                                class="d-inline-block float-end"
                                                style="padding-right: 17px;height: 30px;font-weight: bold;">3</span>
                                        </div>
                                    </div>
                                    <div class="d-inline-block float-start" style="width: 84px;height: 74px;"><span
                                            class="d-table-row"
                                            style="font-size: 15px;font-weight: bold;margin-bottom: 0px;padding-bottom: 0px;">Bagni</span>
                                        <div style="width: 78px;height: 30px;padding-top: 0px;"><i
                                                class="fas fa-shower d-inline-block"
                                                style="font-size: 27px;width: 25px;height: 25px;"></i><span
                                                class="d-inline-block float-end"
                                                style="padding-right: 17px;height: 30px;font-weight: bold;">3</span>
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
                                                style="padding-right: 17px;height: 30px;font-weight: bold;">100</span><span
                                                class="d-inline-block float-start"
                                                style="padding-right: 17px;height: 30px;width: 25.6719px;">mq</span>
                                        </div>
                                    </div>
                                </div>
                                <div style="height: 80px;">
                                    <div class="d-inline-block float-start" style="width: 150px;height: 80px;"><span
                                            class="d-table-row">In vendita</span><span
                                            style="font-size: 30px;color: rgb(178,1,53);font-weight: bold;">€ 100.000</span>
                                    </div>
                                    <div class="d-inline-block float-end d-xxl-flex align-items-xxl-center"
                                         style="width: 87px;height: 80px;"><i
                                            class="fa fa-heart d-inline-block float-start"
                                            style="font-size: 35px;color: rgb(128,128,128);"></i><i
                                            class="material-icons d-inline-block float-end"
                                            style="font-size: 35px;padding-left: 17px;color: rgb(128,128,128);">compare_arrows</i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </aside>
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
