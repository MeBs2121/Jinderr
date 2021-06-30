class NewMatchingsController < ApplicationController
  before_action :authenticate_account!

  def destroy
    current_account.new_matchings.all.destroy_all
  end
end
