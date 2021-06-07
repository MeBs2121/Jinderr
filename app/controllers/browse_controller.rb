class BrowseController < ApplicationController
  before_action :authenticate_account!

  def index
    @matchers = current_account.matchers
    # @strangers = Account.where.not(id: current_account.id)
    @strangers = Account.all
  end
end
