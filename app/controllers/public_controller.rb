class PublicController < ApplicationController
  def index
    @accounts = Account.all
  end
end
