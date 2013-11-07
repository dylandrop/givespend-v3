class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.string :nonprofit_url
      t.integer :nonprofit_percentage

      t.timestamps
    end
  end
end
