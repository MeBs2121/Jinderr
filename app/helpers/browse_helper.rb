module BrowseHelper
  def find_room account
    @room = current_account.rooms & account.rooms
    @room.pluck(:id)[0]
  end

  def last_message account
    msg = account.messages.where(room_id: find_room(account)).last
    msg.content
  end
end
