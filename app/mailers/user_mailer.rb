class UserMailer < ApplicationMailer
  default from: 'notifications@rottentomatoes.com'

  def account_deleted_email(user)
    @user = user
    mail(to: @user.email, subject: 'Your account has been deleted!') 
  end

end
