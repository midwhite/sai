class Api::CommentsController < ApplicationController
  before_action :authenticate_user!

  def index
    articles = Ogp.where(target_type: "comment").map(&:response)

    comments = Comment.includes(:user).order(id: :asc).map do |comment|
      json = comment.response
      json[:articles] = articles.select{|article| article[:comment_id] === comment[:id] }
      json[:user] = comment.user.response
      json
    end

    render json: { comments: comments }
  end

  def create
    comment = Comment.new(comment_params)
    if comment.save
      Notification.new_comment(comment)
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
