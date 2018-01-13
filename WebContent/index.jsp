<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %> 
<jsp:useBean id="user" class="com.jobadvisor.model.Utente" scope="request" />
<jsp:setProperty name="user" property="nome" value="un Nome"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>

<style type="text/css">
#logout,#ads_panel{
color: rgba(255, 255, 255, 0.7);
}
</style>

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


<!-- SCRIPT DISAPPEAR BUTTON -->
<script type='text/javascript'>
	function disappearButton() {
		document.getElementById("button-search").style.visibility="hidden";
		document.getElementById("form-search").style.visibility="visible";
	}
	function appearLogin() {
		document.getElementById("login-box").style.visibility="visible";
		document.getElementById("fade-box").style.visibility="visible";
	}
	function disappearLogin() {
		document.getElementById("login-box").style.visibility="hidden";
		document.getElementById("fade-box").style.visibility="hidden";
	}
</script>

</head>

<body id="page-top">

	<!-- Navigation -->
	<nav id="nav-bar-mobile" class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
		<div class="container">
			<a id="brand-site" class="navbar-brand js-scroll-trigger"
				href="#page-top"> <img id="logo-site" src="img/gps.png"> <strong
				id="site-title">JOB ADVISOR</strong>
			</a> 
			<div class="collapse navbar-collapse" id="navbarResponsive">
	          <ul class="navbar-nav ml-auto">
	            <li class="nav-item">
				<c:if test="${utente.tipo=='Professionista'}">
					<a id="ads_panel" class="nav-link js-scroll-trigger" href="adsPanel?username=${utente.username}">Ads Panel</a>
				</c:if>	
				</li>
				<li>
					<c:if test="${utente == null}">
					<span onclick="appearLogin()" id="login-img" class="fa fa-user"> </span>
					</c:if>
				</li>
				<li>
	            <c:if test="${utente != null }">
				 	<a id="logout" class="nav-link js-scroll-trigger" href="logout">Logout</a>
				</c:if>
	            </li>
	          </ul>
	        </div>
		</div>
	</nav>

	<header class="masthead text-center text-white d-flex">
		<div class="container my-auto">
			<div class="row">
				<div class="col-lg-10 mx-auto">
					<img id="logo-header" src="img/worker-icon.png" />
					<h1 class="text-uppercase">
						<strong> The place where you can find the right pro for
							your problem</strong>
					</h1>
					<hr>
				</div>
				<div class="col-lg-8 mx-auto">
					<p class="text-faded mb-5">JobAdvisor offers you the
						opportunity to publish your ad if you are a pro, but also to seek
						pro or companies in your area that can solve your problem!</p>
					<a onclick="disappearButton()" id="button-search"
						class="btn btn-primary btn-xl js-scroll-trigger" href="#about">Find
						Your Pro</a>

					<form id="form-search" style="visibility: hidden; margin-top: -30px;" action="ads" method="post">
						<div class="input-group">
							<input name="lat" type="hidden" id="my-lat">
							<input name="lon" type="hidden" id="my-lon">
							<input name="category" type="text" class="form-control" placeholder="Search your Pro's category...">
							<div class="input-group-btn">
								<button class="btn btn-default" type="submit">
									<span class="fa fa-search"></span>
								</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>


	</header>



	<footer>
		<div id="icons-footer">
			<span id="emailFooter" class="fa fa-envelope"></span> <span
				id="facebookFooter" class="fa fa-thumbs-up"></span> <span
				id="adsFooter" class="fa fa-bullhorn"></span>

		</div>
	</footer>

	<!-- LOGIN HTML -->
	<div id="fade-box"
		style="visibility: hidden; width: 100%; height: 100%; z-index: 9999; background-color: black; top: 0px; left: 0px; right: 0px; position: fixed; opacity: 0.8;">
	</div>
	<div id="login-box" class="wrapper" style="visibility: hidden;">
		<form class="form-signin" action="login" method="post" >
				<!-- LOGIN -->
				<h2 id="login-title" class="form-signin-heading">LOGIN</h2>
				<a onclick="disappearLogin()"><h2 id="exit-button">x</h2></a> 
				<img id="logo-site-login" src="img/gps.png"> <input id="usernameL" type="text"
					class="form-control" name="username" placeholder="Username"
					required="" autofocus="" /> <input id="passwordL" type="password"
					class="form-control" name="password" placeholder="Password"
					required="" /> <label id="rememberL" class="checkbox"> <input 
					type="checkbox" value="remember-me" id="rememberMe"
					name="rememberMe"> Remember me
				</label>
				<button id="login-button-submit"
					class="btn btn-lg btn-primary btn-block" type="submit">Login
				</button>
				<div class="dropdown-divider"></div>
				  <a class="dropdown-item" href="views/subscribe">New around here? Sign up</a>
		</form>
	</div>
	<!-- END LOGIN HTML -->

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Plugin JavaScript -->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>
	<script src="vendor/scrollreveal/scrollreveal.min.js"></script>
	<script src="vendor/magnific-popup/jquery.magnific-popup.min.js"></script>

	<!-- Custom scripts for this template -->
	<script src="js/creative.min.js"></script>
</body>
</html>