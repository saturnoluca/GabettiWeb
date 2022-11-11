function MostraPassword(){

    if(document.getElementById("mostra_password").value == "Mostra Password"){
        document.getElementById("passwordUtente").type = "text";
        document.getElementById("mostra_password").value = "Nascondi Password";
    }
    else if(document.getElementById("mostra_password").value == "Nascondi Password"){
        document.getElementById("passwordUtente").type = "password";
        document.getElementById("mostra_password").value = "Mostra Password";
    }
}

function checkInputsAgente() {
    var count = 2;

    const form = document.getElementById('form_dati_agente');
    const descrizione = document.getElementById('descrizione');
    const facebook = document.getElementById('facebook');
    const instagram = document.getElementById('instagram');
    const telefono = document.getElementById('telefono');





    // trim to remove the whitespaces
    const descrizioneValue = descrizione.value.trim();
    const facebookValue = facebook.value.trim();
    const instagramValue = instagram.value.trim();
    const telefonoValue = telefono.value.trim();

    if(isDescrizione(descrizioneValue)){
        setErrorFor(descrizione, 'No caratteri speciali');
    }
    else {
        setSuccessFor(descrizione);
        count--;
    }

    if(!isTelefono(telefonoValue)){
        setErrorFor(telefono, 'Inserire un numero di cellulare valido');
    }
    else {
        setSuccessFor(telefono);
        count--;
    }
    setSuccessFor(facebook);
    setSuccessFor(instagram);


    if(count == 0){
        return true;
    }
    else{
        return false;
    }
    return false;
}

function checkInputs() {
    var utenteCount = 5;

    const form = document.getElementById('form_informazioni_personali');
    const nome = document.getElementById('nome');
    const cognome = document.getElementById('cognome');
    const email = document.getElementById('email');
    const username = document.getElementById('username');
    const password = document.getElementById('passwordUtente');





    // trim to remove the whitespaces
    const idUtente = document.getElementById('idUtente').value;
    const nomeValue = nome.value.trim();
    const cognomeValue = cognome.value.trim();
    const emailValue = email.value.trim();
    const usernameValue = username.value.trim();
    const passwordValue = password.value.trim();


    if(isValid(nomeValue)){
        setErrorFor(nome, 'No caratteri speciali');
    }
    else {
        setSuccessFor(nome);
        utenteCount--;
    }

    if(isValid(cognomeValue)){
        setErrorFor(cognome, 'No caratteri speciali');
    }
    else {
        setSuccessFor(cognome);
        utenteCount--;
    }

    if(!isEmail(emailValue)){
        setErrorFor(email, 'Inserire una email valida');
    }
    else {
        var xhttp = new XMLHttpRequest();
        xhttp.open("POST","ControlloEmail?idUtente="+idUtente+"&email="+emailValue,false);
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

    if(!isUsername(usernameValue)){
        setErrorFor(username, '5 a 20 caratteri inclusi ".","_" e "-"');
    }
    else {
        var xhttp = new XMLHttpRequest();
        xhttp.open("POST","ControlloUsername?idUtente="+idUtente+"&username="+usernameValue,false);
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

    if(!isPassword(passwordValue)){
        setErrorFor(password, '>= 8 caratteri alfanumerici e speciali');
    }
    else {
        setSuccessFor(password);
        utenteCount--;
    }


    if(utenteCount == 0){
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
    return /[#§?!^~.<>;:"\/\[\]\|{}=_+0-9]/.test(valore);
}

function isDescrizione(valore) {
    return /[#§?^~<>"\/\[\]\|{}=_+]/.test(valore);
}



function isNumeric(valore){
    return /[0-9]/.test(valore);
}

function isEmail(email) {
    return /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(email);
}


function isUsername(username){
    return /^[a-zA-Z0-9]([._-](?![._-])|[a-zA-Z0-9]){3,18}[a-zA-Z0-9]$/.test(username);
}

function isPassword(password){
    return /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&_-])[A-Za-z\d@$!%*#?&_-]{8,}$/.test(password);
}

function isTelefono(telefono){
    return /^((00|\+)39[\. ]??)??3\d{2}[\. ]??\d{7}$/.test(telefono);
}