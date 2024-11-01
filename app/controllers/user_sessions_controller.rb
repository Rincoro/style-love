class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]
  def new; end

  def create
    @user = login(params[:email], params[:password])

    if @user
      flash[:success] = "ログインしました"
      redirect_to root_path
    else
      flash[:alert] = "ログインに失敗しました"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    redirect_to root_path, status: :see_other, alert: "ログアウトしました"
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
