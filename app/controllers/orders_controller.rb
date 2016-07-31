class OrdersController < ApplicationController
  before_action :require_sign_in

  def new
    order = Order.new
  end

end
