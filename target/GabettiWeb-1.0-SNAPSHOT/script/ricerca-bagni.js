
function SbloccaMinBagni(){
    const wrapper_minBagni = document.querySelector("#wrapper-minBagni"),
        selectBtn_minBagni = wrapper_minBagni.querySelector("#select-btn-minBagni"),
        searchInp_minBagni = wrapper_minBagni.querySelector("#input-minBagni"),
        options_minBagni = wrapper_minBagni.querySelector("#options-minBagni");

    let Bagni = [];


    $.post('CampiRicerca', {action: "minBagni"}, function (listJson) {
        var json = JSON.parse(listJson);
        for (var i = 0; i < json.length; i++) {
            Bagni.push(json[i].minBagni);
        }
        addMinBagni();
    })
    function addMinBagni(selectedMinBagni) {
        options_minBagni.innerHTML = "";
        Bagni.forEach(minBagni => {
            let isSelected = minBagni == selectedMinBagni ? "selected" : "";
            let li = `<li onclick="updateNameMinBagni(this)" class="${isSelected}">${minBagni}</li>`;
            options_minBagni.insertAdjacentHTML("beforeend", li);
        });
    }

    searchInp_minBagni.addEventListener("keyup", () => {
        let arr = [];
        let searchWord = searchInp_minBagni.value.toLowerCase();
        arr = Bagni.filter(data => {
            return data.toLowerCase().startsWith(searchWord);
        }).map(data => {
            let isSelected = data == selectBtn_minBagni.firstElementChild.innerText ? "selected" : "";
            return `<li onclick="updateNameMinBagni(this)" class="${isSelected}">${data}</li>`;
        }).join("");
        options_minBagni.innerHTML = arr ? arr : `<p style="margin-top: 10px;">Oops! minBagni not found</p>`;
    });
};

function apriMinBagni(){
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
    w_bagno.classList.toggle("active");
    w_auto.classList.remove("active");
    SbloccaMinBagni();
}

function updateNameMinBagni(selectedLi) {
    var input_minBagni = document.getElementById("input-minBagni");
    var w_minBagni = document.getElementById("wrapper-minBagni");
    var btn_minBagni = document.getElementById("select-btn-minBagni");
    input_minBagni.value = "";
    w_minBagni.classList.remove("active");
    btn_minBagni.firstElementChild.innerText = selectedLi.innerText;
    document.getElementById("hidden-minBagni").value = selectedLi.innerText;
}

