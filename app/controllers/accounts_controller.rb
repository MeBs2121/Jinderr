class AccountsController < ApplicationController
  before_action :authenticate_account!

  def show
    @account = Account.find_by(nickname: params[:nickname])
  end
  
end
