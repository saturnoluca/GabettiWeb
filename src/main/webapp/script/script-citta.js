
function SbloccaCitta(){
    const wrapper_citta = document.querySelector("#wrapper-citta"),
        selectBtn_citta = wrapper_citta.querySelector("#select-btn-citta"),
        searchInp_citta = wrapper_citta.querySelector("#input-citta"),
        options_citta = wrapper_citta.querySelector("#options-citta");

    let citta = [];

    var valore = document.getElementById("hidden_provincia").value;

    $.post('ScegliCitta', {provincia: valore}, function (listJson) {
        var json = JSON.parse(listJson);
        for (var i = 0; i < json.length; i++) {
            citta.push(json[i].citta);
        }
        addCountryCitta();
    })
    function addCountryCitta(selectedCountry) {
        options_citta.innerHTML = "";
        citta.forEach(country => {
            let isSelected = country == selectedCountry ? "selected" : "";
            let li = `<li onclick="updateNameCitta(this)" class="${isSelected}">${country}</li>`;
            options_citta.insertAdjacentHTML("beforeend", li);
        });
    }

    searchInp_citta.addEventListener("keyup", () => {
        let arr = [];
        let searchWord = searchInp_citta.value.toLowerCase();
        arr = citta.filter(data => {
            return data.toLowerCase().startsWith(searchWord);
        }).map(data => {
            let isSelected = data == selectBtn_citta.firstElementChild.innerText ? "selected" : "";
            return `<li onclick="updateNameCitta(this)" class="${isSelected}">${data}</li>`;
        }).join("");
        options_citta.innerHTML = arr ? arr : `<p style="margin-top: 10px;">Oops! Country not found</p>`;
    });
};

function apriCitta(){
    var w_regione = document.getElementById("wrapper-regione");
    var w_provincia = document.getElementById("wrapper-provincia");
    var w_citta = document.getElementById("wrapper-citta");
    w_citta.classList.toggle("active");
    w_regione.classList.remove("active");
    w_provincia.classList.remove("active");
}

function updateNameCitta(selectedLi) {
    var input_citta = document.getElementById("input-citta");
    var w_citta = document.getElementById("wrapper-citta");
    var btn_citta = document.getElementById("select-btn-citta");
    input_citta.value = "";
    w_citta.classList.remove("active");
    btn_citta.firstElementChild.innerText = selectedLi.innerText;
    document.getElementById("hidden_citta").value = selectedLi.innerText;
    $("#cap").attr("disabled", false);
    document.getElementById("cap").value="";
    document.getElementById("indirizzo").value="";
    document.getElementById("numeroCivico").value="";
    document.getElementById("zona").value="";
}

function rimuoviNameCitta() {
    var input_citta = document.getElementById("input-citta");
    var w_citta = document.getElementById("wrapper-citta");
    var btn_citta = document.getElementById("select-btn-citta");
    input_citta.value = "";
    w_citta.classList.remove("active");
    btn_citta.firstElementChild.innerText = "Seleziona Città";
    document.getElementById("hidden_citta").value = "";
    SbloccaCitta();
    $("#cap").attr("disabled", true);
}

function apriIndirizzo(){
    if(document.getElementById("cap").value !=""){
        $("#indirizzo").attr("disabled", false);
    }else{
        $("#indirizzo").attr("disabled", true);
    }
}

function apriNumeroCivico(){
    if(document.getElementById("indirizzo").value !=""){
        $("#numeroCivico").attr("disabled", false);
    }else{
        $("#numeroCivico").attr("disabled", true);
    }
}

function apriZona(){
    if(document.getElementById("numeroCivico").value !=""){
        $("#zona").attr("disabled", false);
    }else{
        $("#zona").attr("disabled", true);
    }
}

$( document ).ready(function() {
    var regione = document.getElementById("hidden_regione");
    var provincia = document.getElementById("hidden_provincia");
    var citta = document.getElementById("hidden_citta");

    if(regione != "" && provincia != "" && citta != ""){
        $("#cap").attr("disabled", false);
        $("#indirizzo").attr("disabled", false);
        $("#numeroCivico").attr("disabled", false);
        $("#zona").attr("disabled", false);
    }
});