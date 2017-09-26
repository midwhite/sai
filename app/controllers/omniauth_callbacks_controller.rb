class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = User.from_omniauth(request.env['omniauth.auth'])
    sign_in @user
    @user.remember_me
    redirect_to root_path
  end

  def twitter
  end
end
