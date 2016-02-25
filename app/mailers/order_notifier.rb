class OrderNotifier < ApplicationMailer
default from: 'AIRBOOK <qmau94@gmail.com>'
 def received(order)
  @order = order
  mail to: order.email, subject: 'AIRBOOK Order Confirmation'
end
  def shipped(order)
    @order = order
    mail to: order.email, subject: 'AIRBOOK Order Shipped'
  end
end
