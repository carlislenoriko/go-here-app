class UserMailer < ApplicationMailer

  def email_map(user)
    @user = user
    @recipient = "silly.carly@gmail.com" #email string?
    # @map = params[:map] #pass in map id somewhere

    mail(
      to: @recipient,
      subject: 'Go here!')
  end

end



