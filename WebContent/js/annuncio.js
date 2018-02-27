$(document).ready(function () {
	
		$(".contact-box").hide();
		$(".review-box").hide();
		$("#fade-box").hide();

});

function prova() {
	$("#contatta-bottone").on('click', function() {
		$(".contact-box").slideDown();
		$("#fade-box").slideDown();
	});
	
	$("#recensione-bottone").on('click', function() {
		$(".review-box").slideDown();
		$("#fade-box").slideDown();
	});



	$("#contact-button").click(function() {
		$(".contact-box").slideToggle("fast");
		$("#fade-box").slideToggle("fast");
	});

	$("#cancel-review-button").click(function () {
		$(".review-box").slideToggle("slow");
		$("#fade-box").slideToggle("slow");
	});
};
