class Api::TopicsController < ApplicationController
  before_action :authenticate_user!

  def index
    topics   = Topic.order(id: :desc).map(&:response)
    articles = Ogp.where(target_type: "topic").map(&:response)

    topics.map do |topic|
      topic[:articles] = articles.select{|article| article[:topic_id] === topic[:id] }
    end

    render json: { topics: topics }
  end

  def create
    topic = Topic.new(topic_params)
    if topic.save
      render status: :created, json: { topic: topic.response }
    else
      render json: { messages: topic.errors.full_messages }
    end
  end

  def good
    topic = Topic.find(params[:id])
    topic.good += 1
    topic.save
    render json: { topic: topic }
  end

  def bad
    topic = Topic.find(params[:id])
    topic.bad += 1
    topic.save
    render json: { topic: topic }
  end

  private
  def topic_params
    params.require(:topic).permit(:title, :content, :target_id, :target_type, :policy, :position).merge(user_id: current_user.id)
  end
end
