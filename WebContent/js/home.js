/**
 * 
 */

$(document).ready(function () {

		$("body").fadeIn(500);
	
		$("#form-search").hide();
		$("#login-box").hide();
		$("#fade-box").hide();

		$("#myp").slideDown("slow");
		
		$("#login-img").on('click', function() {
			$("#usernameL").val('');
			$("#passwordL").val('');
			$("#login-box").slideDown();
			$("#fade-box").slideDown();
		});

		$("#exit-button").click(function() {
			$("#login-box").slideToggle("fast");
			$("#fade-box").slideToggle("fast");
		});
		
		$("#button-search").click(function () {
			$("#button-search").hide("fast");
			$("#form-search").show("slow");
		});
		
		$("#login-form").submit(function(e) {

		    var url = "/JobAdvisorNew/login"; 
		    $.ajax({
		           type: "POST",
		           url: url,
		           data: $("#login-form").serialize(),
		           success: function(response)
		           {
		        	if(response == "login_failed"){
		        		$("#usernameL").val('');
		        		$("#passwordL").val('');
		        		$("#login-box").show("slow");
		        		$("#fade-box").show("slow");
		        		$("#logo-site-login").after("<p style=\"color:red;\">Incorrect username or password!</p>");
		        	}else{
		        		document.location.href="index.jsp";
		        	}
		           }
		         });

		    e.preventDefault(); // avoid to execute the actual submit of the form.
		});
	
});
