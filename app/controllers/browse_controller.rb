class BrowseController < ApplicationController
  before_action :authenticate_account!

  def index
    @matchers = current_account.matchers
    # @strangers = Account.where.not(id: current_account.id)
    ids_exclusion = current_account.followings.ids
    ids_exclusion = ids_exclusion + current_account.dislikings.ids
    ids_exclusion << current_account.id

    @strangers = Account.where(gender_id: current_account.gender_interests.ids).where.not(id: ids_exclusion)
  end

  def good
    @account = Account.find(params[:account_id])
    # jsonのためにハッシュにする。
    @data = @account.slice(:nickname)

    current_account.follow!(@account)

    respond_to do |format| # リクエスト形式によって処理を切り分ける
      format.html { redirect_to :root } # html形式の場合
      format.json { render json: @data } # json形式の場合
    end
  end

  def bad
    @account = Account.find(params[:account_id])
    # jsonのためにハッシュにする。
    @data = @account.slice(:nickname)

    # ディスライクの処理を追加
    current_account.dislike!(@account)

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

    @messages.where(account_id: @account.id).update_all(read: true)
  end

end
