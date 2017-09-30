class Api::TopicsController < ApplicationController
  before_action :authenticate_user!

  def index
    topics = Topic.order(id: :desc)
    render status: :ok, json: { topics: topics.map(&:response) }
  end

  def create
    topic = Topic.create(topic_params)
    render status: :created, json: { topic: topic.response }
  end

  private
  def topic_params
    params.require(:topic).permit(:title, :content, :policy_id, :target_id, :target_type).merge(user_id: current_user.id)
  end
end
