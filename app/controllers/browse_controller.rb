class BrowseController < ApplicationController
  before_action :authenticate_account!

  def index
    current_account.heart.reset unless current_account.heart.updated_at.to_date == Date.today

    @matchers = current_account.matchers
    @strangers = Account.where(gender_id: gender_ids).where.not(id: ids_to_exclude).order("RANDOM()").limit(10)

    @new_friends_ids = current_account.new_friends.ids

    @unread_messages = Message.where(room_id: current_account.rooms.ids, read: false).where.not(account_id: current_account.id)

    @events = current_account.supporting.home_games.all

    # binding.pry
  end

  def good #フォロー時にメッセージを表示

    @account = Account.find(params[:account_id])

    @stock_empty = current_account.heart.stock == 0

    unless @stock_empty #Heartがあればフォロー
      current_account.follow!(@account)
      @stock_empty = current_account.heart.stock == 0
    end

  end

  def bad
    @account = Account.find(params[:account_id])

    # ディスライクの処理を追加
    current_account.dislike!(@account)

  end

  def room
    @account = Account.find(params[:id]) #相手のアカウント
    @room = (current_account.rooms & @account.rooms)[0] #ルームを特定

    @messages = @room.messages

    @messages.where(account_id: @account.id, read: false).each do |m|
        m.update(read: true)
    end
  end

  def load_accounts

    respond_to do |format| # リクエスト形式によって処理を切り分ける
      format.html { redirect_to :root } # html形式の場合
      format.json { render json: @strangers } # json形式の場合
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

    def reset_heart
      current_account.heart.update(stock: 10)
    end

end
