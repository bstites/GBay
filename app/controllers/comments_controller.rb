class CommentsController < ApplicationController
  load_and_authorize_resource

  respond_to :html
  def show
    respond_with(@comment)
  end

  def index
    @comments=Comment.all
  end

  def create
    @comment.user_id = current_user.id
    @comment.save
    respond_with(@comment)
  end

  def update
    @comment.update!(comment_params)
    respond_with(@comment)
  end

  def destroy
    @comment.destroy
    respond_with(@comment)
  end

  private
  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content, :user_id, :item_id)
  end
end
