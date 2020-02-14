class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|
      t.integer :condition_id
      t.string :condition
      t.integer :shippingdate_id
      t.string :shippingdate
      t.integer :payer_id
      t.string :payer

      t.timestamps
    end
  end
end
