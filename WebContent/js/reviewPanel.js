$(document).ready(function() {
	// Activate tooltip
	$('[data-toggle="tooltip"]').tooltip();

	// Select/Deselect checkboxes
	var checkbox = $('table tbody input[type="checkbox"]');
	$("#selectAll").click(function() {
		if (this.checked) {
			checkbox.each(function() {
				this.checked = true;
			});
		} else {
			checkbox.each(function() {
				this.checked = false;
			});
		}
	});
	
	checkbox.click(function() {
		if (!this.checked) {
			$("#selectAll").prop("checked", false);
		}
	});
	
	
	
	$("#deleteButton").click(function(e) {
		var myCheckboxes = [];
		$(":checkbox").each(function() {
			var ischecked = $(this).is(":checked");
	        if (ischecked) {
	            myCheckboxes.push($(this).val());
	        }
		});
	    $.ajax({
	           type: "POST",
	           url: "/JobAdvisorNew/DeleteReview",
	           data: {
	        	   myCheckboxes: JSON.stringify(myCheckboxes)
	           },
	           success: function (result) {
					location.reload();
	           },
	           error: function (data) {
	        	  alert("Error");
	           }
	         });

	    e.preventDefault(); 
	});
	
	
	$('.editReview').click(function(e) {
		 var idTmp = $(this).closest("tr").find("td").eq(1).text();
		 var idAdsTmp = $(this).closest("tr").find("td").eq(5).text();
		 $.ajax({
			 method: "GET",
				url: "/JobAdvisorNew/api/singleReview/" + idTmp,
				dataType: "json",
				success: function (result) {
					$('#editForm input[name=id]').val(idTmp);
					$('#editForm input[name=title]').val(result.title);
					$('#editForm textarea[name=text]').val(result.testo);
					$('#editForm input[name=stars]').val(result.valutazione);
					$('#editForm input[name=idAds]').val(idAdsTmp);
	           }
	         });
		 $("#saveButton").click(function name() {
			
			 $.ajax({
				 method: "POST",
					url: "/JobAdvisorNew/UpdateReview",
					data: $("#editForm").serialize(),
					success: function (result) {
						location.reload();
		           } 
		         });
		 });
	});
	
	
	$("td:last-child").click(function(e) {
		 var id = $(this).closest("tr").find("td").eq(1).text();
		 var idAdsTmp = $(this).closest("tr").find("td").eq(5).text();
		 $.ajax({
			 method: "GET",
				url: "/JobAdvisorNew/api/singleReview/" + id,
				dataType: "json",
				success: function (result) {
					$('#showForm input[name=id]').val(id);
					$('#showForm input[name=title]').val(result.title);
					$('#showForm textarea[name=text]').val(result.testo);
					$('#showForm input[name=stars]').val(result.valutazione);
					$('#showForm input[name=date]').val(result.data);
					$('#editForm input[name=idAds]').val(idAdsTmp);
	           }
	         });
	});
	
	$("#searchInput").keyup(function () {
	    //split the current value of searchInput
	    var data = this.value.split(" ");
	    //create a jquery object of the rows
	    var jo = $('tbody').find("tr");
	    if (this.value == "") {
	        jo.show();
	        return;
	    }
	    //hide all the rows
	    jo.hide();

	    //Recusively filter the jquery object to get results.
	    jo.filter(function (i, v) {
	        var $t = $(this);
	        for (var d = 0; d < data.length; ++d) {
	            if ($t.is(":contains('" + data[d] + "')")) {
	                return true;
	            }
	        }
	        return false;
	    }).show();
	}).focus(function () {
	    this.value = "";
	    $(this).css({
	        "color": "black"
	    });
	    $(this).unbind('focus');
	}).css({
	    "color": "#C0C0C0"
	});
	
});