
class PaymentsController < ApplicationController
def create
        # byebug
        # Get the credit card details submitted by the form
        @product = Product.find(params[:product_id])
        @user = current_user
        token = params[:stripeToken]
        
        # Create the charge on Stripe's servers - this will charge the user's card
        begin
          charge = Stripe::Charge.create(
            :amount => (@product.price * 100).to_i,
            :currency => "usd",
            :source => token,
            :description => params[:stripeEmail],
          )

              if charge.paid
                  Order.create(user_id: @user.id, product_id: @product.id, total: @product.price)
        end 

        rescue Stripe::CardError => e
          # The card has been declined
          body = e.json_body
          err = body[:error]
          flash[:alert] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
          redirect_to product_path(@product)
            end
        end
end






