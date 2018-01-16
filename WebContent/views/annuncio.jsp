<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<jsp:include page="_head.jsp"></jsp:include>

<body>
	<jsp:include page="_header.jsp"></jsp:include>

	<div class="container-site">

		<nav id="nav-bar-mobile"
			class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
			<div class="container">
				<a id="brand-site" class="navbar-brand js-scroll-trigger"
					href="/JobAdvisorNew/index.jsp"> <img id="logo-site"
					src="/JobAdvisorNew/img/gps.png"> <strong id="site-title">JOB
						ADVISOR</strong>
				</a> <span onclick="appearLogin()" id="login-img" class="fa fa-user">
				</span>
			</div>
		</nav>

		<main id="container-box"> <!-- Navigation -->



		<div class="annuncio js-oriva"></div>

		</main>
		<jsp:include page="_footer.jsp"></jsp:include>
	</div>

</body>