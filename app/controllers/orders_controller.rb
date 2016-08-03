class OrdersController < ApplicationController
  before_action :require_sign_in

  def new
    order = Order.new
  end

  def create
    @order = current_user.orders.build
  end

end
