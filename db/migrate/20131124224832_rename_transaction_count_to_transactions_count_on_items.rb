class RenameTransactionCountToTransactionsCountOnItems < ActiveRecord::Migration
  def up
    rename_column :items, :transaction_count, :transactions_count
  end

  def down
    rename_column :items, :transactions_count, :transaction_count
  end
end
