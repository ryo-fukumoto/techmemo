class ArticlesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @categories = Category.all
    @article = Article.new
  end
end
