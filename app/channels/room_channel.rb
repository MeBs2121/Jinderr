class RoomChannel < ApplicationCable::Channel
  def subscribed
    
    # binding.pry
    
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    
    @message = current_account.messages.create(room_id: data['room_id'], content: data['message'])
    ActionCable.server.broadcast(
      'room_channel',
      message: @message,
    )
    
    # binding.pry
    
  end
end
