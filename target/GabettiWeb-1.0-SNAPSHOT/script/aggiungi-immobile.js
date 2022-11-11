function checkInputs() {
    var count = 22;
    const form = document.getElementById('form_add_immobile');
    const titoloImmobile = document.getElementById('titoloImmobile');
    const regione = document.getElementById('wrapper-regione');
    const provincia = document.getElementById('wrapper-provincia');
    const citta = document.getElementById('wrapper-citta');
    const indirizzo = document.getElementById('indirizzo');
    const numeroCivico = document.getElementById('numeroCivico');
    const cap = document.getElementById('cap');
    const zona = document.getElementById('zona');
    const descrizione = document.getElementById('descrizione');
    const prezzo = document.getElementById('prezzo');
    const mostraPrezzo = document.getElementById('mostraPrezzo');
    const tipoImmobile = document.getElementById('tipoImmobile');
    const statoImmobile = document.getElementById('statoImmobile');
    const superficie = document.getElementById('superficie');
    const locali = document.getElementById('locali');
    const piano = document.getElementById('piano');
    const postiAuto = document.getElementById('postiAuto');
    const numeroBagni = document.getElementById('numeroBagni');
    const camereLetto = document.getElementById('camereLetto');
    const riscaldamento = document.getElementById('riscaldamento');
    const classeEnergetica = document.getElementById('classeEnergetica');
    const agente = document.getElementById('agente');

    // trim to remove the whitespaces
    const titoloImmobileValue = titoloImmobile.value.trim();
    const regioneValue = document.getElementById("hidden_regione").value;
    const cittaValue = document.getElementById("hidden_citta").value;
    const provinciaValue = document.getElementById("hidden_provincia").value;
    const indirizzoValue = indirizzo.value.trim();
    const numeroCivicoValue = numeroCivico.value.trim();
    const capValue = cap.value.trim();
    const zonaValue = zona.value.trim();
    const descrizioneValue = descrizione.value.trim();
    const prezzoValue = prezzo.value.trim();
    const mostraPrezzoValue = mostraPrezzo.value.trim();
    const tipoImmobileValue = tipoImmobile.value.trim();
    const statoImmobileValue = statoImmobile.value.trim();
    const superficieValue = superficie.value.trim();
    const localiValue = locali.value.trim();
    const pianoValue = piano.value.trim();
    const postiAutoValue = postiAuto.value.trim();
    const numeroBagniValue = numeroBagni.value.trim();
    const camereLettoValue = camereLetto.value.trim();
    const riscaldamentoValue = riscaldamento.value.trim();
    const classeEnergeticaValue = classeEnergetica.value.trim();
    const agenteValue = agente.value.trim();


    if(titoloImmobileValue === '') {
        setErrorFor(titoloImmobile, "Titolo non può essere vuoto");
    }
    else if(isValid(titoloImmobileValue)){
        setErrorFor(titoloImmobile, 'No caratteri speciali');
    }
    else {
        setSuccessFor(titoloImmobile);
        count--;
    }

    if(regioneValue === '') {
        setErrorFor(regione, "Regione non può essere vuoto");
    }
    else {
        setSuccessFor(regione);
        count--;
    }

    if(cittaValue === '') {
        setErrorFor(citta, "Città non può essere vuoto");
    }
    else {
        setSuccessFor(citta);
        count--;
    }

    if(provinciaValue === '') {
        setErrorFor(provincia, "Provincia non può essere vuoto");
    }
    else {
        setSuccessFor(provincia);
        count--;
    }

    if(indirizzoValue === '') {
        setErrorFor(indirizzo, "Indirizzo non può essere vuoto");
    }
    else if(isValid(indirizzoValue)){
        setErrorFor(indirizzo, 'No caratteri speciali');
    }
    else {
        setSuccessFor(indirizzo);
        count--;
    }

    if(!isNumeroCivico(numeroCivicoValue)){
        setErrorFor(numeroCivico, 'Solo valori numerici');
    }
    else {
        setSuccessFor(numeroCivico);
        count--;
    }

    if(capValue === '') {
        setErrorFor(cap, "Cap non può essere vuoto");
    }
    else if(!isCap(capValue)){
        setErrorFor(cap, 'Solo valori numerici di 5 cifre');
    }
    else {
        setSuccessFor(cap);
        count--;
    }
    if(isValid(zonaValue)){
        setErrorFor(zona, 'No caratteri speciali');
    }
    else {
        setSuccessFor(zona);
        count--;
    }
    if(descrizioneValue === '') {
        setErrorFor(descrizione, "Descrizione non può essere vuoto");
    }
    else if(isDescrizione(descrizioneValue)){
        setErrorFor(descrizione, 'No caratteri speciali');
    }
    else {
        setSuccessFor(descrizione);
        count--;
    }
    if(prezzoValue === '') {
        setErrorFor(prezzo, "Prezzo non può essere vuoto");
    }
    else if(!isSuperficie(prezzoValue)){
        setErrorFor(prezzo, 'Solo numeri interi o decimali');
    }
    else {
        setSuccessFor(prezzo);
        count--;
    }
    if(mostraPrezzoValue === '') {
        setErrorFor(mostraPrezzo, "Mostra prezzo non può essere vuoto");
    }
    else {
        setSuccessFor(mostraPrezzo);
        count--;
    }
    if(tipoImmobileValue === '') {
        setErrorFor(tipoImmobile, "Tipo immobile non può essere vuoto");
    }
    else {
        setSuccessFor(tipoImmobile);
        count--;
    }
    if(statoImmobileValue === '') {
        setErrorFor(statoImmobile, "Stato immobile non può essere vuoto");
    }
    else {
        setSuccessFor(statoImmobile);
        count--;
    }
    if(superficieValue === '') {
        setErrorFor(superficie, "Superficie non può essere vuoto");
    }
    else if(!isSuperficie(superficieValue)){
        setErrorFor(superficie, 'Solo numeri interi o decimali');
    }
    else {
        setSuccessFor(superficie);
        count--;
    }
    if(pianoValue === '') {
        setErrorFor(piano, "Piano non può essere vuoto");
    }
    else {
        setSuccessFor(piano);
        count--;
    }
    if(localiValue === '') {
        setErrorFor(locali, "Locali non può essere vuoto");
    }
    else if(!isNumeric(localiValue)){
        setErrorFor(locali, 'Solo valori numerici');
    }
    else {
        setSuccessFor(locali);
        count--;
    }
    if(numeroBagniValue === '') {
        setErrorFor(numeroBagni, "Bagni non può essere vuoto");
    }
    else if(!isNumeric(numeroBagniValue)){
        setErrorFor(numeroBagni, 'Solo valori numerici');
    }
    else {
        setSuccessFor(numeroBagni);
        count--;
    }
    if(postiAutoValue === '') {
        setErrorFor(postiAuto, "Posti auto non può essere vuoto");
    }
    else if(!isNumeric(postiAutoValue)){
        setErrorFor(postiAuto, 'Solo valori numerici');
    }
    else {
        setSuccessFor(postiAuto);
        count--;
    }
    if(camereLettoValue === '') {
        setErrorFor(camereLetto, "Camere letto non può essere vuoto");
    }
    else if(!isNumeric(camereLettoValue)){
        setErrorFor(camereLetto, 'Solo valori numerici');
    }
    else {
        setSuccessFor(camereLetto);
        count--;
    }
    if(riscaldamentoValue === '') {
        setErrorFor(riscaldamento, "Riscaldamento non può essere vuoto");
    }
    else {
        setSuccessFor(riscaldamento);
        count--;
    }
    if(classeEnergeticaValue === '') {
        setErrorFor(classeEnergetica, "Classe energetica non può essere vuoto");
    }
    else if(!isClasseEnergetica(classeEnergeticaValue)){
        setErrorFor(classeEnergetica, 'Solo valore compreso che va da A a G');
    }
    else {
        setSuccessFor(classeEnergetica);
        count--;
    }
    if(agenteValue === '') {
        setErrorFor(agente, "Agente non può essere vuoto");
    }
    else {
        setSuccessFor(agente);
        count--;
    }

    if(count == 0){
        return true;
    }
    else{
        return false;
    }
    return false;
}

function setErrorFor(input, message) {
    const formControl = input.parentElement;
    const small = formControl.querySelector('small');
    formControl.classList.remove("success");
    formControl.classList.add("error");
    small.innerText = message;
}

function setSuccessFor(input) {
    const formControl = input.parentElement;
    formControl.classList.remove("error");
    formControl.classList.add("success");
}

function isValid(valore) {
    return /[#§?!^~.<>;:"\/\[\]\|{}=_+]/.test(valore);
}

function isDescrizione(valore) {
    return /[#§?^~<>"\/\[\]\|{}=_+]/.test(valore);
}

function isSuperficie(superficie){
    return /^((0|([1-9][0-9]*))(\.[0-9]+)?)$/.test(superficie);
}

function isNumeric(valore){
    return /[0-9]/.test(valore);
}

function isEmail(email) {
    return /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(email);
}

function isProvincia(provincia){
    return /^([A-Z]{2})$/.test(provincia);
}

function isNumeroCivico(numeroCivico){
    return /^([0-9]{0,3})$/.test(numeroCivico);
}

function isCap(cap){
    return /^[1-9]([0-9]{4})$/.test(cap);
}

function isClasseEnergetica(classeEnergetica){
    return /[A-G]{1}/.test(classeEnergetica);
}






