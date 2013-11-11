class Transaction < ActiveRecord::Base
  belongs_to :item
  attr_accessible :status, :stripe_customer_token
end
