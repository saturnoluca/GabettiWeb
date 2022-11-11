

function checkInputs() {
    var count = 5;
    const form = document.getElementById('form_agente');
    const nome = document.getElementById('nome');
    const telefono = document.getElementById('telefono');
    const email = document.getElementById('email');
    const messaggio = document.getElementById('messaggio');
    const privacy = document.getElementById('privacy');
    console.log(privacy.checked);
    // trim to remove the whitespaces

    const nomeValue = nome.value.trim();
    const telefonoValue = telefono.value.trim();
    const emailValue = email.value.trim();
    const messaggioValue = messaggio.value.trim();

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
    if(messaggioValue === '') {
        setErrorFor(messaggio, "Non può essere vuoto");
    }
    else if(isDescrizione(messaggioValue)){
        setErrorFor(messaggio, 'No caratteri speciali');
    }
    else {
        setSuccessFor(messaggio);
        count--;
    }
    if(privacy.checked != 1) {
        setErrorPrivacy(privacy, "Spuntare la casella sul consenso della privacy per continuare");
    }
    else {
        setSuccessPrivacy(privacy);
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

function setSuccessPrivacy(input) {
    const formControl = input.parentElement;
    formControl.classList.remove("error");
    formControl.classList.add("success");

}

function setErrorPrivacy(input, message) {
    const formControl = input.parentElement;
    const small = formControl.querySelector('small');
    formControl.classList.remove("success");
    formControl.classList.add("error");
    small.innerText = message;
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
    return /^((00|\+)39[\. ]??)??3\d{2}[\. ]??\d{6,7}$/.test(telefono);
}

function isEmail(email) {
    return /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(email);
}

function isDescrizione(valore) {
    return /[#§?^~<>"\/\[\]\|{}=_+]/.test(valore);
}
