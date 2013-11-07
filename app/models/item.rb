class Item < ActiveRecord::Base
  attr_accessible :description, :name, :nonprofit_percentage, :nonprofit_url, :price
end
