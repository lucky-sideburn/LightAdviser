class MyMailer < ActionMailer::Base
  default from: "admin@lightadviser.com"
  

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_alert(user,msg)
    @user = user
    mail( :to => @user.email,
    :subject => 'You alert by lightadviser' ,
    :body => msg )
  end


end
