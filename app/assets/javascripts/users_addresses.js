document.addEventListener("DOMContentLoaded", () => {
	/* Create a new address */
	$("#create_address_form").on("submit", function (e) {
		e.preventDefault();

		let create_address_form = $(this);

		$.post(create_address_form.attr("action"), create_address_form.serialize(), function (create_address_form_response) {
			if (create_address_form_response.status){
				$("#addresses_list").append(create_address_form_response.address_card);
				$("#add_address_modal").modal("hide");
			}
		});

		create_address_form.trigger("reset");
	});

	/* Set the address route for deletion */
	$(".delete_address").on("click", function (e) {
		e.preventDefault();

		$("#delete_address_modal").modal("show");

		let address_id = $(this).closest(".address_card").data("address_id");
		$("#delete_address_form").attr("action", `/api/addresses/${address_id}`);
	});

	/* Delete the address */
	$("#confirm_delete_address_button").on("click", function() {
		let delete_address_form = $("#delete_address_form");
		$.ajax({
			url: delete_address_form.attr("action"),
			type: "DELETE",
			data: delete_address_form.serialize(),
			success: function(delete_address_response) {
				if (delete_address_response.status){
					$(`.address_${delete_address_response.address_id}`).remove();
				}

				$("#delete_address_modal").modal("hide");
			}
		})
	});
});