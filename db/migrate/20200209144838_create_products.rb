class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false, index: true
      t.string :detail, null: false, index: true
      t.string :size, null: false
      t.integer :price, null: false
      t.string :status
      t.string :condition, null: false
      t.string :shippingaddress, null: false
      t.string :shippingdate, null: false
      t.string :buyer, default: ""
      t.string :seller
      t.string :payer

      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.timestamps
    end
  end
end
