function advancedOption(){
    var w_regione = document.getElementById("wrapper-regione");
    var w_provincia = document.getElementById("wrapper-provincia");
    var w_città = document.getElementById("wrapper-citta");
    var w_zona = document.getElementById("wrapper-zona");
    var w_stato = document.getElementById("wrapper-stato");
    var w_tipo = document.getElementById("wrapper-tipo");
    var w_camera = document.getElementById("wrapper-minCamere");
    var w_bagno = document.getElementById("wrapper-minBagni");
    var w_auto = document.getElementById("wrapper-minAuto");
    w_regione.classList.remove("active");
    w_provincia.classList.remove("active");
    w_città.classList.remove("active");
    w_zona.classList.remove("active");
    w_stato.classList.remove("active");
    w_tipo.classList.remove("active");
    w_camera.classList.remove("active");
    w_bagno.classList.remove("active");
    w_auto.classList.remove("active");
    if(document.getElementById("advanced_option_div").style.display == "none"){
        $('#advanced_option_div').slideDown();
    }
    else{
        $('#advanced_option_div').slideUp();
    }

}