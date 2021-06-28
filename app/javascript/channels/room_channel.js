import consumer from "./consumer";

$(function () {
  let ids = []

  $(".matching_item").each(function(i, element) {
    const roomId = $(this).data('room-id')
    ids.push(roomId)
  })
  // console.log(ids);

  // channel
  const chatChannel = consumer.subscriptions.create({ channel: "RoomChannel", room: ids }, {
    connected() {
      // Called when the subscription is ready for use on the server
      console.log("connected RoomChannel");
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      if(data.type === "message"){
        this.pupulateMsg(data)
      }
      if(data.type === "read"){
        this.makeItRead(data)
      }
    },

    pupulateMsg(data) {
      console.log("populate!");
      // console.log(data.message);
      const roomId = document.getElementById("sending").dataset.roomId
      if(roomId != data.room_id) {
        // console.log("returned!");
        return
      }

      const currentId = $("#messages").data("my-id");
      // console.log("room_id: " + data.room_id);
      // console.log(room);
      let element;
      if (data.message.account_id === currentId) {
        element = `<div class="right d-flex align-items-end flex-column bd-highlight my-3" data-msg-id="${data.message.id}">
                    <div class="their-messages fs-5 message-right px-3 text-left">${data.message.content}</div>
                    <div class="message-date fw-bold">
                    now
                    </div>
                  </div>`;
      } else {
        element = `<div class="left d-flex align-items-start flex-column bd-highlight my-3" data-msg-id="${data.message.id}">
        <div class="my-messages fs-5 message-left px-3 text-left">${data.message.content}</div>
        <div class="message-date fw-bold">now</div>
      </div>`;
      }
      // console.log(element);
      $("#messages").append(element);
    },

    makeItRead(data) {
      const currentId = $("#messages").data("my-id");

      if (data.message.account_id === currentId) {
        console.log("make it read");
        
        const el = $("#messages").find(`[data-msg-id="${data.message.id}"]`).find(".message-date");
        const now = el.text();
        el.html(`<span class="text-dark mr-2">✅</span> ${now}`)
      }
    },

    speak: function (message) {
      // console.log("sending : " + message);
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
