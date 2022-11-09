document.addEventListener("DOMContentLoaded", () => {
	$("#create_address_form").on("submit", function (e) {
		e.preventDefault();

		let create_address_form = $(this);

		$.post(create_address_form.attr("action"), create_address_form.serialize(), function (create_address_form_response) {
			if (create_address_form_response.status){
				$("#addresses_list").append(create_address_form_response.address_card);
				$("#add_address_modal").modal("hide");
			}
		});
	});
});