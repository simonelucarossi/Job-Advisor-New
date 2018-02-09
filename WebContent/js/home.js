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

	if (navigator.geolocation) {
		navigator.geolocation.getCurrentPosition(function (position) {
			$("#my-lat").val(position.coords.latitude);
			$("#my-lon").val(position.coords.longitude);
		});
	}

});

window.addEventListener('load', function() {

	function updateOnlineStatus(event) {
		var condition = navigator.onLine ? "online" : "offline";

		alert('you are ${condition}');

	}
	window.addEventListener('online',  updateOnlineStatus);
	window.addEventListener('offline', updateOnlineStatus);
});
