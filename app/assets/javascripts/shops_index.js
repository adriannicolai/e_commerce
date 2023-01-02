document.addEventListener("DOMContentLoaded", () => {
  $(document)
    .on("click", "#outdent", (e) => {
      e.preventDefault();

      $("ul.header_navigation").addClass("active");
    })
    .on("click", "#close_header_navigation", (e) => {
      e.preventDefault();

      $("ul.header_navigation").removeClass("active");
    })
});