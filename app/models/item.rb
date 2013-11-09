class Item < ActiveRecord::Base
  attr_accessible :description, :name, :nonprofit_percentage, :nonprofit_url, :price,
    :image_attributes
  belongs_to :user
  has_one :image, as: :imageable

  accepts_nested_attributes_for :image
end
