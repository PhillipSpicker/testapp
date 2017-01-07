class PaymentsController < ApplicationController

  def create
    token = params[:stripeToken]
    # Create the charge on Stripe's servers - this will charge the user's card
    begin
      @product = Product.find(params[:product_id])
	  @user = current_user
      charge = Stripe::Charge.create(
        :amount => @product.price, # amount in cents, again
        :currency => "eur",
        :source => token,
      	:description => params[:stripeEmail]
      )

    if charge.paid
      Order.create(product_id: @product.id, user_id: @user_id, total: @product.price)
    end

  	rescue Stripe::CardError => e
      # The card has been declined
      body = e.json_body
      err = body[:error]
      flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
    end
  end

  redirect_to product_path(@product)


end
