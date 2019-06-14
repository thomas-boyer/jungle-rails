class ReceiptMailer < ApplicationMailer
  default from: 'noreply@jungle.com'

  def receipt_email(order)
    @order = order
    mail(to: @order.email, subject: "Order confirmation: Order ##{@order.id}")
  end
end
