/**
 * 
 */

$(document).ready(function() {

	$('[data-toggle="tooltip"]').tooltip();

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
	
	 $('#createForm').on('submit', function (e) {
         e.preventDefault();

         $.ajax({
           type: 'post',
           url: '/JobAdvisorNew/subscribe',
           data: $('#createForm').serialize(),
           success: function () {
        	   location.reload();
           }
         });

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
	           url: "/JobAdvisorNew/deleteUser",
	           dataType: 'json',
	           data: {
	        	   myCheckboxes: JSON.stringify(myCheckboxes)
	           },
	           error: function (data) {
	        	   location.reload();
	           }
	         });

	    e.preventDefault(); 
	});
	
	$('.edit').click(function(e) {
		 var username= $(this).closest("tr").find("td").eq(1).text();
		 $.ajax({
			 method: "GET",
				url: "/JobAdvisorNew/api/user/" + username,
				dataType: "json",
				success: function (result) {
					$('input[name=username]').val(username);
					$('input[name=name]').val(result.nome);
					$('textarea[name=surname]').val(result.cognome);
					$('input[name=data]').val(result.data_nascita);
					$('input[name=occupation]').val(result.tipo);
					$('input[name=email]').val(result.email);
					$('input[name=phone]').val(result.telefono);
					$('input[name=password]').val(result.password);
	           }
	         });
		 $("#saveButton").click(function name() {
			 $.ajax({
				 method: "POST",
					url: "/JobAdvisorNew/updateUser",
					data:$("#editForm").serialize(),
					success: function (result) {
						location.reload();
		           }
		         });
		 });
	});
	
//	$("#showMyUser").click(function(e) {
//		 var username = $(this).closest("tr").find("td").eq(1).text();
//		 $.ajax({
//			 method: "GET",
//				url: "/JobAdvisorNew/api/user/" + username,
//				dataType: "json",
//				success: function (result) {
//					$('input[name=nome]').val(id);
//					$('input[name=cognome]').val(result.categoria);
//					$('textarea[name=description]').val(result.descrizione);
//					$('input[name=price]').val(result.prezzo);
//					$('input[name=date]').val(result.data);
//	           }
//	         });
//	});
	
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
