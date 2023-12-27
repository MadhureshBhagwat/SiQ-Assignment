# frozen_string_literal: true

# define CommentController class
class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.new(comment_params)
    flash[:notice] = "Comment can't be blank" unless @comment.save

    redirect_to root_path
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :parent_id).merge(post_id: params[:post_id])
  end
end
