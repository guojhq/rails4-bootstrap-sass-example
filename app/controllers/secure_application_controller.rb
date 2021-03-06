class SecureApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout 'layouts/admin'

  include SessionsHelper

  private

  def check_login
    unless logged_in? and current_user.admin?
      flash[:danger] = 'You must be logged in'
      redirect_to signin_path
    end
  end

end
