<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<jsp:include page="_head.jsp"></jsp:include>

<body>

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

		<!-- FADEBOX -->
		<div id="fade-box"
			style="width: 100%; height: 100%; z-index: 9999; background-color: black; top: 0px; left: 0px; right: 0px; position: fixed; opacity: 0.8;">
		</div>
		<!-- FINE FADEBOX -->
		
		<!-- REVIEW HTML -->
		
		<div class="review-box" class="wrapper">
			<div class="review-form">
				<div class="row" id="post-review-box"">
					<div class="col-md-12">
						<form class="form-review" accept-charset="UTF-8" action="" method="post">
							<input name="creator" value="${username}" type="hidden" id="creator">
							<h2 id="title-form-review">Leave a review</h2>

							<input name="title" type="text" class="form-control" id="inputTitle"
								placeholder="Enter title">


							<textarea class="form-control animated" cols="50" id="new-review"
								name="testo" placeholder="Enter your review here..." rows="5"></textarea>

							<div class="star-rating">
								<label for="input-1" class="control-label">Give a rating
									for Skill:</label> <input id="input-1" name="input-1"
									class="rating rating-loading" data-min="0" data-max="5"
									data-step="1.0" value="2">
							</div>

							<div class="text-right">
								<button id="cancel-review-button" class="btn btn-danger" type="button">Cancel</button>
								<button id="send-review-button" class="btn btn-success btn-lg" type="submit">Send</button>
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
						<p><%=(String)request.getAttribute("email")%></p>
					</div>
					<div id="contact-number">
						<span class="glyphicon glyphicon-earphone"></span>
						<p><%=(String)request.getAttribute("number")%></p>
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

</body>