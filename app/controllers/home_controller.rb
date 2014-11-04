class HomeController < SecureApplicationController

  def index
    @users = User.all
  end

end