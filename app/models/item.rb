class Item < ActiveRecord::Base
  attr_accessible :description, :name, :nonprofit_percentage, :nonprofit_url, :price
  belongs_to :user
end
