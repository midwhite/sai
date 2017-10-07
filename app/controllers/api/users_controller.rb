class Api::UsersController < ApplicationController
  before_action :authenticate_user!

  def me
    render json: { user: current_user.me }
  end

  def notifications
    notifications = Notification.where(user_id: current_user.id)

    render json: { notifications: notifications.map(&:response) }
  end
end
