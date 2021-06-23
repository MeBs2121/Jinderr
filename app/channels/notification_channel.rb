class NotificationChannel < ApplicationCable::Channel
  def subscribed
    stream_from "notification_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)

    @message = current_account.messages.create(room_id: data['room_id'], content: data['message'])
    ActionCable.server.broadcast(
      'room_channel',
      message: @message
    )

  end
end
