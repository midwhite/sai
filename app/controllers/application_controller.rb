class ApplicationController < ActionController::Base
  include Constants

  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound, with: :render_404
  rescue_from ActionController::RoutingError, with: :render_404
  rescue_from Exception, with: :render_500 if Rails.env.production?

  def render_404
    if user_signed_in?
      render "homes/index"
    else
      redirect_to root_path
    end
  end

  def render_500
    if request.xhr?
      render status: 500, json: { messages: ["Internal Server Error"] }
    else
      template = user_signed_in? ? "homes/index" : "homes/welcome"
      render template, status: 200, content_type: "text/html"
    end
  end
end
