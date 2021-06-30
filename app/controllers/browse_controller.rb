class BrowseController < ApplicationController
  before_action :authenticate_account!

  def index
    @matchers = current_account.matchers
    @strangers = Account.where(gender_id: gender_ids).where.not(id: ids_to_exclude)

    @new_friends_ids = current_account.new_friends.ids

    @unread_messages = Message.where(room_id: current_account.rooms.ids, read: false).where.not(account_id: current_account.id)
    # binding.pry
  end

  def good #フォロー時にメッセージを表示
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
    @account = Account.find(params[:id]) #相手のアカウント
    @room = (current_account.rooms & @account.rooms)[0] #ルームを特定

    @messages = @room.messages

    @messages.where(account_id: @account.id, read: false).each do |m|
        m.update(read: true)
    end

  end

  private
    def ids_to_exclude
      ids = current_account.followings.ids
      ids = ids + current_account.dislikings.ids
      ids << current_account.id
      ids
    end

    def gender_ids
      current_account.gender_interests.ids
    end

end
