module BrowseHelper
  def find_room account
    @room = current_account.rooms & account.rooms
    @room.pluck(:id)[0]
  end
end
