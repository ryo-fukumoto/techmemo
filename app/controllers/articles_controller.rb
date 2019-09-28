class ArticlesController < ApplicationController
  def index
    @categories = Category.all
    @articles = Article.includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end

  def new
    @categories = Category.all
    @article = Article.new
  end
end
