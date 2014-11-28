class ReceiptMailer < ActionMailer::Base
  default from: "no-reply@fastpr.co"

  def email_with_attachment(user, attachment)
    @user = user
    attachments['receipt-1234.pdf'] = attachment
    mail(to: user.email, subject: "Your Receipt")
  end

end