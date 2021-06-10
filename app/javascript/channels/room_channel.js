import consumer from "./consumer";

$(document).on("turbolinks:load", function () {
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
      // console.log(data);
      // console.log("my id : " + currentId);
      let element;
      if (data.message.account_id === currentId) {
        console.log(1);
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

  // $("#sending").on("keypress", function (event) {
  //   if (event.keyCode === 13) {
  //     // console.log("message : " + event.target.value);
  //     // console.log("account_id : " + $(this).data("account-id"));
  //     // console.log("room_id : " + $(this).data("room-id"));
  //     chatChannel.speak(event.target.value);
  //     event.target.value = "";
  //     return event.preventDefault();
  //   }
  // });
  $("#sending").on("keypress", function (event) {
    if (event.keyCode === 13) {
      event.preventDefault();
      chatChannel.speak(event.target.value);
      event.target.value = "";
    }
  });
  // $(document).on("keypress", "[data-behavior=room_speaker]", function (event) {
  //   if (event.keyCode === 13) {
  //     console.log("message : " + event.target.value);
  //     console.log("account_id : " + $(this).data("account-id"));
  //     console.log("room_id : " + $(this).data("room-id"));
  //     chatChannel.speak(event.target.value);
  //     event.target.value = "";
  //     return event.preventDefault();
  //   }
  // });
});
