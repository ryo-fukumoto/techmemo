class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    redirect_to article_path(params[:article_id])
  end
  
  private
  def comment_params
    params.require(:comment).permit(:body, :article_id).merge(user_id: current_user.id)
  end
end
