
function SbloccaProvincia(){

    const wrapper_provincia = document.querySelector("#wrapper-provincia"),
        selectBtn_provincia = wrapper_provincia.querySelector("#select-btn-provincia"),
        searchInp_provincia = wrapper_provincia.querySelector("#input-provincia"),
        options_provincia = wrapper_provincia.querySelector("#options-provincia");

    let province = [];

    var valore = document.getElementById("hidden_regione").value;
    $.post('ScegliProvincia', {regione: valore}, function (listJson) {
        var json = JSON.parse(listJson);
        for (var i = 0; i < json.length; i++) {

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
    var w_citta = document.getElementById("wrapper-citta");
    w_provincia.classList.toggle("active");
    w_citta.classList.remove("active");
    w_regione.classList.remove("active");
}

function updateNameProvincia(selectedLi) {
    var input_provincia = document.getElementById("input-provincia");
    var w_provincia = document.getElementById("wrapper-provincia");
    var btn_provincia = document.getElementById("select-btn-provincia");
    input_provincia.value = "";
    w_provincia.classList.remove("active");
    btn_provincia.firstElementChild.innerText = selectedLi.innerText;
    document.getElementById("hidden_provincia").value = selectedLi.innerText;
    rimuoviNameCitta();
    document.getElementById("cap").value="";
    document.getElementById("indirizzo").value="";
    document.getElementById("numeroCivico").value="";
    document.getElementById("zona").value="";
}

function rimuoviNameProvincia() {
    var input_provincia = document.getElementById("input-provincia");
    var w_provincia = document.getElementById("wrapper-provincia");
    var btn_provincia = document.getElementById("select-btn-provincia");
    input_provincia.value = "";
    w_provincia.classList.remove("active");
    btn_provincia.firstElementChild.innerText = "Seleziona Provincia";
    document.getElementById("hidden_provincia").value = "";
    SbloccaProvincia();
}
