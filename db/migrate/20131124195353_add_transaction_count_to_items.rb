class AddTransactionCountToItems < ActiveRecord::Migration
  def change
    add_column :items, :transaction_count, :integer, default: 0
    add_column :items, :quantity, :integer
  end
end
