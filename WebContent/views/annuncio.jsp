<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<jsp:include page="_head.jsp"></jsp:include>

<body>

	<div class="container-site">




	<jsp:include page="_header.jsp"></jsp:include>
	
		<main id="container-box"> <!-- Navigation -->

		<div class="annuncio js-oriva"></div>

		</main>
		<jsp:include page="_footer.jsp"></jsp:include>

		<!-- FADEBOX -->
		<div id="fade-box"
			style="width: 100%; height: 100%; z-index: 9999; background-color: black; top: 0px; left: 0px; right: 0px; position: fixed; opacity: 0.8;">
		</div>
		<!-- FINE FADEBOX -->

		<!-- REVIEW HTML -->

		<div class="review-box" class="wrapper">
			<div class="review-form">
				<div class="row" id="post-review-box">
					<div class="col-md-12">
						<form class="form-review" accept-charset="UTF-8" action=""
							method="post">
							<input name="creator" value="${username}" type="hidden"
								id="creator">
							<h2 id="title-form-review">Leave a review</h2>
							<input name="title" type="text" class="form-control"
								id="inputTitle" placeholder="Enter title">
							<textarea class="form-control animated" cols="50" id="new-review"
								name="testo" placeholder="Enter your review here..." rows="5"></textarea>
							<div class="star-rating">
								<label for="input-1" class="control-label">Give a rating
									for Skill:</label> <input id="input-1" name="input-1"
									class="rating rating-loading" data-min="0" data-max="5"
									data-step="1.0" value="2">
							</div>
							<div class="text-right">
								<button id="cancel-review-button" class="btn btn-danger"
									type="button">Cancel</button>
								<button id="send-review-button" class="btn btn-success btn-lg"
									type="submit">Send</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- END REVIEW BOX HTML -->
		<!-- REVIEW HTML -->
		<div class="contact-box" class="wrapper">
			<div class="contact-info-box">
				<div class="contact-info">
					<h2 id="contact-title">Contact Pro</h2>
					<div id="contact-email">
						<span class="glyphicon glyphicon-envelope"></span>
						<p>${email}</p>
					</div>
					<div id="contact-number">
						<span class="glyphicon glyphicon-earphone"></span>
						<p>${number}</p>
					</div>
					<button id="contact-button" class="btn btn-danger">Close</button>
				</div>
			</div>
		</div>
		<!-- END REVIEW BOX HTML -->
		<script>
			$("#input-id").rating();
		</script>
		<script src="/JobAdvisorNew/js/annuncio.js"></script>
	</div>
	<!-- LOGIN HTML -->
	
	<div id="login-box" class="wrapper">
		<form id="login-form" class="form-signin" action="login" method="post">
			<!-- LOGIN -->
			<h2 id="login-title" class="form-signin-heading">LOGIN</h2>
			<a><h2 id="exit-button">x</h2></a> <img id="logo-site-login"
				src="/JobAdvisorNew/img/gps.png"> <input id="usernameL" type="text"
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
			<a class="dropdown-item" href="/JobAdvisorNew/views/subscription.jsp">New
				around here? Sign up</a>
		</form>
	</div>
	<!-- END LOGIN HTML -->
</body>