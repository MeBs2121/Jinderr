class BrowseController < ApplicationController
  before_action :authenticate_account!

  def index
    @matchers = current_account.matchers
    # @strangers = Account.where.not(id: current_account.id)
    @strangers = Account.where.not(id: current_account.id)
  end

  def good
    @account = Account.find(params[:account_id])
    @data = @account.slice(:nickname)

    current_account.follow!(@account)

    if @account.following? current_account
      room = Room.create
            
      current_account.entries.create(account_id: current_account.id, room_id: room.id)
      @account.entries.create(account_id: @account.id, room_id: room.id)
    end

    respond_to do |format| # リクエスト形式によって処理を切り分ける
      format.html { redirect_to :root } # html形式の場合
      format.json { render json: @data } # json形式の場合
    end
  end

  def room
    @account = Account.find(params[:id])
    @entry1 = current_account.entries.pluck(:room_id)
    @entry2 = @account.entries.pluck(:room_id)
    @room = Room.find (@entry1 & @entry2)[0]
    # binding.pry
    
    @messages = @room.messages
  end
  
end