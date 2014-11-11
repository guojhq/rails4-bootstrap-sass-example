class Admin::UsersController < SecureApplicationController
  include SessionsHelper

  before_filter :check_login, except: [:new, :create]

  def index
    @users = User.all
  end

  def new
    @user = User.new
    @user.build_profile # create the blank profile
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root_path, flash: { success: 'Successfully created account' }
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation,
                                 profile_attributes: [:id, :location, :birthdate])
  end
end
