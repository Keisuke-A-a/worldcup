class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: session_params[:email])
    if user && user.authenticate(session_params[:password])
      if user.activated?
        log_in user
        redirect_to schedules_index_path, success: 'ログインしました'
      else
        message  = "アカウントが有効ではありません"
        message += "メールのリンクを確認してください"
        flash[:warning] = message
        redirect_to signup_path
      end
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :new
    end
  end

  def destroy
    log_out
    redirect_to login_path, info: 'ログアウトしました'
  end

  private
  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
