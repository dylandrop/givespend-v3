class PayoutToSellerJob
  include Sidekiq::Worker

  def perform txn_id
    transaction = Transaction.includes(item: [:user]).find(txn_id)
    item = transaction.item
    seller = item.user
    Stripe::Charge.create({
      amount: item.price,
      currency: 'usd',
      customer: transaction.stripe_customer_token,
      description: "Txn: #{txn_id} Item: #{item.id}",
      application_fee: (item.price * item.nonprofit_percentage / 100.0).to_i},
      seller.secret_key
    )
    transaction.update_attribute(:status, "purchased")
  rescue Exception => e
    logger.debug "#{e.exception}"
    logger.debug "#{e.backtrace}"
    raise e
  end
end