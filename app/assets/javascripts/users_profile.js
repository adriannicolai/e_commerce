document.addEventListener("DOMContentLoaded", () => {
    /* On user click navigation */
    $(".profile_redirect_button").on("click", function (e) {
        e.preventDefault();
        let href = $(this).attr("href");

        console.log('href :>> ', href);
    });
});
