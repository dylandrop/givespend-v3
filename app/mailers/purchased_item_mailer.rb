class PurchasedItemMailer < ActionMailer::Base
  default from: "Givespend <admin@givespend.com>"
  def notify_buyer txn_id
    @transaction = Transaction.find(txn_id)
    mail subject: "Thanks for shopping on Givespend", to: @transaction.email
  end

  def notify_seller txn_id
    @transaction = Transaction.find(txn_id)
    mail subject: "Someone has bought #{@transaction.item.name}", to: @transaction.item.user.email
  end
end