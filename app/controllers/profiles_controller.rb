class ProfilesController < ApplicationController

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
      if @user.update(profile_params)
      redirect_to profile_path(@user), success: "プロフィールを更新しました"
      else
      flash.now['danger'] = "プロフィール更新に失敗しました"
      render :edit, status: :unprocessable_entity
      end
  end

  def show
    @user = User.find(current_user.id)
  end

  private

  def profile_params
    params.require(:user).permit(:id, :email, :password, :password_confirmation, :name, :icon, :ntroduction)
  end
end
