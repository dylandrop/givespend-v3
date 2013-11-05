class AddSecretKeyAndUidToUsers < ActiveRecord::Migration
  def change
    add_column :users, :secret_key, :string
    add_column :users, :uid, :string
  end
end
