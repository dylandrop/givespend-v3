class AddShippingInfoAndEmailToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :shipping_info, :string
    add_column :transactions, :email, :string
  end
end
