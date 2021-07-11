$(function () {
  const browsing = $("#browsing");
  const convo = $("#convo");
  const details = $("#details");

  const element = document.getElementById("messages");

  $("#matching-tab").on("click", function() {
    $.ajax({
      type: "GET", // リクエストのタイプ
      url: `/new_matchings`, // リクエストを送信するURL
    })
  });

  $("#message-tab").on("click", function () {
    $(".message_item").on("click", function () {
      let roomId = $(this).data("room-id");
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
     mo.observe(element, config); // 監視開始
   },600);
  }

  function closeConvo() {
    browsing.show();
    convo.hide();
    details.hide();
    mo.disconnect();　//監視終了
  }

  // スライド、ボタン
  var slides = document.querySelectorAll("#slides .slide");
  var currentSlide = 0;

  // ライクをクリックしたらフォローする
  $("#like").on("click", function () {
    let card = $(".showing");
    let accountId = card.data("id");
    let nickname = card.find("span").text();
    // displayMessage(nickname, "Liked");
    createRelation(accountId, "good");
    nextSlide();
  });

  // ディスライクをクリックしたらDislikeに追加
  $("#dislike").on("click", function () {
    let card = $(".showing");
    let accountId = card.data("id");
    let nickname = card.find("span").text();
    // displayMessage(nickname, "Disliked");
    createRelation(accountId, "bad");
    nextSlide();
  });

  function createRelation(id, goodBad) {
    console.log("click : " + id);
    $.ajax({
      type: "GET", // リクエストのタイプ
      url: `/${goodBad}`, // リクエストを送信するURL
      data: { account_id: id }, // サーバーに送信するデータ
      dataType: "script"
    })
  }

  // function displayMessage(name, text) {
  //   console.log(name);
  //   $("#good-message").empty();
  //   $("#good-message").append(`<p class="fs-4">${text} ${name}!</p>`);
  // }

  function nextSlide() {
    console.log("Next Slide!");
    slides[currentSlide].className = "slide";
    currentSlide = (currentSlide + 1) % slides.length;
    slides[currentSlide].className = "slide showing";
  }

  //MutationObserver（インスタンス）の作成
  var mo = new MutationObserver(function(record, observer) {
    // 左側だったら（相手のめっせだったら）
    const message = element.lastElementChild;
    if(message.classList.contains('left')) {
      $.ajax({
        type: "GET", // リクエストのタイプ
        url: `/read/${message.dataset.msgId}`, // リクエストを送信するURL
        // dataType: "script", // サーバーから返却される型
      });
    }
  });

  //監視するもの
  var config = {
    childList: true
  };

});
