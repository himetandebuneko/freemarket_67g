class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false, index: true
      t.string :detail, null: false, index: true
      t.integer :size_id, null: false
      t.integer :price, null: false
      t.integer :status_id
      t.integer :condition_id, null: false
      t.integer :shippingaddress_id, null: false
      t.integer :shippingdate_id, null: false
      t.string :buyer, default: ""
      t.string :seller
      t.integer :payer_id, null: false

      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.timestamps
    end
  end
end
