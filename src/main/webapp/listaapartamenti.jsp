<%--
  Created by IntelliJ IDEA.
  User: Luca
  Date: 17/03/2022
  Time: 12:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!-- Created By CodingLab - www.codinglabweb.com -->
<html lang="en" dir="ltr">
<head>
    <meta charset="utf-8">
    <!--------- <title>Responsive Navigation Menu</title>------>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/listaappartamenti.css">


    <link rel="stylesheet" href="icomoon/style.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">

    <link rel="stylesheet" href="icomoon/style.css">

    <link rel="stylesheet" href="bootstrapcss/owl.carousel.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
</head>
<body>
<nav id="navbar">
    <div class="logo">Gabetti</div>
    <input type="checkbox" id="click">
    <label for="click" class="menu-btn">
        <i class="icon-bars"></i>
    </label>
    <ul>
        <li><a href="index.html">Home</a></li>
        <li><a href="#">Lista Immobili</a></li>
        <li><a class="active"href="valutazione.html">Valutazione Immobile</a></li>
        <li><a href="listaagenti.html">I Nostri Agenti</a></li>
        <li><a href="contact.html">Contattaci</a></li>
    </ul>
</nav>
<div class="content">
    <section class="banner" style="background-image: url(images/banner.jpg); background-position: center 0%;">
        <div class="banner_wrap">
            <h1 class="banner_title">Valutazione immobile</h1>
        </div>
    </section>
    <div class="div_search div_search_init">
        <form class="search_form search_form_header advance_search_form">
            <div class="search_fields">
                <div class="search_wrap search_data">
                    <div class="top_fields">
                        <div class="search_select search_option">
                            <label>Località</label>
                            <span class="search_selectwrap">
                    <div class="bootstrap-select picker trigger" style="width: 100%;">
                      <button type="button" class="btn dropdown-toggle" onclick="myFunction()">
                        <div class="filter-option">
                          <div class="filter-option-inner">
                            <div id="valore_localita" class="filter-option-text">
                              Tutte le località
                            </div>
                          </div>
                        </div>
                      </button>
                      <div id="myDropdown" class="dropdown-content">
                        <ul class="ul_inner">
                          <li>
                              <a onclick="cambia(this)" role="option" href="#">
                                <span class="icon-check check_mark"></span>
                                <span class="text">Sarno</span>
                              </a>
                          </li>
                          <li>
                            <a onclick="cambia(this)" role="option" href="#">
                              <span class="icon-check check_mark"></span>
                              <span class="sublist text">- Episcopio</span>
                            </a>
                          </li>
                          <li>
                            <a role="option" href="#">
                              <span class="icon-check check_mark"></span>
                              <span class="sublist text">- Lavorate</span>
                            </a>
                          </li>
                          <li>
                            <a role="option" href="#">
                              <span class="icon-check check_mark"></span>
                              <span class="sublist text">- Foce</span>
                            </a>
                          </li>
                          <li class="li_selected">
                            <a role="option" href="#">
                              <span class="icon-check check_mark"></span>
                              <span class="text">Nocera</span>
                            </a>
                        </li>
                        <li>
                          <a role="option" href="#">
                            <span class="icon-check check_mark"></span>
                            <span class="sublist text">- Corso Vecchio</span>
                          </a>
                        </li>
                        <li>
                          <a role="option" href="#">
                            <span class="icon-check check_mark"></span>
                            <span class="sublist text">- Corso Nuovo</span>
                          </a>
                        </li>
                        <li>
                          <a role="option" href="#">
                            <span class="icon-check check_mark"></span>
                            <span class="sublist text">- Piazza</span>
                          </a>
                        </li>
                      </ul>
                      </div>
                    </div>
                  </span>
                        </div>
                        <div class="search_select search_option">
                            <label>Stato Proprietà</label>
                            <span class="search_selectwrap">
                    <div class="dropdown bootstrap-select picker trigger" style="width: 100%;">
                      <button type="button" class="btn dropdown-toggle" data-toggle="dropdown" role="combobox">
                        <div class="filter-option">
                          <div class="filter-option-inner">
                            <div class="filter-option-text">
                              Tutte le località
                            </div>
                          </div>
                        </div>
                      </button>
                    </div>
                  </span>
                        </div>
                        <div class="search_select search_option">
                            <label>Tipo Proprietà</label>
                            <span class="search_selectwrap">
                    <div class="dropdown bootstrap-select picker trigger" style="width: 100%;">
                      <button type="button" class="btn dropdown-toggle" data-toggle="dropdown" role="combobox">
                        <div class="filter-option">
                          <div class="filter-option-inner">
                            <div class="filter-option-text">
                              Tutte le località
                            </div>
                          </div>
                        </div>
                      </button>
                    </div>
                  </span>
                        </div>
                    </div>
                    <div id="advanced_option_div"class="form_collapsed_field_wrapper" style="display: none;">
                        <div class="collapsed_field_container search_advanced_fields">
                            <div class="search_option search_select search_beds">
                                <label>Min camere da letto</label>
                                <div class="dropdown bootstrap-select picker trigger" style="width: 100%;">
                                    <button type="button" class="btn dropdown-toggle" data-toggle="dropdown" role="combobox">
                                        <div class="filter-option">
                                            <div class="filter-option-inner">
                                                <div class="filter-option-text">
                                                    Tutte le località
                                                </div>
                                            </div>
                                        </div>
                                    </button>
                                    <div id="myDropdown2" class="dropdown-content">
                                        <ul class="ul_inner">
                                            <li class="li_selected">
                                                <a href="#">
                                                    <span class="icon-check check_mark"></span>
                                                    <span class="text">Sarno</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <span class="sublist text">- Episcopio</span>
                                                    <span class="icon-check check_mark"></span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <span class="icon-check check_mark"></span>
                                                    <span class="sublist text">- Lavorate</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <span class="icon-check check_mark"></span>
                                                    <span class="sublist text">- Foce</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="search_option search_select search_beds">
                                <label>Min bagni</label>
                                <div class="dropdown bootstrap-select picker trigger" style="width: 100%;">
                                    <button type="button" class="btn dropdown-toggle" data-toggle="dropdown" role="combobox">
                                        <div class="filter-option">
                                            <div class="filter-option-inner">
                                                <div class="filter-option-text">
                                                    Tutte le località
                                                </div>
                                            </div>
                                        </div>
                                    </button>
                                </div>
                            </div>
                            <div class="search_option search_select search_beds">
                                <label>Prezzo minimo</label>
                                <div class="dropdown bootstrap-select picker trigger" style="width: 100%;">
                                    <button type="button" class="btn dropdown-toggle" data-toggle="dropdown" role="combobox">
                                        <div class="filter-option">
                                            <div class="filter-option-inner">
                                                <div class="filter-option-text">
                                                    Tutte le località
                                                </div>
                                            </div>
                                        </div>
                                    </button>
                                </div>
                            </div>
                            <div class="search_option search_select search_beds">
                                <label>Prezzo massimo</label>
                                <div class="dropdown bootstrap-select picker trigger" style="width: 100%;">
                                    <button type="button" class="btn dropdown-toggle" data-toggle="dropdown" role="combobox">
                                        <div class="filter-option">
                                            <div class="filter-option-inner">
                                                <div class="filter-option-text">
                                                    Tutte le località
                                                </div>
                                            </div>
                                        </div>
                                    </button>
                                </div>
                            </div>
                            <div class="search_option search_select search_beds">
                                <label>Garage</label>
                                <div class="dropdown bootstrap-select picker trigger" style="width: 100%;">
                                    <button type="button" class="btn dropdown-toggle" data-toggle="dropdown" role="combobox">
                                        <div class="filter-option">
                                            <div class="filter-option-inner">
                                                <div class="filter-option-text">
                                                    Tutte le località
                                                </div>
                                            </div>
                                        </div>
                                    </button>
                                </div>
                            </div>
                            <div class="search_option search_select search_beds">
                                <label>Agenti</label>
                                <div class="dropdown bootstrap-select picker trigger" style="width: 100%;">
                                    <button type="button" class="btn dropdown-toggle" data-toggle="dropdown" role="combobox">
                                        <div class="filter-option">
                                            <div class="filter-option-inner">
                                                <div class="filter-option-text">
                                                    Tutte le località
                                                </div>
                                            </div>
                                        </div>
                                    </button>
                                </div>
                            </div>
                            <div class="search_option search_select search_beds">
                                <label>Superificie minima</label>
                                <div class="dropdown bootstrap-select picker trigger" style="width: 100%;">
                                    <button type="button" class="btn dropdown-toggle" data-toggle="dropdown" role="combobox">
                                        <div class="filter-option">
                                            <div class="filter-option-inner">
                                                <div class="filter-option-text">
                                                    Tutte le località
                                                </div>
                                            </div>
                                        </div>
                                    </button>
                                </div>
                            </div>
                            <div class="search_option search_select search_beds">
                                <label>Superficie massima</label>
                                <div class="dropdown bootstrap-select picker trigger" style="width: 100%;">
                                    <button type="button" class="btn dropdown-toggle" data-toggle="dropdown" role="combobox">
                                        <div class="filter-option">
                                            <div class="filter-option-inner">
                                                <div class="filter-option-text">
                                                    Tutte le località
                                                </div>
                                            </div>
                                        </div>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="search_button">
                <div class="search_buttonwrap">
                    <div class="search_advance">
                        <button type="button" onclick="advancedOption()" id="advanced_options"class="search_advance_button">
                            <i class="icon-search-plus"></i>
                        </button>
                    </div>
                    <div class="search_buttonSubmit">
                        <button class="submit button_search">
                            <i class="icon-search"></i>
                            <span>Cerca</span>
                        </button>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <div class="section_map">
        <div id="map_head">
            <iframe id="map" allowfullscreen frameborder="0" loading="lazy" src="https://www.google.com/maps/embed/v1/place?key=AIzaSyCghlu8qhmsmptec4eSidg5APpA57lCPlU&q=Gabetti+nocera+inferiore&zoom=17" width="100%" height="600px"></iframe>
        </div>
    </div>
    <section class="section_properties_search">
        <div class="page_list_properties">
            <div class="list_properties_head">
                <div class="list_properties_controls">
                    <div class="sort_controls">
                        <select>
                            <option>Default</option>
                            <option>Prezzo Crescente</option>
                            <option>Prezzo Decrescente</option>
                            <option>Vecchio a Nuovo</option>
                            <option>Nuovo a Vecchio</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="page_listing">
                <div class="list_card">
                    <div class="list_card_wrap">
                        <figure class="list_card_picture">
                            <div class="figure_property">
                                <a href="">
                                    <div class="post_picture" style="background:url(images/prova.jpg) 50% 50% no-repeat; background-size: cover;"></div>
                                </a>
                            </div>
                        </figure>
                        <div class="list_card_details_wrap">
                            <div class="list_card_details">
                                <h3>
                                    <a href="">Casa a Nocera Inferiore</a>
                                </h3>
                                <p class="list_card_description">Casa bella</p>
                                <div class="list_card_meta_wrap">
                                    <div class="list_card_meta_style">
                                        <div class="list_card_meta">
                                            <span class="meta_tile">Camere</span>
                                            <div class="meta_icon_wrapper">
                                                <i class="icon-bed"></i>
                                                <span class="figure">3</span>
                                            </div>
                                        </div>
                                        <div class="list_card_meta">
                                            <span class="meta_tile">Bagni</span>
                                            <div class="meta_icon_wrapper">
                                                <i class="icon-shower"></i>
                                                <span class="figure">3</span>
                                            </div>
                                        </div>
                                        <div class="list_card_meta">
                                            <span class="meta_tile">Superficie</span>
                                            <div class="meta_icon_wrapper">
                                                <i class="icon-square-o"></i>
                                                <span class="figure">300</span>
                                                <span class="figure">mq</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list_card_priceLabel">
                                <div class="list_card_price">
                                    <span class="status">In vendita</span>
                                    <p class="price">€500.000</p>
                                </div>
                                <p class="list_card_agent">
                                    Di&nbsp;
                                    <span class="agent">Gaetano De Filippo</span>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="pagination">
                <a href="" class="pagination_btn current">1</a>
                <a href="" class="pagination_btn">2</a>
                <a href="" class="pagination_btn">3</a>
            </div>
        </div>
        <div class="page_sidebar">
            <div class="sidebar">
                <section class="widget clearfix">
                    <h3 class="title">Agenti</h3>
                    <div class="agents_list_widget">
                        <article class="agent_list_item clearfix">
                            <figure class="agent_picture">
                                <a href=""><img src="images/agente.jpg"></a>
                            </figure>
                            <div class="agent_widget_content">
                                <h4 class="agent_name">
                                    <a href="">Gaetano De Filippo</a>
                                </h4>
                                <a href="" class="agent_email">example@gmail.com</a>
                                <div class="agent_number">
                                    <a href="">3312294330</a>
                                </div>
                            </div>
                        </article>
                        <article class="agent_list_item clearfix">
                            <figure class="agent_picture">
                                <a href=""><img src="images/agente.jpg"></a>
                            </figure>
                            <div class="agent_widget_content">
                                <h4 class="agent_name">
                                    <a href="">Gaetano De Filippo</a>
                                </h4>
                                <a href="" class="agent_email">example@gmail.com</a>
                                <div class="agent_number">
                                    <a href="">3312294330</a>
                                </div>
                            </div>
                        </article>
                        <article class="agent_list_item clearfix">
                            <figure class="agent_picture">
                                <a href=""><img src="images/agente.jpg"></a>
                            </figure>
                            <div class="agent_widget_content">
                                <h4 class="agent_name">
                                    <a href="">Gaetano De Filippo</a>
                                </h4>
                                <a href="" class="agent_email">example@gmail.com</a>
                                <div class="agent_number">
                                    <a href="">3312294330</a>
                                </div>
                            </div>
                        </article>
                    </div>
                </section>
            </div>
        </div>
    </section>
