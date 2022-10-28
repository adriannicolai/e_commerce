document.addEventListener("DOMContentLoaded", function () {
	$("#signup").on("click", (e) => {
		e.preventDefault();

		let signup_form = $("#signup");

		$.post(signup_form.attr("action"), signup_form.serialize(), (signup_form_response) => {

		});
	});
});
