document.addEventListener("DOMContentLoaded", function () {
	/* On user signup */
	$("#signup_button").on("click", (e) => {
		e.preventDefault();

		let signup_form = $("#signup_form");

		$.post(signup_form.attr("action"), signup_form.serialize(), (signup_form_response) => {
			if(signup_form_response.status){
				window.location.href = "/";
			}
		});
	});
});
