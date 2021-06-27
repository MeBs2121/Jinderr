$(function () {
  const browsing = $("#browsing");
  const convo = $("#convo");
  const details = $("#details");

  const element = document.getElementById("messages");

  $("#message-tab").on("click", function () {
    $(".message_item").on("click", function () {
      let roomId = $(this).data("room-id");
      // console.log(accountId);
      openConvo();
    });
  });

  $("#close-convo").on("click", function () {
    closeConvo();
  });

  function openConvo(roomId) {
    browsing.hide();
    convo.show();
    details.show();
    setTimeout(function(){
     mo.observe(element, config);
   },600);
  }

  function closeConvo() {
    browsing.show();
    convo.hide();
    details.hide();
    mo.disconnect();
  }

  // スライド、ボタン
  var slides = document.querySelectorAll("#slides .slide");
  var currentSlide = 0;

  // ライクをクリックしたらフォローする
  $("#like").on("click", function () {
    let card = $(".showing");
    let accountId = card.data("id");
    let nickname = card.find("span").text();
    displayMessage(nickname);
    followAccount(accountId);
    nextSlide();
  });

  // ディスライクをクリックしたらDislikeに追加
  $("#dislike").on("click", function () {
    const accountId = $(".showing").data("id");
    dislikeAccount(accountId);
    nextSlide();
  });

  function dislikeAccount(id) {
    console.log("click : " + id);
    $.ajax({
      type: "GET", // リクエストのタイプ
      url: "/bad", // リクエストを送信するURL
      data: { account_id: id }, // サーバーに送信するデータ
    })
  }

  function followAccount(id) {
    console.log(id);
    $.ajax({
      type: "GET", // リクエストのタイプ
      url: "/good", // リクエストを送信するURL
      data: { account_id: id }, // サーバーに送信するデータ
    })
  }

  function displayMessage(name) {
    console.log(name);
    $("#good-message").empty();
    $("#good-message").append(`<p class="fs-4">Liked ${name}!</p>`);
  }

  function nextSlide() {
    console.log("Next Slide!");
    slides[currentSlide].className = "slide";
    currentSlide = (currentSlide + 1) % slides.length;
    slides[currentSlide].className = "slide showing";
  }

  //監視する要素の指定　　上でmessage

  //MutationObserver（インスタンス）の作成
  var mo = new MutationObserver(function(record, observer) {
    // 左側だったら（相手のめっせだったら）
    const message = element.lastElementChild;
    if(message.classList.contains('left')) {
      // ajax処理
      $.ajax({
        type: "GET", // リクエストのタイプ
        url: `/read/${message.dataset.msgId}`, // リクエストを送信するURL
        // dataType: "script", // サーバーから返却される型
      });

    }

  });

  //監視する「もの」の指定（必ず1つ以上trueにする）
  var config = {
    childList: true
  };

  //監視の開始


  //監視の終了
  // mo.disconnect();

});
