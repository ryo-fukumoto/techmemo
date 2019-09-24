class ArticlesController < ApplicationController
  def index
    @categories = Category.all
  end
end
