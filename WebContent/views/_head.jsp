<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<head>

<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css"
	rel="stylesheet">
<link href="/JobAdvisorNew/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb"
	crossorigin="anonymous">


<!-- Custom fonts for this template -->
<link href="/JobAdvisorNew/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic"
	rel="stylesheet" type="text/css">

<!-- Plugin CSS -->
<link href="/JobAdvisorNew/vendor/magnific-popup/magnific-popup.css"
	rel="stylesheet">

<link href="/JobAdvisorNew/css/annunci.css" rel="stylesheet">

<script src="/JobAdvisorNew/vendor/jquery/jquery.min.js"></script>
<script src="/JobAdvisorNew/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


<meta charset="UTF-8">
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">

<title>JobAdvisor ~ Ads</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="http://code.jquery.com/mobile/1.1.1/jquery.mobile-1.1.1.min.js"></script>
<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDe9jibJf963yX2fZCd6FLxYJzTljlhzhc"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.min.js"></script>
	
	<!-- This is for stars of Reviews -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-star-rating/4.0.2/css/star-rating.min.css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-star-rating/4.0.2/js/star-rating.min.js"></script>
	<!-- End -->

<script src="/JobAdvisorNew/js/annunci.js"></script>
<script src="/JobAdvisorNew/js/gmaps.js"></script>
<!-- Plugin JavaScript -->
<script src="/JobAdvisorNew/vendor/jquery-easing/jquery.easing.min.js"></script>
<script src="/JobAdvisorNew/vendor/scrollreveal/scrollreveal.min.js"></script>
<script src="/JobAdvisorNew/vendor/magnific-popup/jquery.magnific-popup.min.js"></script>

<jsp:include page="_handlebarsTemplates.jsp"></jsp:include>


<!-- Custom scripts for this template -->
<script src="/JobAdvisorNew/js/creative.min.js"></script>
<script type='text/javascript' src="/JobAdvisorNew/js/home.js"></script>



<!-- Login Meta -->
<c:if test="${utente != null}">
<meta data-user-name="${utente.username}" id="login-user">
</c:if>




</head>