class CommentsController < ApplicationController
  def new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author_id = current_user.id
    @comment.post_id = comment_params[:post_id]
    @comment.parent_comment_id = comment_params[:parent_comment_id]
    if @comment.save
      redirect_to comment_url(@comment.parent_comment)
    else
      flash[:errors] = @comment.errors.full_messages
      redirect_to comment_url(@comment.parent_comment)
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :parent_comment_id)
  end
end
