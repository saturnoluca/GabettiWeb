function MostraPassword(){

    if(document.getElementById("mostra_password").value == "Mostra Password"){
        document.getElementById("password").type = "text";
        document.getElementById("mostra_password").value = "Nascondi Password";
    }
    else if(document.getElementById("mostra_password").value == "Nascondi Password"){
        document.getElementById("password").type = "password";
        document.getElementById("mostra_password").value = "Mostra Password";
    }
}

function checkInputs() {
    var utenteCount = 6;
    var collaboratoreCount = 1;
    var agenteCount = 4;
    const form = document.getElementById('form_aggiungi_utente');
    const nome = document.getElementById('nome');
    const cognome = document.getElementById('cognome');
    const email = document.getElementById('email');
    const username = document.getElementById('username');
    const password = document.getElementById('password');
    const ruolo = document.getElementById('Selector');
    const agente = document.getElementById('agente');
    const descrizione = document.getElementById('descrizione');
    const telefono = document.getElementById('telefono');
    const facebook = document.getElementById('facebook');
    const instagram = document.getElementById('instagram');


    // trim to remove the whitespaces
    const nomeValue = nome.value.trim();
    const cognomeValue = cognome.value.trim();
    const emailValue = email.value.trim();
    const usernameValue = username.value.trim();
    const passwordValue = password.value.trim();
    const ruoloValue = ruolo.value.trim();
    const agenteValue = agente.value.trim();
    const descrizioneValue = descrizione.value.trim();
    const telefonoValue = telefono.value.trim();
    const facebookValue = facebook.value.trim();
    const instagramValue = instagram.value.trim();

    if(nomeValue === '') {
        setErrorFor(nome, "Nome non può essere vuoto");
    }
    else if(isValid(nomeValue)){
        setErrorFor(nome, 'No caratteri speciali');
    }
    else {
        setSuccessFor(nome);
        utenteCount--;
    }

    if(cognomeValue === '') {
        setErrorFor(cognome, 'Cognome non può essere vuoto');
    }
    else if(isValid(cognomeValue)){
        setErrorFor(cognome, 'No caratteri speciali');
    }
    else {
        setSuccessFor(cognome);
        utenteCount--;
    }

    if(emailValue === '') {
        setErrorFor(email, "Email non può essere vuoto");
    }
    else if(!isEmail(emailValue)){
        setErrorFor(email, 'Inserire una email valida');
    }
    else {
        var xhttp = new XMLHttpRequest();
        xhttp.open("POST","ControlloEmailAggiungiUtente?email="+emailValue,false);
        xhttp.onreadystatechange = function() {
            if (xhttp.readyState == 4 && xhttp.status == 200) {
                if (xhttp.responseText === "true") {
                    utenteCount--;
                    setSuccessFor(email);
                } else if(xhttp.responseText === "email") {
                    setErrorFor(email, 'Email già presente nel database');
                }
            }
        }
        xhttp.send();
    }

    if(usernameValue === '') {
        setErrorFor(username, 'Username non può essere vuoto');
    }
    else if(!isUsername(usernameValue)){
        setErrorFor(username, '5 a 20 caratteri inclusi ".","_" e "-"');
    }
    else {
        var xhttp = new XMLHttpRequest();
        xhttp.open("POST","ControlloUsernameAggiungiUtente?username="+usernameValue,false);
        xhttp.onreadystatechange = function() {
            if (xhttp.readyState == 4 && xhttp.status == 200) {
                if (xhttp.responseText === "true") {
                    setSuccessFor(username);
                    utenteCount--;
                } else {
                    setErrorFor(username, 'Username già presente nel database');
                }
            }
        }

        xhttp.send();
    }

    if(passwordValue === '') {
        setErrorFor(password, 'Password non può essere vuoto');
    }
    else if(!isPassword(passwordValue)){
        setErrorFor(password, '>= 8 caratteri alfanumerici e speciali');
    }
    else {
        setSuccessFor(password);
        utenteCount--;
    }

    if(ruoloValue === '') {
        setErrorFor(ruolo, 'Ruolo non può essere vuoto');
    }
    else {
        setSuccessFor(ruolo);
        utenteCount--;
        if(ruoloValue == "Admin" || ruoloValue == "Segretario"){
            collaboratoreCount = 0;
            agenteCount = 0;
        }
        if(ruoloValue == "Collaboratore"){
            if(agenteValue === '') {
                setErrorFor(agente, 'Agente non può essere vuoto');
            }
            else {
                setSuccessFor(agente);
                collaboratoreCount--;
            }
        }
        if(ruoloValue == "Collaboratore" || ruoloValue == "Agente"){
            collaboratoreCount = 0;
            if(descrizioneValue === '') {
                setErrorFor(descrizione, 'Descrizione non può essere vuoto');
            }
            else if(isDescrizione(descrizioneValue)){
                setErrorFor(descrizione, 'No caratteri speciali');
            }
            else {
                setSuccessFor(descrizione);
                agenteCount--;
            }
            if(telefonoValue === '') {
                setErrorFor(telefono, 'Telefono non può essere vuoto');
            }
            else if(!isTelefono(telefonoValue)){
                setErrorFor(telefono, 'Inserire un numero di cellulare valido');
            }
            else {
                setSuccessFor(telefono);
                agenteCount--;
            }
            setSuccessFor(facebook);
            agenteCount--;
            setSuccessFor(instagram);
            agenteCount--;
        }
    }

    if(utenteCount == 0 && collaboratoreCount == 0 && agenteCount == 0){
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
    return /^([0-9]{1,3})$/.test(numeroCivico);
}

function isCap(cap){
    return /^[1-9]([0-9]{4})$/.test(cap);
}

function isClasseEnergetica(classeEnergetica){
    return /[A-G]{1}/.test(classeEnergetica);
}

function isUsername(username){
    return /^[a-zA-Z0-9]([._-](?![._-])|[a-zA-Z0-9]){3,18}[a-zA-Z0-9]$/.test(username);
}

function isPassword(password){
    return /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/.test(password);
}

function isTelefono(telefono){
    return /^((00|\+)39[\. ]??)??3\d{2}[\. ]??\d{7}$/.test(telefono);
}