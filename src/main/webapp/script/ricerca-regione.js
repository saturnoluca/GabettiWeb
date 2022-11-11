$(document).ready(function() {
    const wrapper_regione = document.querySelector("#wrapper-regione"),
        selectBtn_regione = wrapper_regione.querySelector("#select-btn-regione"),
        searchInp_regione = wrapper_regione.querySelector("#input-regione"),
        options_regione = wrapper_regione.querySelector("#options-regione");

    let regioni = [];
    $.post('CampiRicerca?action=regione', function (listJson) {
        var json = JSON.parse(listJson);
        for (var i = 0; i < json.length; i++) {
            regioni.push(json[i].regione);
        }
        addCountryRegione();
    })

    function addCountryRegione(selectedCountry) {
        options_regione.innerHTML = "";
        regioni.forEach(country => {
            let isSelected = country == selectedCountry ? "selected" : "";
            let li = `<li onclick="updateNameRegione(this)" class="${isSelected}">${country}</li>`;
            options_regione.insertAdjacentHTML("beforeend", li);
        });
    }

    searchInp_regione.addEventListener("keyup", () => {
        let arr = [];
        let searchWord = searchInp_regione.value.toLowerCase();
        arr = regioni.filter(data => {
            return data.toLowerCase().startsWith(searchWord);
        }).map(data => {
            let isSelected = data == selectBtn_regione.firstElementChild.innerText ? "selected" : "";
            return `<li onclick="updateNameRegione(this)" class="${isSelected}">${data}</li>`;
        }).join("");
        options_regione.innerHTML = arr ? arr : `<p style="margin-top: 10px;">Oops! Country not found</p>`;
    });

});

function apriRegione(){
    var w_regione = document.getElementById("wrapper-regione");
    var w_provincia = document.getElementById("wrapper-provincia");
    var w_città = document.getElementById("wrapper-citta");
    var w_zona = document.getElementById("wrapper-zona");
    var w_stato = document.getElementById("wrapper-stato");
    var w_tipo = document.getElementById("wrapper-tipo");
    var w_camera = document.getElementById("wrapper-minCamere");
    var w_bagno = document.getElementById("wrapper-minBagni");
    var w_auto = document.getElementById("wrapper-minAuto");
    w_regione.classList.toggle("active");
    w_provincia.classList.remove("active");
    w_città.classList.remove("active");
    w_zona.classList.remove("active");
    w_stato.classList.remove("active");
    w_tipo.classList.remove("active");
    w_camera.classList.remove("active");
    w_bagno.classList.remove("active");
    w_auto.classList.remove("active");
}

function updateNameRegione(selectedLi) {
    var input_regione = document.getElementById("input-regione");
    var w_regione = document.getElementById("wrapper-regione");
    var btn_regione = document.getElementById("select-btn-regione");
    w_regione.classList.remove("active");
    input_regione.value = "";
    btn_regione.firstElementChild.innerText = selectedLi.innerText;
    document.getElementById("hidden-regione").value = selectedLi.innerText;
    rimuoviNameProvincia();
    rimuoviNameCitta();
}
