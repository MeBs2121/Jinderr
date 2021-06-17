class AccountsController < ApplicationController
  before_action :authenticate_account!

  def show
    @account = Account.find_by(nickname: current_account.nickname)
  end

  #ボタンクリック
  def follow
    current_account.follow!(find_account)
  end

  def unfollow
    current_account.unfollow!(find_account)
  end

  private
    def find_account
      @account = Account.find(params[:id])
    end
end
