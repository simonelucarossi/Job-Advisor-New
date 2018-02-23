<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<jsp:include page="_head.jsp"></jsp:include>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<body>


	<div class="container-site">


		<jsp:include page="_header.jsp"></jsp:include>

		<main id="container-box"> <!-- Navigation -->
		<form class="form-search form-inline">
			<input type="text" id="searchInput" class="search-query" placeholder="Search for name..">
		</form>
		<div class="sorting">
			<button class="js-sorting sorting-btn" id="bottone-prezzo"
				data-label="Prezzo" data-sorting="prezzo" data-order="asc">Price</button>
			<button class="js-sorting sorting-btn" id="bottone-valutazione"
				data-label="Valutazione" data-sorting="valutazione" data-order="asc">Rating</button>
			<button id="bottone-distanza"
				data-label="Distanza" data-sorting="distanza">Distance</button>	
		</div>

		<div class="entries js-annunci"></div>
		</main>

		<jsp:include page="_footer.jsp"></jsp:include>

	</div>

	<!-- FADEBOX -->
	<div id="fade-box"
		style="width: 100%; height: 100%; z-index: 9999; background-color: black; top: 0px; left: 0px; right: 0px; position: fixed; opacity: 0.8;">
	</div>
	<!-- FINE FADEBOX -->

	<!-- LOGIN HTML -->
	<div id="login-box" class="wrapper">
		<form id="login-form" class="form-signin" action="login" method="post" >
				<!-- LOGIN -->
				<h2 id="login-title" class="form-signin-heading">LOGIN</h2>
				<a><h2 id="exit-button">x</h2></a>
				<img id="logo-site-login" src="/JobAdvisorNew/img/gps.png"> 
				<input id="usernameL" type="text" class="form-control" name="username" placeholder="Username"
					required="" autofocus="" /> 
				<input id="passwordL" type="password"
					class="form-control" name="password" placeholder="Password"
					required="" /> 
					<label id="rememberL" class="checkbox">
				<input type="checkbox" value="remember-me" id="rememberMe"
					name="rememberMe"> Remember me
					</label>
				<button id="login-button-submit"
					class="btn btn-lg btn-primary btn-block" type="submit">Login
				</button>
				<div class="dropdown-divider"></div>
				  <a class="dropdown-item" href="/JobAdvisorNew/views/subscription.jsp">New around here? Sign up</a>
		</form>
	</div>
	<!-- END LOGIN HTML -->
</body>
