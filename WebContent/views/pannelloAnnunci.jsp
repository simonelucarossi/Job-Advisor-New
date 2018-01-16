<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<jsp:include page="_head.jsp"></jsp:include>

<body style="background-color: #4e4a4a;">
	<jsp:include page="_header_dropdown.jsp"></jsp:include>
	<div class="container-site">
	<main id="container-box"> <!-- Navigation -->
	
	<script>
	$('[data-toggle=dropdown]').each(function() {
	    this.addEventListener('click', function() {}, false);
	});
	</script>
	

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
</main>

	<footer>
			<span id="emailFooter" class="fa fa-envelope"></span> <span
				id="facebookFooter" class="fa fa-thumbs-up"></span> <span
				id="adsFooter" class="fa fa-bullhorn"></span>

	</footer> 
	</div>
</body>
