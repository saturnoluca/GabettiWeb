

function checkInputs() {
    var count = 14;
    const form = document.getElementById('form_valutazione');
    const indirizzo = document.getElementById('indirizzo');
    const comune = document.getElementById('comune');
    const tipoImmobile = document.getElementById('tipoImmobile');
    const superficie = document.getElementById('superficie');
    const piano = document.getElementById('piano');
    const locali = document.getElementById('locali');
    const bagni = document.getElementById('bagni');
    const statoAppartamento = document.getElementById('statoAppartamento');
    const riscaldamento = document.getElementById('riscaldamento');
    const annoDiCostruzione = document.getElementById('annoDiCostruzione');
    const nome = document.getElementById('nome');
    const cognome = document.getElementById('cognome');
    const telefono = document.getElementById('telefono');
    const email = document.getElementById('email');
    // trim to remove the whitespaces
    const indirizzoValue = indirizzo.value.trim();
    const comuneValue = comune.value.trim();
    const tipoImmobileValue = tipoImmobile.value.trim();
    const superficieValue = superficie.value.trim();
    const pianoValue = piano.value.trim();
    const localiValue = locali.value.trim();
    const bagniValue = bagni.value.trim();
    const statoAppartamentoValue = statoAppartamento.value.trim();
    const riscaldamentoValue = riscaldamento.value.trim();
    const annoDiCostruzioneValue = annoDiCostruzione.value.trim();
    const nomeValue = nome.value.trim();
    const cognomeValue = cognome.value.trim();
    const telefonoValue = telefono.value.trim();
    const emailValue = email.value.trim();


    if(indirizzoValue === '') {
        setErrorFor(indirizzo, "Non può essere vuoto");
    }
    else if(isValid(indirizzoValue)){
        setErrorFor(indirizzo, 'No caratteri speciali');
    }
    else {
        setSuccessFor(indirizzo);
        count--;
    }
    if(comuneValue === '') {
        setErrorFor(comune, "Non può essere vuoto");
    }
    else if(isValid(comuneValue)){
        setErrorFor(comune, 'No caratteri speciali');
    }
    else {
        setSuccessFor(comune);
        count--;
    }
    if(tipoImmobileValue === '') {
        setErrorFor(tipoImmobile, "Non può essere vuoto");
    }
    else {
        setSuccessFor(tipoImmobile);
        count--;
    }
    if(superficieValue === '') {
        setErrorFor(superficie, "Non può essere vuoto");
    }
    else if(!isSuperficie(superficieValue)){
        setErrorFor(superficie, 'Solo numeri interi o decimali');
    }
    else {
        setSuccessFor(superficie);
        count--;
    }
    if(pianoValue === '') {
        setErrorFor(piano, "Non può essere vuoto");
    }
    else {
        setSuccessFor(piano);
        count--;
    }
    if(localiValue === '') {
        setErrorFor(locali, "Non può essere vuoto");
    }
    else if(!isNumeric(localiValue)){
        setErrorFor(locali, 'Solo valori numerici');
    }
    else {
        setSuccessFor(locali);
        count--;
    }
    if(bagniValue === '') {
        setErrorFor(bagni, "Non può essere vuoto");
    }
    else if(!isNumeric(bagniValue)){
        setErrorFor(bagni, 'Solo valori numerici');
    }
    else {
        setSuccessFor(bagni);
        count--;
    }
    if(statoAppartamentoValue === '') {
        setErrorFor(statoAppartamento, "Non può essere vuoto");
    }
    else {
        setSuccessFor(statoAppartamento);
        count--;
    }
    if(riscaldamentoValue === '') {
        setErrorFor(riscaldamento, "Riscaldamento non può essere vuoto");
    }
    else {
        setSuccessFor(riscaldamento);
        count--;
    }
    if(annoDiCostruzioneValue === '') {
        setErrorFor(annoDiCostruzione, "Non può essere vuoto");
    }
    else if(!isYear(annoDiCostruzioneValue)){
        setErrorFor(annoDiCostruzione, 'Solo valori numerici');
    }
    else {
        setSuccessFor(annoDiCostruzione);
        count--;
    }
    if(nomeValue === '') {
        setErrorFor(nome, "Non può essere vuoto");
    }
    else if(isValid(nomeValue)){
        setErrorFor(nome, 'No caratteri speciali');
    }
    else {
        setSuccessFor(nome);
        count--;
    }
    if(cognomeValue === '') {
        setErrorFor(cognome, "Non può essere vuoto");
    }
    else if(isValid(cognomeValue)){
        setErrorFor(cognome, 'No caratteri speciali');
    }
    else {
        setSuccessFor(cognome);
        count--;
    }
    if(telefonoValue === '') {
        setErrorFor(telefono, "Non può essere vuoto");
    }
    else if(!isTelefono(telefonoValue)){
        setErrorFor(telefono, 'Numero non valido');
    }
    else {
        setSuccessFor(telefono);
        count--;
    }
    if(emailValue === '') {
        setErrorFor(email, "Non può essere vuoto");
    }
    else if(!isEmail(emailValue)){
        setErrorFor(email, 'Email non valida');
    }
    else {
        setSuccessFor(email);
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
    formControl.className = 'valutazione_form_field half_size error';
    small.innerText = message;
}

function setSuccessFor(input) {
    const formControl = input.parentElement;
    formControl.className = 'valutazione_form_field half_size success';
}

function isValid(valore) {
    return /[#§?!^~.<>;:"\/\[\]\|{}=_+]/.test(valore);
}

function isSuperficie(superficie){
    return /^((0|([1-9][0-9]*))(\,[0-9]+)?)$/.test(superficie);
}

function isNumeric(valore){
    return /[0-9]/.test(valore);
}

function isYear(annoDiCostruzione){
    return /^\d{4}$/.test(annoDiCostruzione);
}

function isTelefono(telefono){
    return /^((00|\+)39[\. ]??)??3\d{2}[\. ]??\d{7}$/.test(telefono);
}

function isEmail(email) {
    return /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(email);
}