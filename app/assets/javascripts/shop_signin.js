document.addEventListener("DOMContentLoaded", () => {
    /* On user signin */
    $("#signin_button").on("click", (e) => {
        e.preventDefault();

        let signin_form = $("#signin_form");

        $.post(signin_form.attr("action"), signin_form.serialize(), (signin_form_response) => {
            if (signin_form_response.status) {
                window.location.href = "/";
            }
        });
    });
});
