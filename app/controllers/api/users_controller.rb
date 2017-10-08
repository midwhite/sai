class Api::UsersController < ApplicationController
  before_action :authenticate_user!

  def me
    render json: { user: current_user.me }
  end

  def show
    user = User.find(params[:id])
    render json: { user: user.response }
  end

  def update
    current_user.attributes = user_params
    current_user.registered_at = Time.zone.now if current_user.registered_at.blank?
    current_user.save
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

  private
  def user_params
    params.require(:user).permit(:name, :gender, :area, :district, :industry, :job, :birth_year, :profile, :photo, :policy_field)
  end
end
