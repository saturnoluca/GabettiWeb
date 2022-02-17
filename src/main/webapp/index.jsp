<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form method="post"  enctype="multipart/form-data" action="Servlet">
	<input type="hidden" name="action" value="img"/>
	<img id="immagineOpera" style="color:grey"alt="sostituire immagine">
	<label>Immagine
		<input type="file" class="form-control" name="immagine" id="loadFileImg" placeholder="" multiple>
	</label>
	<button type="submit" class="btn btn-primary">Invia dati</button>
</form>
<form method="post"  enctype="multipart/form-data" action="Servlet">
	<input type="hidden" name="action" value="video"/>
	<img id="videoOpera" style="color:grey"alt="sostituire video">
	<label>Video
		<input type="file" class="form-control" name="video" id="loadFileVideo" placeholder="" multiple>
	</label>
	<button type="submit" class="btn btn-primary">Invia dati</button>
</form>
</body>
</html>