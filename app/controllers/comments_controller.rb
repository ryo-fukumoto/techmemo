class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    redirect_to article_path(params[:article_id])
  end
  
  private
  def comment_params
    params.require(:comment).permit(:body).merge(user_id: current_user.id, article_id: params[:article_id])
  end
end
