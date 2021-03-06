class OrderMailer < ApplicationMailer
  helper :orders

  def notify_on_successful_order(customer, order)
    @customer = customer
    @order = order

    mail to: @customer.email,
    subject: 'Order Confirmation - EredBook'
  end

  def send_password_reset_link(customer)
    @customer = customer

    mail to: @customer.email,
    subject: 'Reset Password - EredBook'
  end

end
