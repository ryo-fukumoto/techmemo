class ArticlesController < ApplicationController

  def index
    @categories = Category.all
    @articles = Article.includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end

  def new
    @categories = Category.all
    @article = Article.new
  end

  def create
     Article.create(article_params)
      redirect_to "/articles"
    
  end

  private
  def article_params
    params.require(:article).permit(:title, :body, :category_id).merge(user_id: current_user.id)
  end

end
