<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<jsp:include page="_head.jsp"></jsp:include>

<body>
	<jsp:include page="_header.jsp"></jsp:include>

	<main id="container-box"> <!-- Navigation -->
	<nav id="nav-bar-mobile"
		class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
		<div class="container">
			<a id="brand-site" class="navbar-brand js-scroll-trigger"
				href="index.jsp"> <img id="logo-site" src="img/gps.png">
				<strong id="site-title">JOB ADVISOR</strong>
			</a> 
			<span onclick="appearLogin()" id="login-img" class="fa fa-user"></span>
			<div class="btn-group">
				  <button id="cong-funz" type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				   <span class="glyphicon glyphicon-cog"></span>
				  </button>
				  <div class="dropdown-menu">
				    <a class="dropdown-item" href="#">Action</a>
				    <a class="dropdown-item" href="#">Another action</a>
				    <a class="dropdown-item" href="#">Something else here</a>
				    <div class="dropdown-divider"></div>
				    <a class="dropdown-item" href="#">Separated link</a>
				  </div>
			</div>
		</div>
	</nav>

	<div class="entries">
		<c:forEach items="${annunci}" var="annuncio">
			<div class="entry">
				<div class="entry-details">
					<img id="image-entry" src="" />
					<h3 id="title-entry">${annuncio.getCategoria()}</h3>
					<p id="position-entry">${annuncio.getId()}</p>
				</div>

				<div class="help-entry">
					<div class="review-entries">
						<img class="review-entry" src="img/star.png" /><img
							class="review-entry" src="img/star.png" /><img
							class="review-entry" src="img/star.png" /><img
							class="review-entry" src="img/star.png" /><img
							class="review-entry" src="img/star.png" />
					</div>

					<div class="price-entries">
						<img class="price-entry" src="img/euro.png" /><img
							class="price-entry" src="img/euro.png" /><img
							class="price-entry" src="img/euro.png" /><img
							class="price-entry" src="img/euro.png" /><img
							class="price-entry" src="img/euro.png" />
					</div>
				</div>

			</div>
		</c:forEach>
	</div>


	<footer>
		<div id="icons-footer">
			<span id="emailFooter" class="fa fa-envelope"></span> <span
				id="facebookFooter" class="fa fa-thumbs-up"></span> <span
				id="adsFooter" class="fa fa-bullhorn"></span>

		</div>
	</footer> 
	</main>
</body>
