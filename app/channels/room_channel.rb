class RoomChannel < ApplicationCable::Channel
  def subscribed
    params[:room].each do |id|
      stream_from "room_channel_#{id}"
    end
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    room_id = data['room_id']
    @message = current_account.messages.create(room_id: room_id, content: data['message'])
    ActionCable.server.broadcast(
      "room_channel_#{room_id}",
      message: @message,
      room_id: room_id
    )

  end
end
