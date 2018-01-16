<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>	


<!DOCTYPE html>
<jsp:include page="_head.jsp"></jsp:include>

<body>
	
	
	<div class="container-site">
	

	<jsp:include page="_header.jsp"></jsp:include>

	<main id="container-box"> <!-- Navigation -->
	<div class="sorting">
		<button class="js-sorting sorting-btn" id="bottone-prezzo" data-label="Prezzo" data-sorting="price" data-order="asc">Prezzo</button>
		<button class="js-sorting sorting-btn" id="bottone-data" data-label="Data" data-sorting="date" data-order="asc">Data</button>
	</div>	

	<div class="entries js-annunci">
	
	</div>
	</main>
	
	<jsp:include page="_footer.jsp"></jsp:include>
	</div>
	
	
</body>
