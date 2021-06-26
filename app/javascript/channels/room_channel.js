import consumer from "./consumer";

$(function () {
  const chatChannel = consumer.subscriptions.create("RoomChannel", {
    connected() {
      // Called when the subscription is ready for use on the server
      console.log("connected RoomChannel");
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      const currentId = $("#messages").data("my-id");
      console.log(data);
      let element;
      if (data.message.account_id === currentId) {
        element = `<div class="d-flex align-items-end flex-column bd-highlight my-3">
        <div class="their-messages fs-5 message-right px-3 text-left">${data.message.content}</div>
        <div class="message-date fw-bold">now</div>
      </div>`;
      } else {
        element = `<div class="d-flex align-items-start flex-column bd-highlight my-3">
        <div class="my-messages fs-5 message-left px-3 text-left">${data.message.content}</div>
        <div class="message-date fw-bold">now</div>
      </div>`;
      }
      // console.log(element);
      $("#messages").append(element);
    },

    speak: function (message) {
      console.log("sending : " + message);
      // console.log("room_id : " + $("#sending").data("room-id"));
      return this.perform("speak", {
        room_id: $("#sending").data("room-id"),
        message: message,
      });
    },
  });

  // インプットでEnterキー
  $("#sending").on("keypress", function (event) {
    if(event.target.value === "") return
    if (event.keyCode === 13) {
      event.preventDefault();
      chatChannel.speak(event.target.value);
      event.target.value = "";
    }
  });

});
