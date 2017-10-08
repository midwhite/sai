class Api::UsersController < ApplicationController
  before_action :authenticate_user!

  def me
    render json: { user: current_user.me }
  end

  def notifications
    # 通知情報を取得
    notifications = Notification.where(user_id: current_user.id)
    # 既読情報を更新
    notifications.update_all(opened: true) if params[:read]
    # レスポンスを返す
    render json: { notifications: notifications.map(&:response) }
  end
end
