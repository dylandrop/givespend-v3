FactoryGirl.define do
  factory :item do
    name "My great item"
    description "My great item"
    price 1000
    nonprofit_url "wwf.org"
    nonprofit_percentage 10
    user { create :user }
  end

  factory :user do
    email "fsd@fds.com"
    password { 'password' }
    password_confirmation { 'password' }
  end

end