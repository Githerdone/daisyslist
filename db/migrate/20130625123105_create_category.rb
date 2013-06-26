class CreateCategory < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.timestamps
    end
    create_table :posts do |t|
      t.string :name
      t.string :email
      t.integer :price
      t.string :item
      t.references :category
    end
  end
end

