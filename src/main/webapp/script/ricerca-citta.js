
function SbloccaCitta(){
    const wrapper_citta = document.querySelector("#wrapper-citta"),
        selectBtn_citta = wrapper_citta.querySelector("#select-btn-citta"),
        searchInp_citta = wrapper_citta.querySelector("#input-citta"),
        options_citta = wrapper_citta.querySelector("#options-citta");

    let citta = [];
    var valore1 = document.getElementById("hidden-regione").value;
    var valore2 = document.getElementById("hidden-provincia").value;

    $.post('CampiRicerca?action=citta&regione='+valore1, {provincia: valore2}, function (listJson) {
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
    var w_città = document.getElementById("wrapper-citta");
    var w_zona = document.getElementById("wrapper-zona");
    var w_stato = document.getElementById("wrapper-stato");
    var w_tipo = document.getElementById("wrapper-tipo");
    var w_camera = document.getElementById("wrapper-minCamere");
    var w_bagno = document.getElementById("wrapper-minBagni");
    var w_auto = document.getElementById("wrapper-minAuto");
    w_regione.classList.remove("active");
    w_provincia.classList.remove("active");
    w_città.classList.toggle("active");
    w_zona.classList.remove("active");
    w_stato.classList.remove("active");
    w_tipo.classList.remove("active");
    w_camera.classList.remove("active");
    w_bagno.classList.remove("active");
    w_auto.classList.remove("active");
    SbloccaCitta();
}

function updateNameCitta(selectedLi) {
    var input_citta = document.getElementById("input-citta");
    var w_citta = document.getElementById("wrapper-citta");
    var btn_citta = document.getElementById("select-btn-citta");
    input_citta.value = "";
    w_citta.classList.remove("active");
    btn_citta.firstElementChild.innerText = selectedLi.innerText;
    document.getElementById("hidden-citta").value = selectedLi.innerText;
    rimuoviNameZona();
}

function rimuoviNameCitta() {
    var input_citta = document.getElementById("input-citta");
    var w_citta = document.getElementById("wrapper-citta");
    var btn_citta = document.getElementById("select-btn-citta");
    input_citta.value = "";
    w_citta.classList.remove("active");
    btn_citta.firstElementChild.innerText = "Qualsiasi";
    document.getElementById("hidden-citta").value = "Qualsiasi";
    SbloccaCitta();
}

