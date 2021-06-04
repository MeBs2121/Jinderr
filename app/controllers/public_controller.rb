class PublicController < ApplicationController
  def index
    if current_account.nil?
      @accounts = Account.all
    else
      redirect_to profile_path(current_account.nickname)
    end
  end
end
