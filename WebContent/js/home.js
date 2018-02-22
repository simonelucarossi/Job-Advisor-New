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
			$(function() {
			    if (localStorage.chkbx && localStorage.chkbx != '') {
			        $('#rememberMe').attr('checked', 'checked');
			        $('#usernameL').val(localStorage.usrname);
			        $('#passwordL').val(localStorage.pass);
			    } else {
			        $('#rememberMe').removeAttr('checked');
			        $('#usernameL').val('');
			        $('#passwordL').val('');
			    }

			    $('#login-form').click(function() {
			        if ($('#rememberMe').is(':checked')) {
			            // save username and password
			            localStorage.usrname = $('#usernameL').val();
			            localStorage.pass = $('#passwordL').val();
			            localStorage.chkbx = $('#rememberMe').val();
			        } else {
			            localStorage.usrname = '';
			            localStorage.pass = '';
			            localStorage.chkbx = '';
			        }
			    });
			});

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
		        	 $("#message").remove();
		        	if(response == "login_failed"){
		        		$("#usernameL").val('');
		        		$("#passwordL").val('');
		        		$("#login-box").show("slow");
		        		$("#fade-box").show("slow");
		        		$("#logo-site-login").after("<p id=\"message\" style=\"color:red;\">Incorrect username or password!</p>");
		        	}else if(response == "user_banned"){
		        		$("#usernameL").val('');
		        		$("#passwordL").val('');
		        		$("#login-box").show("slow");
		        		$("#fade-box").show("slow");
		        		$("#logo-site-login").after("<p id=\"message\" style=\"color:red;\">Sorry but you cannot access!</p>");
		        	}else{
		        		document.location.reload();
		        	}
		           }
		         });

		    e.preventDefault(); // avoid to execute the actual submit of the form.
		});
	
});

