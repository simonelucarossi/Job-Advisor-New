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
		var $this = $(this);

		var sorting = $this.data("sorting");
		var order   = $this.data("order");

		if(order == "asc") {
			$this.data("order", "desc");
			$this.html($this.data("label") + " (decrescente)");
		} else {
			$this.data("order", "asc");
			$this.html($this.data("label") + " (ascendente)");
		}

		var result = $.ajax({
			method: "GET",
			url: "/JobAdvisorNew/api/ads",
			data: {sorting: sorting, order: order},
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
		$annuncio.append(template(annuncio));

		var $map = $annuncio.find("#map");
		if($map.length > 0) {
			GMaps.initialize($map);
		}
	});
});