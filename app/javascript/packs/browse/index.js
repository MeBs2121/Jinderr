$(function () {
  const browsing = $("#browsing");
  const convo = $("#convo");
  const details = $("#details");

  $("#message-tab").on("click", function () {
    $(".message_item").on("click", function () {
      let accountId = $(this).data("account-id");
      browsing.hide();
      convo.show();
      details.show();
    });
  });

  $("#close-convo").on("click", function () {
    browsing.show();
    convo.hide();
    details.hide();
  });

  var slides = document.querySelectorAll("#slides .slide");
  var currentSlide = 0;
  // var slideInterval = setInterval(nextSlide, 500);
  $("#like").on("click", nextSlide);

  function nextSlide() {
    console.log("Next Slide!");
    slides[currentSlide].className = "slide";
    currentSlide = (currentSlide + 1) % slides.length;
    slides[currentSlide].className = "slide showing";
  }
});
