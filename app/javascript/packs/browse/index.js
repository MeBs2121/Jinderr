$(function () {
  const browsing = $("#browsing");
  const convo = $("#convo");
  const details = $("#details");

  $("#message-tab").on("click", function () {
    $(".message_item").on("click", function () {
      let accountId = $(this).data("account-id");
      console.log(accountId);
      openConvo();
    });
  });

  $("#close-convo").on("click", function () {
    closeConvo();
  });

  function openConvo() {
    browsing.hide();
    convo.show();
    details.show();
  }
  function closeConvo() {
    browsing.show();
    convo.hide();
    details.hide();
  }

  // スライド、ボタン
  var slides = document.querySelectorAll("#slides .slide");
  var currentSlide = 0;

  // ライクをクリックしたらフォローする
  $("#like").on("click", function () {
    const accountId = $(".showing").data("id");
    followAccount(accountId);
    nextSlide();
  });

  // // ディスライクをクリックしたらDislikeに追加
  // $("#dislike").on("click", function () {
  //   const accountId = $(".showing").data("id");
  //   dislikeAccount(accountId);
  //   nextSlide();
  // });

  // function dislikeAccount(id) {
  //   console.log(id);
  //   $.ajax({
  //     type: "GET", // リクエストのタイプ
  //     url: "/bad", // リクエストを送信するURL
  //     data: { account_id: id }, // サーバーに送信するデータ
  //     dataType: "json", // サーバーから返却される型
  //   });
  // }

  function followAccount(id) {
    console.log(id);
    $.ajax({
      type: "GET", // リクエストのタイプ
      url: "/good", // リクエストを送信するURL
      data: { account_id: id }, // サーバーに送信するデータ
      dataType: "json", // サーバーから返却される型
    }).done(function (data) {
      $("#good-message").empty();
      $("#good-message").append(`<p class="fs-4">Liked ${data.nickname}!</p>`);
    });
  }

  function nextSlide() {
    console.log("Next Slide!");
    slides[currentSlide].className = "slide";
    currentSlide = (currentSlide + 1) % slides.length;
    slides[currentSlide].className = "slide showing";
  }
});
