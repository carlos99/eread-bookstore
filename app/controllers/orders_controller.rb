class OrdersController < ApplicationController
  before_action :require_sign_in
  before_action :set_cart

  def new
    @order = Order.new
  end

  def create
    #require 'pry';binding.pry
    @order = current_user.orders.build
    transfer_cart_items

    if @order.valid?
      total_sale = @cart.total_sale_in_cents

      require "stripe"
      Stripe.api_key = ENV['STRIPE_SECRET_KEY']
      token = params[:stripeToken]


      begin

        customer = Stripe::Customer.create(
          :email => params[:stripeEmail],
          #source: token
        )

        charge = Stripe::Charge.create(
        :customer => customer.id,
        amount: total_sale,
        currency: "usd",
        source: token
        )

        @order.save
        @cart.destroy
        session[:cart_id] = nil

        OrderMailer.notify_on_successful_order(current_user, @order).deliver_now
        flash[:success] = "Order has been created"

      rescue Stripe::CardError => e
        flash[:danger] = "Order has not been created\n" + e.message
      end
    end
    redirect_to root_path
  end

  private

  def transfer_cart_items
    @cart.cart_items.each do |item|
      @order.order_items << OrderItem.new(
        book_id: item.book_id,
        quantity: item.quantity,
        price: item.price
      )
    end
  end

end
