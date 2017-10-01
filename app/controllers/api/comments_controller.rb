class Api::CommentsController < ApplicationController
  before_action :authenticate_user!

  def index
    comments = Comment.order(id: :asc)
    render json: { comments: comments.map(&:response) }
  end

  def create
    comment = Comment.new(comment_params)
    if comment.save
      render status: :created, json: { comment: comment.response }
    else
      render json: { messages: comment.errors.full_messages }
    end
  end

  def destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:reply_to, :content, :position).merge(user_id: current_user.id, topic_id: params[:id])
  end
end
