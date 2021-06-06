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
});
