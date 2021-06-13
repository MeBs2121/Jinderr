class PublicController < ApplicationController
  def index
    if account_signed_in?
      redirect_to browse_path
    end
  end
end
