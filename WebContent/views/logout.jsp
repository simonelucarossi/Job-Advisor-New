<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %> 
<jsp:useBean id="user" class="com.jobadvisor.model.Utente" scope="request" />
<jsp:setProperty name="user" property="nome" value="un Nome"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Job Advisor ~ Home</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"
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

<!-- Plugin CSS -->
<link href="vendor/magnific-popup/magnific-popup.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/creative.min.css" rel="stylesheet">


</head>

<body id="page-top" style="display:none;">
	<div class="container-site">
	<!-- Navigation -->
	<nav id="nav-bar-mobile"
	class="navbar navbar-expand-lg navbar-light fixed-top">
	<div class="container">
		<a id="brand-site" class="navbar-brand js-scroll-trigger"
			href="/JobAdvisorNew"> <img id="logo-site" src="/JobAdvisorNew/img/gps.png">
			<strong id="site-title">JOB ADVISOR</strong>
		</a>
	</div>
	</nav>
	

	<header class="masthead text-center text-white d-flex">
		<div class="container my-auto">
			<div class="row">
				<div id="myDiv1" style="display:none;" class="col-lg-10 mx-auto">
				<img id="logo-header" src="img/check.png" />
			</div>
			<div id="myDiv2" style="display:none;" class="col-lg-8 mx-auto">
					<hr>
					<p id="myp" class="text-faded mb-5"><strong>You have successfully logged out<br>Come back to visit us again!</strong></p>
			</div>
			</div>
		</div>
	</header>



	<jsp:include page="_footer.jsp"></jsp:include>
	</div>
	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Plugin JavaScript -->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>
	<script src="vendor/scrollreveal/scrollreveal.min.js"></script>
	<script src="vendor/magnific-popup/jquery.magnific-popup.min.js"></script>

	<!-- Custom scripts for this template -->
	<script src="js/creative.min.js"></script>
	<script type='text/javascript' src="/JobAdvisorNew/js/home.js"></script>
	<script type="text/javascript">
		$(document).ready(function () {
			setTimeout("$('#myDiv1').fadeIn(1000);",2000);
			$('#myDiv2').slideDown('slow')
		});
	</script>
</body>
</html>