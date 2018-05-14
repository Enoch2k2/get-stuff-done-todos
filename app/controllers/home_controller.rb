class HomeController < ApplicationController
  before_action :authenticate_user, only: [:index]

  def index
  end

  private
    def authenticate_user
      redirect_to user_path(current_user) if user_signed_in?
    end
end
