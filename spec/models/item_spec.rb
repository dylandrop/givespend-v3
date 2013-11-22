require 'spec_helper'
describe Item do
  it { should validate_presence_of :name }
  it { should validate_presence_of :nonprofit_url }
  it { should validate_presence_of :user }
  it { should validate_presence_of :price }
  it { should validate_presence_of :nonprofit_percentage }
  
  it { should_not allow_value(0).for(:price) }
  it { should allow_value(123).for(:price) }

  describe '#price_to_cents' do
    it 'should convert my price when I give it a decimal value' do
      item = create(:item, price: 10.0)
      item.price.should == 1000
    end

    it 'should keep my price as an int when I give it an integer' do
      item = create(:item, price: 10)
      item.price.should == 1000
    end

    it 'doesn\'t alter the price if i resave or validate it' do
      item = create(:item, price: 10)
      item.price.should == 1000
      item.valid?
      item.price.should == 1000
      item.save!
      item.price.should == 1000
    end
  end
end