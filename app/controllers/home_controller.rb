class HomeController < ApplicationController

  def index
  end

  def pdftest
    @users = User.all
    @asset_path = "#{Rails.root}/app/assets/images"
    render :pdftest, handlers: [:prawn], formats: [:pdf]
  end

end