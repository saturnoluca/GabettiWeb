function show(){
    if(document.getElementById("floor").style.display == "block"){
        $('#floor').slideUp();
    }
    if(document.getElementById("floor").style.display == "none") {
        $('#floor').slideDown();
    }
}