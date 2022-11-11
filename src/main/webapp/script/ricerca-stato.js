
function SbloccaStato(){
    const wrapper_stato = document.querySelector("#wrapper-stato"),
        selectBtn_stato = wrapper_stato.querySelector("#select-btn-stato"),
        searchInp_stato = wrapper_stato.querySelector("#input-stato"),
        options_stato = wrapper_stato.querySelector("#options-stato");

    let stati = [];


    $.post('CampiRicerca', {action: "stato"}, function (listJson) {
        var json = JSON.parse(listJson);
        for (var i = 0; i < json.length; i++) {
            stati.push(json[i].stato);
        }
        addStato();
    })
    function addStato(selectedStato) {
        options_stato.innerHTML = "";
        stati.forEach(stato => {
            let isSelected = stato == selectedStato ? "selected" : "";
            let li = `<li onclick="updateNameStato(this)" class="${isSelected}">${stato}</li>`;
            options_stato.insertAdjacentHTML("beforeend", li);
        });
    }

    searchInp_stato.addEventListener("keyup", () => {
        let arr = [];
        let searchWord = searchInp_stato.value.toLowerCase();
        arr = stato.filter(data => {
            return data.toLowerCase().startsWith(searchWord);
        }).map(data => {
            let isSelected = data == selectBtn_stato.firstElementChild.innerText ? "selected" : "";
            return `<li onclick="updateNameStato(this)" class="${isSelected}">${data}</li>`;
        }).join("");
        options_stato.innerHTML = arr ? arr : `<p style="margin-top: 10px;">Oops! stato not found</p>`;
    });
};

function apriStato(){
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
    w_stato.classList.toggle("active");
    w_tipo.classList.remove("active");
    w_camera.classList.remove("active");
    w_bagno.classList.remove("active");
    w_auto.classList.remove("active");
    SbloccaStato();
}

function updateNameStato(selectedLi) {
    var input_stato = document.getElementById("input-stato");
    var w_stato = document.getElementById("wrapper-stato");
    var btn_stato = document.getElementById("select-btn-stato");
    input_stato.value = "";
    w_stato.classList.remove("active");
    btn_stato.firstElementChild.innerText = selectedLi.innerText;
    document.getElementById("hidden-stato").value = selectedLi.innerText;
}

