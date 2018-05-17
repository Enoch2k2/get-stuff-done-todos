class ActionItemsController < ApplicationController
  before_action :set_action_item, only: [:edit, :update, :complete, :incomplete, :destroy]
  before_action :authenticate_user!
  before_action :set_user

  def index
  end

  def new
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
    if @action_item.update(action_item_params)
      flash[:success] = "Todo successfully updated"
      redirect_to user_action_items_path
    else
      flash[:error] = @action_item.errors.full_messages
      redirect_to edit_user_action_item_path(current_user, @action_item)
    end
  end

  def complete
    @action_item.update(completed_at: DateTime.current)
    redirect_to user_action_items_path(current_user)
  end
  
  def incomplete
    @action_item.update(completed_at: nil)
    redirect_to user_action_items_path(current_user)
  end
  
  def destroy
    @action_item.destroy
    redirect_to user_action_items_path(current_user)
  end
  
  private
    def set_action_item
      @action_item = ActionItem.find_by_id(params[:id])
    end

    def authenticate_user!
      redirect_to root_path unless user_signed_in?
    end

    def set_user
      @user = User.find_by_id(params[:user_id])
    end

    def action_item_params
      params.require(:action_item).permit(:content, :due_at, :completed_at)
    end
end
