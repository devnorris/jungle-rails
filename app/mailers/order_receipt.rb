class OrderReceipt < ApplicationMailer
default from: "no-reply@jungle.com"


def order_receipt(order)
    @order = order
    mail(to: @order.email, subject: "Order id is #{@order.id}" )
  end

end

