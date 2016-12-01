class StaticPagesController < ApplicationController
  def landing_page
  	@featured_product = Product.second
  	@products = Product.limit(3)
  end

  def index
  end

  def thank_you
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    ActionMailer::Base.mail(:from => @email,
      :to => 'phillip.spicker@gmx.de',
      :subject => "A new contact form message from #{@name}",
      :body => @message).deliver_now
  end

end
