class ArticlesController < ApplicationController

  def index
    if params[:category_id]
      @categories = Category.all
      @category = Category.find(params[:category_id])
      @articles = @category.articles.includes(:user).page(params[:page]).per(5).order(created_at: :desc).all
    else
      @categories = Category.all
      @articles = Article.includes(:user).page(params[:page]).per(5).order("created_at DESC")
    end
  end

  def new
    @categories = Category.all
    @article = Article.new
  end

  def create
     Article.create(article_params)
      redirect_to "/articles"
  end

  def show
    @article = Article.find(params[:id])
    @user = @article.user
    @comment = Comment.new
    @comments = @article.comments.includes(:user)
    @categories = Category.all
    @category = @article.category
    @like = Like.new
  end

  def edit
    @categories = Category.all
    @article = Article.find(params[:id])
  end

  def update
    article = Article.find(params[:id])
    if article.user_id == current_user.id
      article.update(article_params)
      redirect_to root_path
    end
  end

  def destroy
    article = Article.find(params[:id])
    if article.user_id == current_user.id
      article.destroy
      redirect_to root_path
    end
  end

  private
  def article_params
    params.require(:article).permit(:title, :body, :category_id).merge(user_id: current_user.id)
  end

end