</div>

<script>
    /* When the user clicks on the button,
    toggle between hiding and showing the dropdown content */
    function myFunction() {
        document.getElementById("myDropdown").classList.toggle("show");
    }

    function cambia(elem) {
        var text = elem.children[1];
        var div = document.getElementById("valore_localita");
        if(elem.classList.contains("li_selected")){
            elem.classList.remove("li_selected")
            var oldWord = div.innerHTML;
            console.log(oldWord);
            console.log(text.innerHTML);
            console.log("risultato: " + oldWord.replace(text.innerHTML,""));
            var newWord = oldWord.replace(text.innerHTML,"");
            console.log("sss" + newWord);
            div.innerHTML = newWord;
            console.log("a"+newWord+"a");
            if(newWord.includes(" ") && newWord.length < 3){
                div.innerHTML = "Tutte le località";
            }
        }
        else{
            elem.classList.add("li_selected");
            if(div.textContent.includes("Tutte le località")){
                console.log("Sium");
                div.innerHTML = text.innerHTML;
            }
            if(div.textContent.includes(text.innerHTML)){
                console.log("Sium");
                div.innerHTML = text.innerHTML;
            }
            else{
                div.innerHTML = div.innerHTML + " " + text.innerHTML;
            }
        }
    }




</script>

<script src="script/valutazione.js"></script>
<script src="script/index.js"></script>
<script src="bootstrap/js/jquery-3.3.1.min.js"></script>
<script src="bootstrap/js/popper.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="bootstrap/js/jquery.sticky.js"></script>
</body>
</html>

