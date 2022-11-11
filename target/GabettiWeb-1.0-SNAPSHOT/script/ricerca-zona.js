
function SbloccaZona(){
    const wrapper_zona = document.querySelector("#wrapper-zona"),
        selectBtn_zona = wrapper_zona.querySelector("#select-btn-zona"),
        searchInp_zona = wrapper_zona.querySelector("#input-zona"),
        options_zona = wrapper_zona.querySelector("#options-zona");

    let zona = [];
    var valore = document.getElementById("hidden-citta").value;


    $.post('CampiRicerca?action=zona', {citta: valore}, function (listJson) {
        var json = JSON.parse(listJson);
        for (var i = 0; i < json.length; i++) {
            zona.push(json[i].zona);
        }
        addCountryZona();
    })
    function addCountryZona(selectedCountry) {
        options_zona.innerHTML = "";
        zona.forEach(country => {
            let isSelected = country == selectedCountry ? "selected" : "";
            let li = `<li onclick="updateNameZona(this)" class="${isSelected}">${country}</li>`;
            options_zona.insertAdjacentHTML("beforeend", li);
        });
    }

    searchInp_zona.addEventListener("keyup", () => {
        let arr = [];
        let searchWord = searchInp_zona.value.toLowerCase();
        arr = zona.filter(data => {
            return data.toLowerCase().startsWith(searchWord);
        }).map(data => {
            let isSelected = data == selectBtn_zona.firstElementChild.innerText ? "selected" : "";
            return `<li onclick="updateNameZona(this)" class="${isSelected}">${data}</li>`;
        }).join("");
        options_zona.innerHTML = arr ? arr : `<p style="margin-top: 10px;">Oops! Country not found</p>`;
    });
};

function apriZona(){
    var w_regione = document.getElementById("wrapper-regione");
    var w_provincia = document.getElementById("wrapper-provincia");
    var w_città = document.getElementById("wrapper-citta");
    var w_zona = document.getElementById("wrapper-zona");
    var w_stato = document.getElementById("wrapper-stato");
    var w_tipo = document.getElementById("wrapper-tipo");
    var w_camera = document.getElementById("wrapper-minCamere");
    var w_bagno = document.getElementById("wrapper-minBagni");
    var w_auto = document.getElementById("wrapper-minAuto");
    w_zona.classList.toggle("active");
    w_regione.classList.remove("active");
    w_provincia.classList.remove("active");
    w_città.classList.remove("active");
    w_stato.classList.remove("active");
    w_tipo.classList.remove("active");
    w_camera.classList.remove("active");
    w_bagno.classList.remove("active");
    w_auto.classList.remove("active");
    SbloccaZona();
}

function updateNameZona(selectedLi) {
    var input_zona = document.getElementById("input-zona");
    var w_zona = document.getElementById("wrapper-zona");
    var btn_zona = document.getElementById("select-btn-zona");
    input_zona.value = "";
    w_zona.classList.remove("active");
    btn_zona.firstElementChild.innerText = selectedLi.innerText;
    document.getElementById("hidden-zona").value = selectedLi.innerText;
}

function rimuoviNameZona() {
    var input_zona = document.getElementById("input-zona");
    var w_zona = document.getElementById("wrapper-zona");
    var btn_zona = document.getElementById("select-btn-zona");
    input_zona.value = "";
    w_zona.classList.remove("active");
    btn_zona.firstElementChild.innerText = "Qualsiasi";
    document.getElementById("hidden-zona").value = "Qualsiasi";
    SbloccaZona();
}

