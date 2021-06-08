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

    respond_to do |format| # リクエスト形式によって処理を切り分ける
      format.html { redirect_to :root } # html形式の場合
      format.json { render json: @data } # json形式の場合
    end
  end
end
