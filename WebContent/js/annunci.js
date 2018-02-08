var getUrlParameter = function getUrlParameter(sParam) {
	var sPageURL = window.location.search.substring(1);
	var sURLVariables = sPageURL.split('&');
	for (var i = 0; i < sURLVariables.length; i++)
	{
		var sParameterName = sURLVariables[i].split('=');
		if (sParameterName[0] == sParam)
		{
			return sParameterName[1];
		}
	}
	
};

$(document).ready(function() {
	var $annunci = $(".js-annunci");
	if($annunci.length > 0) {
		var source = $("#annuncio-template").html();
		var template = Handlebars.compile(source);
		var categorySearch = getUrlParameter('category');
		console.log(categorySearch);

		var result = $.ajax({
			method: "GET",
			url: "/JobAdvisorNew/api/ads",
			dataType: "json",
			data: {category: categorySearch}
		});

		result.done(function(annunci) {
			annunci.forEach(function(annuncio) {
				$annunci.append(template(annuncio));
			});
		});
	}

	$(".js-sorting").click(function(ev) {
		$(".js-annunci").empty();
		var $this = $(this);

		var sorting = $this.data("sorting");
		var order   = $this.data("order");

		if(order == "asc") {
			$this.data("order", "desc");
			$this.html($this.data("label") + " (asc)");
		} else {
			$this.data("order", "asc");
			$this.html($this.data("label") + " (desc)");
		}

		
		
		var result = $.ajax({
			method: "GET",
			url: "/JobAdvisorNew/api/ads",
			data: {sorting: sorting, order: order, category: categorySearch},
			dataType: "json"
		});

		result.done(function(annunci) {
			annunci.forEach(function(annuncio) {
				$annunci.append(template(annuncio));
			});
		});

	});
});



$(document).ready(function() {
	var $annuncio = $(".js-oriva");
	var source = $("#annuncio-details").html();
	var template = Handlebars.compile(source);
	var url = window.location.pathname;
	var id = url.substring(url.lastIndexOf('/') + 1);

	var result = $.ajax({
		method: "GET",
		url: "/JobAdvisorNew/api/annuncio/" + id,
		dataType: "json"
	});

	result.done(function(annuncio) { 
		var login = $("meta#login-user");
		if(login.length > 0) {annuncio.loggedin = true}
		$annuncio.append(template(annuncio));

		var $map = $annuncio.find("#map");
		if($map.length > 0) {
			GMaps.initialize($map);
		}
		
			var $recensioni = $(".js-roriva");
			var source2 = $("#review-details").html();
			var template2 = Handlebars.compile(source2);
			var url2 = window.location.pathname;
			var id2 = url.substring(url2.lastIndexOf('/') + 1);

			var result2 = $.ajax({
				method: "GET",
				url: "/JobAdvisorNew/api/review/" + id2,
				dataType: "json"
			});

			result2.done(function(recensioni) {
				recensioni.forEach(function(recensione) {
					$recensioni.append(template2(recensione));
				});
			});
	});
});




/* REVIEW BOX OF ANNUNCIO */
$('input.my_class').rating({
	  clearable: true
	});