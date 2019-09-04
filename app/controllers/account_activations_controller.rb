class AccountActivationsController < ApplicationController

  def edit
    user = User.find_by(email: params[:email])
    binding.pry
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.update_attribute(:activated,    true)
      user.update_attribute(:activated_at, Time.zone.now)
      flash[:success] = "アカウントが有効になりました"
      redirect_to login_path
    else
      flash[:danger] = "無効なリンクです"
      redirect_to signup_path
    end
  end
end
