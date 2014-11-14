class Admin::UsersController < SecureApplicationController
  include SessionsHelper

  before_filter :check_login, except: [:new, :create]

  def index
    @distance = 10

    if params[:search]
      @search_term = params[:search][:search_term] if params[:search][:search_term]
      @distance    = params[:search][:within] if params[:search][:within]
    end

    if(@search_term)
      @users = Profile.joins(:user) # loads the user and makes it available for the query
                      .within(@distance, :origin => Profile.first, :units => :kms) # checks the @distance < ---- this is from geokit
                      .where("users.email LIKE ? OR users.name LIKE ?", "%#{@search_term}%", "%#{@search_term}%") # this checks the name or email
                      .collect(&:user) # this collexts it into an array
                      
    else
      @users = Profile.within(@distance, :origin => Profile.first, :units => :kms)
                      .collect(&:user)
    end

  end

  def new
    @user = User.new
    @user.build_profile # create the blank profile
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = 'Successfully updated profile'
      redirect_to admin_user_path(@user)
    else
      flash[:danger] = 'Failed to update profile'
      render 'edit'
    end
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
                                 profile_attributes: [:id, :location, :birthdate, :avatar])
  end
end
