class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @articles = @user.articles.page(params[:page]).per(20).order("created_at DESC")
  end
end
