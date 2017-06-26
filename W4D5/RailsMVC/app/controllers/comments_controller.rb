class CommentsController < ApplicationController

  before_action :require_logged_in

  def create
    @comment = Comment.new(comment_params)
    unless @comment.save
      flash[:errors] = @comment.errors.full_messages
    end
    redirect_to link_url(@comment.link)
  end

  def destroy
    @comment = Comment.find(params[:id])
    link = @comment.link
    @comment.destroy
    redirect_to link_url(link)
  end

  def comment_params
    params.require(:comment).permit(:link_id, :user_id, :body)
  end

end
