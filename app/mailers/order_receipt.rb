class OrderReceipt < ApplicationMailer
default from: "no-reply@jungle.com"


def order_receipt(user, order)
    @user = user
    @order = order
    mail(to: @user.email, subject: 'Welcome')
  end

end

