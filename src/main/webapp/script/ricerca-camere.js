
function SbloccaMinCamere(){
    const wrapper_minCamere = document.querySelector("#wrapper-minCamere"),
        selectBtn_minCamere = wrapper_minCamere.querySelector("#select-btn-minCamere"),
        searchInp_minCamere = wrapper_minCamere.querySelector("#input-minCamere"),
        options_minCamere = wrapper_minCamere.querySelector("#options-minCamere");

    let camere = [];


    $.post('CampiRicerca', {action: "minCamere"}, function (listJson) {
        var json = JSON.parse(listJson);
        for (var i = 0; i < json.length; i++) {
            camere.push(json[i].minCamere);
        }
        addMinCamere();
    })
    function addMinCamere(selectedMinCamere) {
        options_minCamere.innerHTML = "";
        camere.forEach(minCamere => {
            let isSelected = minCamere == selectedMinCamere ? "selected" : "";
            let li = `<li onclick="updateNameMinCamere(this)" class="${isSelected}">${minCamere}</li>`;
            options_minCamere.insertAdjacentHTML("beforeend", li);
        });
    }

    searchInp_minCamere.addEventListener("keyup", () => {
        let arr = [];
        let searchWord = searchInp_minCamere.value.toLowerCase();
        arr = camere.filter(data => {
            return data.toLowerCase().startsWith(searchWord);
        }).map(data => {
            let isSelected = data == selectBtn_minCamere.firstElementChild.innerText ? "selected" : "";
            return `<li onclick="updateNameMinCamere(this)" class="${isSelected}">${data}</li>`;
        }).join("");
        options_minCamere.innerHTML = arr ? arr : `<p style="margin-top: 10px;">Oops! minCamere not found</p>`;
    });
};

function apriMinCamere(){
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
    w_camera.classList.toggle("active");
    w_bagno.classList.remove("active");
    w_auto.classList.remove("active");
    SbloccaMinCamere();
}

function updateNameMinCamere(selectedLi) {
    var input_minCamere = document.getElementById("input-minCamere");
    var w_minCamere = document.getElementById("wrapper-minCamere");
    var btn_minCamere = document.getElementById("select-btn-minCamere");
    input_minCamere.value = "";
    w_minCamere.classList.remove("active");
    btn_minCamere.firstElementChild.innerText = selectedLi.innerText;
    document.getElementById("hidden-minCamere").value = selectedLi.innerText;
}

