<%--
  Created by IntelliJ IDEA.
  User: Luca
  Date: 20/04/2022
  Time: 11:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="it" dir="ltr">
<head>
    <title>Gabetti Nocera | Planimetria Immobile</title>
    <link rel="shortcut icon" type="image/jpg" href="images/favicon-256x256.png"/>
    <meta charset="UTF-8">
    <!--<title> Responsive Sidebar Menu  | CodingLab </title>-->
    <link rel="stylesheet" href="css/amministratoreagente.css">
    <!-- Boxicons CDN Link -->
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">

    <link rel="stylesheet" href="icomoon/style.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <link rel="stylesheet" href="bootstrapcss/owl.carousel.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
</head>
<%
    int idAppartamento =  Integer.parseInt(request.getParameter("idAppartamento"));

%>
<body>
<jsp:include page="sidebar.jsp" />
<section class="home-section">
    <div class="div_addProperty_page">
        <div class="addProperty_page_head">
            <div class="addProperty_head_title">
                <h1 class="head_title">Aggiungi immobile</h1>
            </div>
        </div>
        <div class="addProperty_page_content">
            <form class="form_addProperty" action="MultimediaAggiunta" method="post" enctype="multipart/form-data">
                <input type="hidden" name="idAppartamento" value="<%=idAppartamento%>">
                <input type="hidden" name="azione" value="<%="planimetria"%>">
                <div class="addProperty_content">
                    <div class="form_content_fields">
                        <div class="content_fields_row">
                            <div class="property_multimedia">
                                <h3 class="tab_title">Multimedia</h3>
                                <div class="content_gallery_images full_size">
                                    <label class="label_property_title">Planimetria</label>
                                    <div id="galleria" class="row_galleria">
                                        <div class="col-sm-2 imgUp">
                                            <div class="ImagePreview"></div>
                                            <label class="btn-upload">Aggiungi Planimetria<input type="file" class="uploadFile img" name="planimetria-1" style="width: 0px; height: 0px; overflow: hidden;"></label>
                                            <input id="valore" type="hidden" name="valore" value="1">
                                        </div>
                                        <i class="fa fa-plus imgAdd"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="div_button_submit">
                            <input type="submit" value="Aggiungi">
                        </div>
                    </div>
                </div>

            </form>
        </div>
    </div>
</section>

<script>
    let sidebar = document.querySelector(".sidebar");
    let closeBtn = document.querySelector("#btn");
    let searchBtn = document.querySelector(".bx-search");

    closeBtn.addEventListener("click", ()=>{
        sidebar.classList.toggle("open");
        menuBtnChange();//calling the function(optional)
    });

    searchBtn.addEventListener("click", ()=>{ // Sidebar open when you click on the search iocn
        sidebar.classList.toggle("open");
        menuBtnChange(); //calling the function(optional)
    });

    // following are the code to change sidebar button(optional)
    function menuBtnChange() {
        if(sidebar.classList.contains("open")){
            closeBtn.classList.replace("bx-menu", "bx-menu-alt-right");//replacing the iocns class
        }else {
            closeBtn.classList.replace("bx-menu-alt-right","bx-menu");//replacing the iocns class
        }
    }
</script>

<script>
    $(".imgAdd").click(function(){
        var valore = document.getElementById("valore").value;
        var sium = parseInt(valore) + 1;
        console.log("valore " + sium)
        $(this).closest(".row_galleria").find('.imgAdd').before('<div class="col-sm-2 imgUp"><div class="imagePreview"></div><label class="btn-upload">Aggiungi Planimetria<input type="file" class="uploadFile img" name="planimetria-'+sium+'" style="width:0px;height:0px;overflow:hidden;"></label><i class="fa fa-times del"></i></div>');
        document.getElementById("valore").value = sium;
    });
    $(document).on("click", "i.del" , function() {
        document.getElementById("valore").value = document.getElementById("valore").value - 1;
        $(this).parent().remove();
        console.log(document.getElementById("valore").value);
    });
    $(function() {
        $(document).on("change",".uploadFile", function()
        {
            var uploadFile = $(this);
            var files = !!this.files ? this.files : [];
            if (!files.length || !window.FileReader) return; // no file selected, or no FileReader support
            var nome = files[0].name;
            console.log(nome.substring(nome.lastIndexOf('.') + 1));
            var ext = nome.substring(nome.lastIndexOf('.') + 1);
            if (
                ext == "pdf"){ // only image file
                var reader = new FileReader(); // instance of the FileReader
                reader.readAsDataURL(files[0]); // read the local file

                reader.onloadend = function(){ // set image data as background of div
                    //alert(uploadFile.closest(".upimage").find('.imagePreview').length);
                    uploadFile.closest(".imgUp").find('.imagePreview').css("background-image", "url(images/pdf.png)");
                }
            }

        });
    });
</script>


<script src="script/index.js"></script>
<script src="bootstrap/js/jquery-3.3.1.min.js"></script>
<script src="bootstrap/js/popper.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="bootstrap/js/jquery.sticky.js"></script>

</body>
</html>
