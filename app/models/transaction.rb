class Transaction < ActiveRecord::Base
  belongs_to :item
  attr_accessor :stripe_card_token
  attr_accessible :status, :stripe_customer_token, :stripe_card_token

  def save_with_card
    if valid?
      customer = Stripe::Customer.create(card: stripe_card_token)
      self.stripe_customer_token = customer.id
      save!
      PayoutToSellerJob.perform_async(self.id)
    end
  rescue Stripe::InvalidRequestError => e
    logger.error "Stripe error while creating customer: #{e.message}"
    errors.add :base, "There was a problem with your credit card."
    false
  end
end
