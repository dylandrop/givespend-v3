class Transaction < ActiveRecord::Base
  belongs_to :item, counter_cache: true
  attr_accessor :stripe_card_token
  attr_accessible :status, :stripe_customer_token, :stripe_card_token

  validates :email, presence: true
  validate :enough_quantity_is_available

  after_create :process_payment_and_notifications

  def save_with_card
    if valid?
      customer = Stripe::Customer.create(card: stripe_card_token)
      self.stripe_customer_token = customer.id
      save!
    end
  rescue Stripe::InvalidRequestError => e
    logger.error "Stripe error while creating customer: #{e.message}"
    errors.add :base, "There was a problem with your credit card."
    false
  end

  private
  
  def process_payment_and_notifications
    PayoutToSellerJob.perform_async(self.id)
    PurchaseNotificationJob.perform_async(self.id)
  end

  def enough_quantity_is_available
    errors.add(:base, "We've sold out of this item") if item.transactions_count >= item.quantity
  end
end
