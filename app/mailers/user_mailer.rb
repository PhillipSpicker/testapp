class UserMailer < ApplicationMailer
  default from: 'your-email@example.com'

  def contact_form(email, name, message)
  @message = message
    mail(:from => email,
      :to => 'phillip.spicker@gmx.de',
      :subject => "A new contact form message from #{name}")
  end

  def thank_you
    @name = params[:name]
  	@email = params[:email]
  	@message = params[:message]
  	UserMailer.contact_form(@email, @name, @message).deliver_now
  end

  def welcome(user)
    @appname = "Uperfit"
    mail( :to => user.email,
          :subject => "Welcome to #{@appname}!")
  end

  def paid_order(user, product)
    @user = user
    @product = product
    @appname = "Uperfit"
    mail( :to => user.email,
    :subject => "Your order on #{@appname}!")
   end


end

