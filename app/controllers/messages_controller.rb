class MessagesController < ApplicationController
  def read
    @message = Message.find(params[:id])
    @message.read = true
    @message.save
    # ActionCable.server.broadcast(
    #   "room_channel_#{@message.room.id}",
    #   type: "read",
    #   message: @message,
    #   room_id: @message.room.id
    # )
  end
end
