class ActionItemsController < ApplicationController
  before_action :set_user

  def index
    
  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end

  private
    def set_user
      @user = User.find_by_id(params[:user_id])
    end
end