class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern 
  before_action :require_login
  add_flash_types :success, :alert

  private

  def require_login
    not_authenticated
  end

  def not_authenticated
    flash[:danger] = "ログインしてください"
    redirect_to login_path
  end

end
