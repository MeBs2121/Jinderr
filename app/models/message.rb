class Message < ApplicationRecord
  after_update_commit :make_it_read

  validates :content, presence: true
  belongs_to :account
  belongs_to :room

  def make_it_read
    # binding.pry
    ActionCable.server.broadcast(
      "room_channel_#{self.room.id}",
      type: "read",
      message: self,
      room_id: self.room.id
    )
  end
end
