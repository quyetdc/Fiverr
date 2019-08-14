class UsersController < ApplicationController
  before_action :authenticate_user!

  def dashboard
    if params[:category]
      @gigs = current_user.gigs.joins(:category).where(categories: { name: params[:category] }).all
    else
      @gigs = current_user.gigs
    end

  end

  def show
    @user = User.find(params[:id])
    @reviews = Review.where(seller_id: params[:id]).order(created_at: :asc)
  end

  def update
    @user = current_user
    if @user.update(current_user_params)
      flash[:notice] = "Saved..."
    else
      flash[:alert] = "Cannot update..."
    end

    redirect_to dashboard_path
  end

  private

  def current_user_params
    params.require(:user).permit(:from, :about, :status, :language, :avatar)
  end
end
