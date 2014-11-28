class HomeController < ApplicationController

  def index
  end

  def pdftest
    @users = User.all
    @asset_path = "#{Rails.root}/app/assets/images"
    render :pdftest, handlers: [:prawn], formats: [:pdf]
  end

  def send_receipt
    @users      = User.all
    @attachment = render_to_string :pdftest, handlers: [:prawn], formats: [:pdf]
    @email      = ReceiptMailer.email_with_attachment(User.first, @attachment)
    @email.deliver

    # render :send_receipt, handlers: [:html], formats: [:erb]
    redirect_to root_path
  end

end