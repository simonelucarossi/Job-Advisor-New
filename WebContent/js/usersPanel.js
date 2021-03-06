/**
 * 
 */

window.setInterval(function(){
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1; 
	var yyyy = today.getFullYear();

	if(dd<10){dd='0'+dd} 
	if(mm<10){mm='0'+mm} 
	today = yyyy+'-'+mm+'-'+dd; 
	$("#blackList tbody tr").each(function() {
		  $this = $(this);
		  banDate=$this.find('td:last').text();
		  if(banDate <= today){
			  $this.find(":checkbox").prop('checked',true);
		  }
	});
	
	var toDelete=[];
	$("#modalContent").find(":checkbox").each(function() {
		var ischecked = $(this).is(":checked");
        if (ischecked) {
        	toDelete.push($(this).val());
        	$(this).closest('tr').remove();
        }
	});
	
	$.ajax({
		type: "POST",
		url: "/JobAdvisorNew/eraseBan",
		dataType: 'json',
		data: {
			toDelete: JSON.stringify(toDelete)
		},
		error: function (data) {
			alert("Some users ban time is expired, so they were removed from list!")
		}
	});
	
}, 60000);


$(document).ready(function() {

	$('#myTable').on( 'click', 'thead th', function () {
	  var col = $(this).index();
	  var rows = $('#myTable tbody tr').get();
	  rows.sort(function(a, b) {

		  var A = $(a).children('td').eq(col).text().toUpperCase();
		  var B = $(b).children('td').eq(col).text().toUpperCase();

		  if(A < B) {
		    return -1;
		  }

		  if(A > B) {
		    return 1;
		  }

		  return 0;

	  });

	  $.each(rows, function(index, row) {
	    $('#myTable').children('tbody').append(row);
	  });
		
	});
	
	$('[data-toggle="tooltip"]').tooltip();

	$('#selectAll').click(function(e){
	    var table= $(e.target).closest('table');
	    $('td input:checkbox',table).prop('checked',this.checked);
	});
	
	$('#selectAllList').click(function(e){
	    var table= $(e.target).closest('table');
	    $('td input:checkbox',table).prop('checked',this.checked);
	});
	
	 $("#confirm").keyup( function checkPasswordMatch() {
		    var password = $("#password").val();
		    var confirmPassword = $("#confirm").val();

		    if (password != confirmPassword)
		        $("#passDiv").html("Passwords do not match!").css('color', 'red');
		    else
		        $("#passDiv").html("Passwords match!").css('color', 'green');
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
		
		if(myCheckboxes[0] === "on")
			myCheckboxes.shift();
		
		if(myCheckboxes.length > 0){
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
		}else{
			alert("No user selected,please select at least one user and retry!");	
		}
	});
	
	$("#banButton").click(function(e) {
		var myCheckboxes = [];
		$(":checkbox").each(function() {
			var ischecked = $(this).is(":checked");
	        if (ischecked) {
	            myCheckboxes.push($(this).val());
	        }
		});
		
		var today = new Date();
		var dd = today.getDate();
		var mm = today.getMonth()+1; 
		var yyyy = today.getFullYear();

		if(dd<10){dd='0'+dd} 
		if(mm<10){mm='0'+mm} 
		today = yyyy+'-'+mm+'-'+dd; 
		
		if(myCheckboxes.length > 0){
			$.ajax({
				type: "POST",
				url: "/JobAdvisorNew/banUser",
				dataType: 'json',
				data: {
					myCheckboxes: JSON.stringify(myCheckboxes),
					time : $('#banTime').val(),
					date : today
				},
				error: function (data) {
					location.reload();
				}
			});
			
			e.preventDefault(); 
		}else{
			alert("No user selected,please select at least one user and retry!");
		}
	});
	
	$('.edit').click(function(e) {
		 var username= $(this).closest("tr").find("td").eq(1).text();
		 $.ajax({
			 method: "GET",
				url: "/JobAdvisorNew/api/user/" + username,
				dataType: 'json',
				success: function (result) {
					$('input[name=username]').val(username);
					$('input[name=name]').val(result.nome);
					$('input[name=surname]').val(result.cognome);
					$('input[name=gender]').val(result.sesso);
					$('input[name=data]').val(result.data_nascita);
					$('input[name=tipo]').val(result.tipo);
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
	
	$("td:last-child").click(function(e) {
		 var username = $(this).closest("tr").find("td").eq(1).text();
		 $.ajax({
			 method: "GET",
				url: "/JobAdvisorNew/api/user/" + username,
				dataType: 'json',
				success: function (result) {
					$('input[name=username]').val(username);
					$('input[name=name]').val(result.nome);
					$('input[name=surname]').val(result.cognome);
					if(result.sesso === "M")
						$('input[name=gender]').val("Male");
					else
						$('input[name=gender]').val("Female");	
					$('input[name=data]').val(result.data_nascita);
					$('input[name=tipo]').val(result.tipo);
					$('input[name=email]').val(result.email);
					$('input[name=phone]').val(result.telefono);
					$('input[name=password]').val(result.password);
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
	
	$('#blackListButton').click(function name() {
		 $.ajax({
			 method: "GET",
				url: "/JobAdvisorNew/getBanned",
				dataType: 'json',
				success: function (response) {
					$('#blackList').find("tr:gt(0)").remove();
					$.each(response, function(i, item) {
				        var $tr = $('<tr>').append(
				        	$("<td>").html('<span class="custom-checkbox"> <input type="checkbox" id="checkbox1"> <label for="checkbox1"></label></span>'),	
				        	$('<td>').text(item.username),
				            $('<td>').text(item.fineBan)
				        ); 
				       $('#blackList').append($tr);
				       $('tr:last').find(":checkbox").val(item.username);
				    });
	           }
	         });
	});

	$("#deleteFromList").click(function(e) {
		var myCheckboxes = [];
		$("#modalContent").find(":checkbox").each(function() {
			var ischecked = $(this).is(":checked");
	        if (ischecked) {
	            myCheckboxes.push($(this).val());
	        }
		});
		
		if(myCheckboxes[0] === "on")
			myCheckboxes.shift();
		
		if(myCheckboxes.length > 0){
			$.ajax({
				type: "POST",
				url: "/JobAdvisorNew/eraseBan",
				dataType: 'json',
				data: {
					myCheckboxes: JSON.stringify(myCheckboxes)
				},
				error: function (data) {
					location.reload();
				}
			});
			
			e.preventDefault(); 
		}else{
			alert("No user selected,please select at least one user and retry!");
		}
	});
	
    $("#sidebar-wrapper").hover(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
	
});

