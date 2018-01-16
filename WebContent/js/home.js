/**
 * 
 */

$(document).ready(function () {

		$("body").fadeIn(1000);
	
		$("#form-search").hide();
		$("#login-box").hide();
		$("#fade-box").hide();

		$("#login-img").on('click', function() {
			$("#usernameL").val('');
			$("#passwordL").val('');
			$("#login-box").show("slow");
			$("#fade-box").show("slow");
		});

		$("#exit-button").click(function() {
			$("#login-box").slideToggle("fast");
			$("#fade-box").slideToggle("fast");
		});
		
		$("#button-search").click(function () {
			$("#button-search").hide("fast");
			$("#form-search").show("slow");
		});
	
});
