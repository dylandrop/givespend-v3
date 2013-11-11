class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.belongs_to :item
      t.string :status
      t.string :stripe_customer_token

      t.timestamps
    end
    add_index :transactions, :item_id
  end
end
