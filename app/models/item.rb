class Item < ActiveRecord::Base
  attr_accessible :description, :name, :nonprofit_percentage, :nonprofit_url, :price,
    :image_attributes
  belongs_to :user
  has_one :image, as: :imageable
  before_save :price_to_cents
  accepts_nested_attributes_for :image
  
  def price_in_dollars
    '%.2f' % (price.to_i/100.0)
  end

  private

  def price_to_cents
    if self.price_changed?
      self.price *= 100
    end
  end
end
