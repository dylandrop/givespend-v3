class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.references :imageable, polymorphic: true
      t.timestamps
    end
    add_attachment :images, :content
  end
end
