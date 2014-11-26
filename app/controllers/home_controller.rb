class HomeController < ApplicationController

  def index
  end

  def pdftest
    @users = User.all
  end

end