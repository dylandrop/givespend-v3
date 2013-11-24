class Item < ActiveRecord::Base
  attr_accessible :description, :name, :nonprofit_percentage, :nonprofit_url, :price,
    :image_attributes, :quantity
  belongs_to :user
  has_many :transactions
  has_one :image, as: :imageable
  before_save :price_to_cents
  accepts_nested_attributes_for :image

  validates :nonprofit_url, :user, :name, :nonprofit_percentage, :price, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 1 }

  def price_in_dollars
    '%.2f' % (price.to_i/100.0)
  end

  def amount_raised_for_nonprofit
    (price * nonprofit_percentage / 100.0).to_i
  end

  def amount_raised_in_dollars
    '%.2f' % (amount_raised_for_nonprofit / 100.0)
  end

  private

  def price_to_cents
    if self.price_changed?
      self.price *= 100
    end
  end
end
