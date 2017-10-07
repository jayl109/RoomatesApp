class CreateLists < ActiveRecord::Migration[5.0]
  def change
    create_table :lists do |t|
      t.string :item
      t.integer :quantity
      t.belongs_to :user, default: nil
      t.timestamps
    end
  end
end
