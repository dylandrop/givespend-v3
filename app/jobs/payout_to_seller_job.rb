class PayoutToSellerJob
  def self.distribute_payment txn_id
    transaction = Transaction.includes(item: [:user]).find(txn_id)
    item = transaction.item
    seller = item.user
    Stripe::Charge.create({
      amount: (item.price * (1 - item.nonprofit_percentage / 100.0)).to_i,
      currency: 'usd',
      customer: transaction.stripe_customer_token,
      description: "Txn: #{txn_id} Item: #{item.id}",
      application_fee: (item.price * item.nonprofit_percentage / 100.0).to_i},
      seller.secret_key
    )
    transaction.update_attribute(:status, "purchased")

    PurchasedItemMailer.notify_seller(txn_id)
    PurchasedItemMailer.notify_buyer(txn_id)
  end
end