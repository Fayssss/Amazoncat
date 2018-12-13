class ChargesController < ApplicationController
  def new
    if user_signed_in?
      get_price
    else
    end
  end
  
  def create
    # Price in cents to convert
    get_price
  
    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )
  
    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @convert_price,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )
  
    checkout

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  private
  def get_price
    @cart = Cart.where(:user_id => current_user.id)[0]
    @content = @cart.items
    @price = 0
    @content.each_with_index do |content, index| 
    @price += content.price * @cart.quantities[index].to_i
    end
    @price
    @convert_price = @price.to_i*100
    @convert_price2 = @price*100
  end

  def checkout

    if user_signed_in?
      @cart = Cart.where(:user_id => current_user.id)[0]
      @content = @cart.items
      @price = 0
      @content.each_with_index do |content, index| 
      @price += content.price * @cart.quantities[index].to_i
      end
      if @cart.quantities != []
        @order = Order.create!(user: @cart.user, quantities: @cart.quantities, price: @price)
        @order.item_ids = @cart.item_ids
        @cart.quantities = []
        @cart.save
        UserMailer.client_order(current_user,@order).deliver_now!
        UserMailer.admin_order(@order).deliver_now!
        Cart.where(:user_id => current_user.id)[0].item_ids=[]
      else
        redirect_to "/cart"
        flash[:alert] = "Your cart is empty"
      end
    end
  end

end