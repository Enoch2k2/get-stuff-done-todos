class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show]
  
  def show
  end

  private
    def authenticate_user!
      redirect_to root_path unless user_signed_in?
    end

    def set_user
      @user = User.find_by_id(params[:id])
    end
end
