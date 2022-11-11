
function SbloccaMinAuto(){
    const wrapper_minAuto = document.querySelector("#wrapper-minAuto"),
        selectBtn_minAuto = wrapper_minAuto.querySelector("#select-btn-minAuto"),
        searchInp_minAuto = wrapper_minAuto.querySelector("#input-minAuto"),
        options_minAuto = wrapper_minAuto.querySelector("#options-minAuto");

    let Auto = [];


    $.post('CampiRicerca', {action: "minAuto"}, function (listJson) {
        var json = JSON.parse(listJson);
        for (var i = 0; i < json.length; i++) {
            Auto.push(json[i].minAuto);
        }
        addMinAuto();
    })
    function addMinAuto(selectedMinAuto) {
        options_minAuto.innerHTML = "";
        Auto.forEach(minAuto => {
            let isSelected = minAuto == selectedMinAuto ? "selected" : "";
            let li = `<li onclick="updateNameMinAuto(this)" class="${isSelected}">${minAuto}</li>`;
            options_minAuto.insertAdjacentHTML("beforeend", li);
        });
    }

    searchInp_minAuto.addEventListener("keyup", () => {
        let arr = [];
        let searchWord = searchInp_minAuto.value.toLowerCase();
        arr = Auto.filter(data => {
            return data.toLowerCase().startsWith(searchWord);
        }).map(data => {
            let isSelected = data == selectBtn_minAuto.firstElementChild.innerText ? "selected" : "";
            return `<li onclick="updateNameMinAuto(this)" class="${isSelected}">${data}</li>`;
        }).join("");
        options_minAuto.innerHTML = arr ? arr : `<p style="margin-top: 10px;">Oops! minAuto not found</p>`;
    });
};

function apriAuto(){
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
    w_bagno.classList.remove("active");
    w_auto.classList.toggle("active");
    SbloccaMinAuto();
}

function updateNameMinAuto(selectedLi) {
    var input_minAuto = document.getElementById("input-minAuto");
    var w_minAuto = document.getElementById("wrapper-minAuto");
    var btn_minAuto = document.getElementById("select-btn-minAuto");
    input_minAuto.value = "";
    w_minAuto.classList.remove("active");
    btn_minAuto.firstElementChild.innerText = selectedLi.innerText;
    document.getElementById("hidden-minAuto").value = selectedLi.innerText;
}

