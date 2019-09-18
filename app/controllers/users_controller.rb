class UsersController < ApplicationController

  # before_action :require_admin, only: [:show]
  def show
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    # binding.pry
    @user = User.new(user_params)
    if @user.save
      UserMailer.account_activation(@user).deliver_now
      flash[:info] = "Please check your email to activate your account."
      redirect_to schedules_index_path, success: 'メールを送信しました。リンクをクリックしてアカウントを有効にしてください'
    else
      flash[:danger] = '登録に失敗しました'
      # binding.pry
      render :new

      # redirect_to signup_path, danger: '失敗しました'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.delete
    redirect_to user_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def require_admin
    unless admin?
      redirect_to schedules_index_path
    end
  end
end
