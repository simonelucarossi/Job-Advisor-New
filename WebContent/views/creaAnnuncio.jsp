<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script src="../js/jquery-3.2.1.min.js"></script>
<script src="../vendor/bootstrap/js/bootstrap.min.js"></script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBqNtHjb8e1Shen-Pimqrv9xIIUs8nqZII&callback=initMap"></script>
<script src="../js/creaAnnuncio.js"></script>

<link rel="stylesheet" type="text/css" href="../css/adsCreationForm.css">
<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb"
	crossorigin="anonymous">


<!-- Custom fonts for this template -->
<link href="vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic"
	rel="stylesheet" type="text/css">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>JobAdvisor ~ Create new Ad</title>
</head>
<body>
	<h2><strong>Create your own Ad</strong></h2>
	<form action="createAd" method="post" id="ads_creation_form" onsubmit="return setDate()">
		<div class="form-group col-md-6">
			<label id="categoryLabel" for="inputCategory">Category</label>
			<input name="category" type="text" class="form-control" id="inputCategory" placeholder="Category..." required>
			<input name="lat" type="hidden" id="my-lat"> 
			<input name="lon" type="hidden" id="my-lon">
			<input name="creator" value="${utente.username}" type="hidden" id="creator">
		</div>

		<div class="form-group">
			<label id="descrip-label" for="inputDescription">Description</label>
			<textarea rows="20" cols="10" name="description" class="form-control" id="inputDescription" required>Insert a description...</textarea>
		</div>
		<div class="form-group col-md-6">
			<label id="priceLabel" for="inputPrice">Job-price</label> 
			<input name="price" type="number" step="0.01" min="5" class="form-control" id="inputPrice" placeholder="Insert a price..." required>
		</div>
		<div id="map">
		</div>
		<button type="submit" class="btn btn-primary">Create Ad</button>
		<input id="date" name="date" type="hidden">
	</form>
</body>
</html>