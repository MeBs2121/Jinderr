import consumer from "./consumer";

$(function () {
  const chatChannel = consumer.subscriptions.create("RoomChannel", {
    connected() {
      // Called when the subscription is ready for use on the server
      console.log("connected!");
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      const currentId = $("#messages").data("my-id");
      console.log(data);
      let element;
      if (data.message.account_id === currentId) {
        element = `<div class="d-flex justify-content-end align-items-center my-3">
        <span class="their-messagesfs-5 message-right px-4 py-1">${data.message.content}</span>
      </div>`;
      } else {
        element = `<div class="d-flex align-items-center my-3">
        <span class="my-messages fs-5 message-left px-4 py-1">${data.message.content}</span>
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
