function advancedOption(){
    if(document.getElementById("advanced_option_div").style.display == "none"){
        console.log("ciao");
        $('#advanced_option_div').slideDown();
    }
    else{
        $('#advanced_option_div').slideUp();
    }

}


        /* When the user clicks on the button, 
        toggle between hiding and showing the dropdown content */
        function apriScegliLocalita() {
            document.getElementById("selezionaLocalita").classList.toggle("show");
            document.getElementById("selezionaTipo").classList.remove("show");
            document.getElementById("selezionaStato").classList.remove("show");
            document.getElementById("selezionaMinCamere").classList.remove("show");
            document.getElementById("selezionaMinBagni").classList.remove("show");
            document.getElementById("selezionaMinPrezzo").classList.remove("show");
            document.getElementById("selezionaMinAuto").classList.remove("show");
            document.getElementById("selezionaAgente").classList.remove("show");
        }
        function apriScegliTipo() {
            document.getElementById("selezionaTipo").classList.toggle("show");
            document.getElementById("selezionaLocalita").classList.remove("show");
            document.getElementById("selezionaStato").classList.remove("show");
            document.getElementById("selezionaMinCamere").classList.remove("show");
            document.getElementById("selezionaMinBagni").classList.remove("show");
            document.getElementById("selezionaMinPrezzo").classList.remove("show");
            document.getElementById("selezionaMaxPrezzo").classList.remove("show");
            document.getElementById("selezionaMinAuto").classList.remove("show");
            document.getElementById("selezionaAgente").classList.remove("show");
        }

        function apriScegliStato() {
            document.getElementById("selezionaStato").classList.toggle("show");
            document.getElementById("selezionaLocalita").classList.remove("show");
            document.getElementById("selezionaTipo").classList.remove("show");
            document.getElementById("selezionaMinCamere").classList.remove("show");
            document.getElementById("selezionaMinBagni").classList.remove("show");
            document.getElementById("selezionaMinPrezzo").classList.remove("show");
            document.getElementById("selezionaMaxPrezzo").classList.remove("show");
            document.getElementById("selezionaMinAuto").classList.remove("show");
            document.getElementById("selezionaAgente").classList.remove("show");
        }

        
        function apriScegliMinCamere() {
            document.getElementById("selezionaMinCamere").classList.toggle("show");
            document.getElementById("selezionaTipo").classList.remove("show");
            document.getElementById("selezionaLocalita").classList.remove("show");
            document.getElementById("selezionaStato").classList.remove("show");
            document.getElementById("selezionaMinBagni").classList.remove("show");
            document.getElementById("selezionaMinPrezzo").classList.remove("show");
            document.getElementById("selezionaMaxPrezzo").classList.remove("show");
            document.getElementById("selezionaMinAuto").classList.remove("show");
            document.getElementById("selezionaAgente").classList.remove("show");
        }

        function apriScegliMinBagni() {
            document.getElementById("selezionaMinBagni").classList.toggle("show");
            document.getElementById("selezionaTipo").classList.remove("show");
            document.getElementById("selezionaLocalita").classList.remove("show");
            document.getElementById("selezionaStato").classList.remove("show");
            document.getElementById("selezionaMinCamere").classList.remove("show");
            document.getElementById("selezionaMinPrezzo").classList.remove("show");
            document.getElementById("selezionaMaxPrezzo").classList.remove("show");
            document.getElementById("selezionaMinAuto").classList.remove("show");
            document.getElementById("selezionaAgente").classList.remove("show");
        }

        function apriScegliMinPrezzo() {
            document.getElementById("selezionaMinPrezzo").classList.toggle("show");
            document.getElementById("selezionaTipo").classList.remove("show");
            document.getElementById("selezionaLocalita").classList.remove("show");
            document.getElementById("selezionaStato").classList.remove("show");
            document.getElementById("selezionaMinBagni").classList.remove("show")
            document.getElementById("selezionaMinCamere").classList.remove("show");
            document.getElementById("selezionaMaxPrezzo").classList.remove("show");
            document.getElementById("selezionaMinAuto").classList.remove("show");
            document.getElementById("selezionaAgente").classList.remove("show");
        }

        function apriScegliMaxPrezzo() {
            document.getElementById("selezionaMaxPrezzo").classList.toggle("show");
            document.getElementById("selezionaTipo").classList.remove("show");
            document.getElementById("selezionaLocalita").classList.remove("show");
            document.getElementById("selezionaStato").classList.remove("show");
            document.getElementById("selezionaMinBagni").classList.remove("show")
            document.getElementById("selezionaMinCamere").classList.remove("show");
            document.getElementById("selezionaMinPrezzo").classList.remove("show");
            document.getElementById("selezionaMinAuto").classList.remove("show");
            document.getElementById("selezionaAgente").classList.remove("show");
        }

        function apriScegliMinAuto() {
            document.getElementById("selezionaMinAuto").classList.toggle("show");
            document.getElementById("selezionaMaxPrezzo").classList.remove("show");
            document.getElementById("selezionaTipo").classList.remove("show");
            document.getElementById("selezionaLocalita").classList.remove("show");
            document.getElementById("selezionaStato").classList.remove("show");
            document.getElementById("selezionaMinBagni").classList.remove("show")
            document.getElementById("selezionaMinCamere").classList.remove("show");
            document.getElementById("selezionaMinPrezzo").classList.remove("show");
            document.getElementById("selezionaAgente").classList.remove("show");
        }

        function apriScegliAgente() {
            document.getElementById("selezionaAgente").classList.toggle("show");
            document.getElementById("selezionaMinAuto").classList.remove("show");
            document.getElementById("selezionaMaxPrezzo").classList.remove("show");
            document.getElementById("selezionaTipo").classList.remove("show");
            document.getElementById("selezionaLocalita").classList.remove("show");
            document.getElementById("selezionaStato").classList.remove("show");
            document.getElementById("selezionaMinBagni").classList.remove("show")
            document.getElementById("selezionaMinCamere").classList.remove("show");
            document.getElementById("selezionaMinPrezzo").classList.remove("show");
        }

          window.onclick = function(event) {
            if (!event.target.matches('.dropdown-toggle')) {
              var dropdowns = document.getElementsByClassName("dropdown-content");
              var i;
              for (i = 0; i < dropdowns.length; i++) {
                var openDropdown = dropdowns[i];
                if (openDropdown.classList.contains('show')) {
                  openDropdown.classList.remove('show');
                }
              }
            }
          }
  
  
          function cambiaLocalita(elem) {
            var text = elem.children[1];
            var div = document.getElementById("valore_localita");
            if(elem.classList.contains("localita_selected")){
              elem.classList.remove("localita_selected");
              div.innerHTML = "Qualsiasi";
                $("#localita_immobile").val("Qualsiasi");
            }
            else{
              $("a").removeClass("localita_selected");
              elem.classList.add("localita_selected");
              div.innerHTML = text.innerHTML;
                $("#localita_immobile").val(text.innerHTML);
            }
          }

          function cambiaStato(elem) {
            var text = elem.children[1];
            var div = document.getElementById("valore_stato");
            if(elem.classList.contains("stato_selected")){
              elem.classList.remove("stato_selected");
              div.innerHTML = "Qualsiasi";
                $("#stato_immobile").val("Qualsiasi");
  
            }
            else{
              $("a").removeClass("stato_selected");
              elem.classList.add("stato_selected");
              div.innerHTML = text.innerHTML;
                $("#stato_immobile").val(text.innerHTML);
            }
          }

          function cambiaTipo(elem) {
            var text = elem.children[1];
            var div = document.getElementById("valore_tipo");
            if(elem.classList.contains("tipo_selected")){
              elem.classList.remove("tipo_selected");
              div.innerHTML = "Qualsiasi";
                $("#tipo_immobile").val("Qualsiasi");
  
            }
            else{
              $("a").removeClass("tipo_selected");
              elem.classList.add("tipo_selected");
              div.innerHTML = text.innerHTML;
                $("#tipo_immobile").val(text.innerHTML);
            }
          }


          
          function cambiaMinCamere(elem) {
            var text = elem.children[1];
            var div = document.getElementById("valore_minCamere");
            if(elem.classList.contains("minCamere_selected")){
              elem.classList.remove("minCamere_selected");
              div.innerHTML = "Qualsiasi";
                $("#camere_immobile").val("Qualsiasi");
  
            }
            else{
              $("a").removeClass("minCamere_selected");
              elem.classList.add("minCamere_selected");
              div.innerHTML = text.innerHTML;
                $("#camere_immobile").val(text.innerHTML);
            }
          }


          function cambiaMinBagni(elem) {
            var text = elem.children[1];
            var div = document.getElementById("valore_minBagni");
            if(elem.classList.contains("minBagni_selected")){
              elem.classList.remove("minBagni_selected");
              div.innerHTML = "Qualsiasi";
                $("#bagni_immobile").val("Qualsiasi");
  
            }
            else{
              $("a").removeClass("minBagni_selected");
              elem.classList.add("minBagni_selected");
              div.innerHTML = text.innerHTML;
                $("#bagni_immobile").val(text.innerHTML);
            }
          }

          
          function cambiaMinPrezzo(elem) {
            var text = elem.children[1];
            var div = document.getElementById("valore_minPrezzo");
            if(elem.classList.contains("minPrezzo_selected")){
              elem.classList.remove("minPrezzo_selected");
              div.innerHTML = "Qualsiasi";
                $("#minPrezzo_immobile").val("Qualsiasi");
  
            }
            else{
              $("a").removeClass("minPrezzo_selected");
              elem.classList.add("minPrezzo_selected");
              div.innerHTML = text.innerHTML;
                $("#minPrezzo_immobile").val(text.innerHTML);
            }
          }

          function cambiaMaxPrezzo(elem) {
            var text = elem.children[1];
            var div = document.getElementById("valore_maxPrezzo");
            if(elem.classList.contains("maxPrezzo_selected")){
              elem.classList.remove("maxPrezzo_selected");
              div.innerHTML = "Qualsiasi";
                $("#maxPrezzo_immobile").val("Qualsiasi");
  
            }
            else{
              $("a").removeClass("maxPrezzo_selected");
              elem.classList.add("maxPrezzo_selected");
              div.innerHTML = text.innerHTML;
                $("#maxPrezzo_immobile").val(text.innerHTML);
            }
          }

          function cambiaMinAuto(elem) {
            var text = elem.children[1];
            var div = document.getElementById("valore_minAuto");
            if(elem.classList.contains("minAuto_selected")){
              elem.classList.remove("minAuto_selected");
              div.innerHTML = "Qualsiasi";
                $("#auto_immobile").val("Qualsiasi");
  
            }
            else{
              $("a").removeClass("minAuto_selected");
              elem.classList.add("minAuto_selected");
              div.innerHTML = text.innerHTML;
                $("#auto_immobile").val(text.innerHTML);
            }
          }

          function cambiaAgente(elem) {
            var text = elem.children[1];
            var div = document.getElementById("valore_agente");
            if(elem.classList.contains("agente_selected")){
              elem.classList.remove("agente_selected");
              div.innerHTML = "Qualsiasi";
                $("#agente_immobile").val("Qualsiasi");
            }
            else{
              $("a").removeClass("agente_selected");
              elem.classList.add("agente_selected");
              div.innerHTML = text.innerHTML;
                $("#agente_immobile").val(text.innerHTML);
            }
          }
          
          
  