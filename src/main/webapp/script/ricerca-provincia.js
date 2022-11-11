
function SbloccaProvincia(){
    console.log("provincia");
    const wrapper_provincia = document.querySelector("#wrapper-provincia"),
        selectBtn_provincia = wrapper_provincia.querySelector("#select-btn-provincia"),
        searchInp_provincia = wrapper_provincia.querySelector("#input-provincia"),
        options_provincia = wrapper_provincia.querySelector("#options-provincia");

    let province = [];

    var valore = document.getElementById("hidden-regione").value;
    $.post('CampiRicerca?action=provincia', {regione: valore}, function (listJson) {
        var json = JSON.parse(listJson);
        for (var i = 0; i < json.length; i++) {
            console.log(json[i].provincia);
            province.push(json[i].provincia);
        }
        addCountryProvincia();
    })
    function addCountryProvincia(selectedCountry) {
        options_provincia.innerHTML = "";
        province.forEach(country => {
            let isSelected = country == selectedCountry ? "selected" : "";
            let li = `<li onclick="updateNameProvincia(this)" class="${isSelected}">${country}</li>`;
            options_provincia.insertAdjacentHTML("beforeend", li);
        });
    }

    searchInp_provincia.addEventListener("keyup", () => {
        let arr = [];
        let searchWord = searchInp_provincia.value.toLowerCase();
        arr = province.filter(data => {
            return data.toLowerCase().startsWith(searchWord);
        }).map(data => {
            let isSelected = data == selectBtn_provincia.firstElementChild.innerText ? "selected" : "";
            return `<li onclick="updateNameProvincia(this)" class="${isSelected}">${data}</li>`;
        }).join("");
        options_provincia.innerHTML = arr ? arr : `<p style="margin-top: 10px;">Oops! Country not found</p>`;
    });
};

function apriProvincia(){
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
    w_provincia.classList.toggle("active");
    w_città.classList.remove("active");
    w_zona.classList.remove("active");
    w_stato.classList.remove("active");
    w_tipo.classList.remove("active");
    w_camera.classList.remove("active");
    w_bagno.classList.remove("active");
    w_auto.classList.remove("active");
    SbloccaProvincia();
}

function updateNameProvincia(selectedLi) {
    var input_provincia = document.getElementById("input-provincia");
    var w_provincia = document.getElementById("wrapper-provincia");
    var btn_provincia = document.getElementById("select-btn-provincia");
    input_provincia.value = "";
    w_provincia.classList.remove("active");
    btn_provincia.firstElementChild.innerText = selectedLi.innerText;
    document.getElementById("hidden-provincia").value = selectedLi.innerText;
    rimuoviNameCitta();
}

function rimuoviNameProvincia() {
    var input_provincia = document.getElementById("input-provincia");
    var w_provincia = document.getElementById("wrapper-provincia");
    var btn_provincia = document.getElementById("select-btn-provincia");
    input_provincia.value = "";
    w_provincia.classList.remove("active");
    btn_provincia.firstElementChild.innerText = "Qualsiasi";
    document.getElementById("hidden-provincia").value = "Qualsiasi";
    SbloccaProvincia();
}
