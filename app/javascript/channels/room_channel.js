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
      console.log(data);
      console.log("my id : " + currentId);
    },

    speak: function (message) {
      console.log(message);
      console.log("room_id : " + $("#sending").data("room-id"));
      return this.perform("speak", {
        room_id: $("#sending").data("room-id"),
        message: message,
      });
    },
  });

  $("#sending").on("keypress", function (event) {
    if (event.keyCode === 13) {
      // console.log("message : " + event.target.value);
      // console.log("account_id : " + $(this).data("account-id"));
      // console.log("room_id : " + $(this).data("room-id"));
      chatChannel.speak(event.target.value);
      event.target.value = "";
      return event.preventDefault();
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
