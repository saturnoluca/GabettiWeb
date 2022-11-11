
function SbloccaTipo(){
    const wrapper_tipo = document.querySelector("#wrapper-tipo"),
        selectBtn_tipo = wrapper_tipo.querySelector("#select-btn-tipo"),
        searchInp_tipo = wrapper_tipo.querySelector("#input-tipo"),
        options_tipo = wrapper_tipo.querySelector("#options-tipo");

    let tipi = [];


    $.post('CampiRicerca', {action: "tipo"}, function (listJson) {
        var json = JSON.parse(listJson);
        for (var i = 0; i < json.length; i++) {
            tipi.push(json[i].tipo);
        }
        addTipo();
    })
    function addTipo(selectedTipo) {
        options_tipo.innerHTML = "";
        tipi.forEach(tipo => {
            let isSelected = tipo == selectedTipo ? "selected" : "";
            let li = `<li onclick="updateNameTipo(this)" class="${isSelected}">${tipo}</li>`;
            options_tipo.insertAdjacentHTML("beforeend", li);
        });
    }

    searchInp_tipo.addEventListener("keyup", () => {
        let arr = [];
        let searchWord = searchInp_tipo.value.toLowerCase();
        arr = tipo.filter(data => {
            return data.toLowerCase().startsWith(searchWord);
        }).map(data => {
            let isSelected = data == selectBtn_tipo.firstElementChild.innerText ? "selected" : "";
            return `<li onclick="updateNameTipo(this)" class="${isSelected}">${data}</li>`;
        }).join("");
        options_tipo.innerHTML = arr ? arr : `<p style="margin-top: 10px;">Oops! tipo not found</p>`;
    });
};

function apriTipo(){
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
    w_tipo.classList.toggle("active");
    w_camera.classList.remove("active");
    w_bagno.classList.remove("active");
    w_auto.classList.remove("active");
    SbloccaTipo();
}

function updateNameTipo(selectedLi) {
    var input_tipo = document.getElementById("input-tipo");
    var w_tipo = document.getElementById("wrapper-tipo");
    var btn_tipo = document.getElementById("select-btn-tipo");
    input_tipo.value = "";
    w_tipo.classList.remove("active");
    btn_tipo.firstElementChild.innerText = selectedLi.innerText;
    document.getElementById("hidden-tipo").value = selectedLi.innerText;
}

