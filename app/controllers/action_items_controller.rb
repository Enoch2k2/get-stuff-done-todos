class ActionItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def index
    
  end

  def new
    @user = current_user
    @actionitem = @user.action_items.build
  end

  def create
    @action_item = current_user.action_items.build(action_item_params)
    if @action_item.save
      flash[:success] = "Todo successfully created."
      redirect_to user_action_items_path(current_user)
    else
      flash[:error] = @action_item.errors.full_messages
      redirect_to new_user_action_item_path(current_user)
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private
    def authenticate_user!
      redirect_to root_path unless user_signed_in?
    end

    def set_user
      @user = User.find_by_id(params[:user_id])
    end

    def action_item_params
      params.require(:action_item).permit(:content, :due_at)
    end
end
